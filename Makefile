# Makefile

# Install dependencies (only once)
deps:
	bun add puppeteer

# Start Hugo server and watch Tailwind CSS for changes
start:
	hugo server & \
	./tailwindcss -i ./assets/css/tailwind.css \
		-o ./static/css/tailwind.css --watch

# Build production site with minification
build:
	HUGO_ENVIRONMENT=production hugo --minify

# Download the latest Tailwind CSS binary for macOS or Linux
tailwind-download:
ifeq ($(shell uname -s), Darwin)
	# Download macOS ARM64 binary
	curl -sLO \
		https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-macos-arm64
else ifeq ($(shell uname -s), Linux)
	# Download Linux x64 binary
	curl -sLO \
		https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64
endif
	# Rename and make executable
	mv tailwindcss-* tailwindcss
	chmod +x tailwindcss

# Watch for CSS changes and rebuild automatically
watch:
	./tailwindcss -i ./assets/css/tailwind.css \
		-o ./static/css/tailwind.css --watch

# Build Tailwind CSS for production (minified)
tailwind-build:
	./tailwindcss -i ./assets/css/tailwind.css \
		-o ./static/css/tailwind.css --minify

# Generate PDF from a live site using the external script
cv: deps
	# Replace URL and filename as needed
	bun cv.mjs https://www.v01.io/pages/services/ cv.pdf

# Generate PDF from local development site
dev-cv: deps
	bun cv.mjs http://localhost:1313/pages/services/ dev-cv.pdf
