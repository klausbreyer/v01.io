// Issues: category needs to be categories and there needs to be a [" "] around it.
// it should ignore open source and bookshelf!

package main

import (
	"bufio"
	"bytes"
	"encoding/json"
	"fmt"
	"io"
	"io/fs"
	"io/ioutil"
	"net/http"
	"os"
	"path/filepath"
	"strings"
	"time"
)

func main() {
	allowedCategories := []string{
		"Product",
		"Engineering",
		"Agile",
		"Leadership",
		"Remote",
		"Productivity",
		"Org",
		"Meta",
		"Open Source",
	}

	apiKey := os.Getenv("OPENAI_API_KEY")
	if apiKey == "" {
		fmt.Println("Please set the OPENAI_API_KEY environment variable.")
		return
	}

	rootDir := "content/posts"

	err := filepath.WalkDir(rootDir, func(path string, d fs.DirEntry, err error) error {
		if err != nil {
			return err
		}
		if !d.IsDir() && filepath.Ext(path) == ".md" {
			err := processFile(path, allowedCategories, apiKey)
			if err != nil {
				fmt.Printf("Error processing file %s: %v\n", path, err)
			}
		}
		return nil
	})

	if err != nil {
		fmt.Printf("Error walking the path %s: %v\n", rootDir, err)
	}
}

func processFile(path string, allowedCategories []string, apiKey string) error {
	fmt.Printf("Processing file: %s\n", path)

	contentBytes, err := ioutil.ReadFile(path)
	if err != nil {
		return err
	}
	content := string(contentBytes)

	frontMatter, body, err := splitFrontMatter(content)
	if err != nil {
		return err
	}

	// Remove existing categories from front matter
	frontMatter = removeCategories(frontMatter)

	// Get new category from OpenAI API
	newCategory, err := getNewCategory(body, allowedCategories, apiKey)
	if err != nil {
		return err
	}

	// Update front matter with new category
	frontMatter = addCategory(frontMatter, newCategory)

	// Reconstruct the content
	newContent := fmt.Sprintf("---\n%s\n---\n%s", frontMatter, body)

	// Write back to file
	err = ioutil.WriteFile(path, []byte(newContent), 0644)
	if err != nil {
		return err
	}

	return nil
}

func splitFrontMatter(content string) (string, string, error) {
	scanner := bufio.NewScanner(strings.NewReader(content))
	var frontMatterLines []string
	var bodyLines []string

	inFrontMatter := false
	for scanner.Scan() {
		line := scanner.Text()
		if line == "---" {
			if !inFrontMatter {
				inFrontMatter = true
			} else {
				// End of front matter
				inFrontMatter = false
				// Consume the rest of the content as body
				for scanner.Scan() {
					bodyLines = append(bodyLines, scanner.Text())
				}
				break
			}
		} else if inFrontMatter {
			frontMatterLines = append(frontMatterLines, line)
		} else {
			bodyLines = append(bodyLines, line)
		}
	}

	if err := scanner.Err(); err != nil {
		return "", "", err
	}

	frontMatter := strings.Join(frontMatterLines, "\n")
	body := strings.Join(bodyLines, "\n")

	return frontMatter, body, nil
}

func removeCategories(frontMatter string) string {
	lines := strings.Split(frontMatter, "\n")
	var newLines []string
	skip := false
	for _, line := range lines {
		trimmed := strings.TrimSpace(line)
		if strings.HasPrefix(trimmed, "categories:") || strings.HasPrefix(trimmed, "category:") {
			// Skip this line and possibly the following lines if it's a list
			skip = true
			continue
		}
		if skip {
			if strings.HasPrefix(trimmed, "-") || trimmed == "" {
				continue
			} else {
				skip = false
			}
		}
		newLines = append(newLines, line)
	}
	return strings.Join(newLines, "\n")
}

func addCategory(frontMatter string, category string) string {
	var buffer bytes.Buffer
	buffer.WriteString(frontMatter)
	if !strings.HasSuffix(frontMatter, "\n") {
		buffer.WriteString("\n")
	}
	buffer.WriteString("category: ")
	buffer.WriteString(category)
	buffer.WriteString("\n")
	return buffer.String()
}

func getNewCategory(content string, allowedCategories []string, apiKey string) (string, error) {
	prompt := fmt.Sprintf(`Given the following content, select the single most appropriate category from the list below. Only select one category, and only from the list. If none apply, return "Uncategorized".

Allowed Categories:
%s

Content:
%s

Response:`, strings.Join(allowedCategories, ", "), content)

	requestBody := map[string]interface{}{
		"model": "gpt-4",
		"messages": []map[string]string{
			{
				"role":    "user",
				"content": prompt,
			},
		},
		"max_tokens":  50,
		"temperature": 0,
		"n":           1,
	}

	maxRetries := 5
	retryCount := 0

	for {
		newCategory, err := callOpenAIAPI(requestBody, allowedCategories, apiKey)
		if err != nil {
			// Check if the error is a rate limit error
			if isRateLimitError(err) {
				retryCount++
				if retryCount > maxRetries {
					return "", fmt.Errorf("exceeded maximum retries due to rate limiting")
				}
				fmt.Println("Rate limit exceeded. Waiting for 1 minute before retrying...")
				time.Sleep(1 * time.Minute)
				continue
			} else {
				return "", err
			}
		}
		return newCategory, nil
	}
}

func callOpenAIAPI(requestBody map[string]interface{}, allowedCategories []string, apiKey string) (string, error) {
	requestData, err := json.Marshal(requestBody)
	if err != nil {
		return "", err
	}

	req, err := http.NewRequest("POST", "https://api.openai.com/v1/chat/completions", bytes.NewBuffer(requestData))
	if err != nil {
		return "", err
	}
	req.Header.Set("Content-Type", "application/json")
	req.Header.Set("Authorization", fmt.Sprintf("Bearer %s", apiKey))

	client := &http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		return "", err
	}
	defer resp.Body.Close()

	bodyBytes, err := io.ReadAll(resp.Body)
	if err != nil {
		return "", err
	}

	if resp.StatusCode != http.StatusOK {
		// Try to parse the error response
		var errorResponse struct {
			Error struct {
				Message string      `json:"message"`
				Type    string      `json:"type"`
				Param   interface{} `json:"param"`
				Code    string      `json:"code"`
			} `json:"error"`
		}

		err = json.Unmarshal(bodyBytes, &errorResponse)
		if err != nil {
			return "", fmt.Errorf("OpenAI API error: %s", string(bodyBytes))
		}

		return "", fmt.Errorf("OpenAI API error: %s", errorResponse.Error.Code)
	}

	var responseData struct {
		Choices []struct {
			Message struct {
				Content string `json:"content"`
			} `json:"message"`
		} `json:"choices"`
	}

	err = json.Unmarshal(bodyBytes, &responseData)
	if err != nil {
		return "", err
	}

	if len(responseData.Choices) == 0 {
		return "", fmt.Errorf("no choices returned from OpenAI API")
	}

	contentResponse := strings.TrimSpace(responseData.Choices[0].Message.Content)

	// Check if the response is within allowed categories
	for _, category := range allowedCategories {
		if strings.EqualFold(contentResponse, category) {
			return category, nil
		}
	}

	if strings.EqualFold(contentResponse, "Uncategorized") {
		return "Uncategorized", nil
	}

	return "", fmt.Errorf("received invalid category: %s", contentResponse)
}

func isRateLimitError(err error) bool {
	if err == nil {
		return false
	}
	errMsg := err.Error()
	if strings.Contains(errMsg, "rate_limit_exceeded") || strings.Contains(errMsg, "Rate limit") {
		return true
	}
	return false
}
