# Agent Instructions

- Never use em dashes (U+2014) in any output. Use commas, parentheses, colons, or separate sentences instead.
- After changing Karabiner configuration, restart Karabiner-Elements so the new configuration is loaded.
- Never create a Git commit unless the user explicitly asks for it.
- When setting a preview image for a post, every language version needs its own file with the language suffix: `image: preview.jpg` in `index.md` and `image: preview.de.jpg` in `index.de.md`. A German post referencing plain `preview.jpg` does not work, so copy the file to `preview.de.jpg` in the post folder.
- Planned LinkedIn posts for an article go into the article's frontmatter as a `linkedin: |` multiline block (see `2026/08/breadboarding` and `2026/08/franken-domains`). For bilingual posts, put the English text in `index.md` and the German text in `index.de.md`. Once the LinkedIn post is published, add its URL as `social:`.
