TAILWIND := ./tailwindcss

.PHONY: deps start build hugo-install tailwind-install tailwind-download watch tailwind-build cv dev-cv

# Install dependencies (only once)
deps:
	bun add puppeteer

# Install Hugo through Homebrew if it is not already available
hugo-install:
	@if command -v hugo >/dev/null 2>&1; then \
		exit 0; \
	elif command -v brew >/dev/null 2>&1; then \
		brew install hugo; \
	else \
		echo "Hugo is required: https://gohugo.io/installation/"; \
		exit 1; \
	fi

# Download Tailwind CSS if the local standalone binary is missing
tailwind-install:
	@if [ ! -x "$(TAILWIND)" ]; then \
		case "$$(uname -s)-$$(uname -m)" in \
			Darwin-arm64) platform="macos-arm64" ;; \
			Darwin-x86_64) platform="macos-x64" ;; \
			Linux-aarch64|Linux-arm64) platform="linux-arm64" ;; \
			Linux-x86_64) platform="linux-x64" ;; \
			*) echo "Unsupported platform: $$(uname -s) $$(uname -m)"; exit 1 ;; \
		esac; \
		echo "Installing Tailwind CSS for $$platform..."; \
		curl -fsSL \
			-o "$(TAILWIND)" \
			"https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-$$platform"; \
		chmod +x "$(TAILWIND)"; \
	fi

# Start Hugo server (including drafts) and watch Tailwind CSS for changes
start: hugo-install tailwind-install
	hugo server -D & \
	(sleep 2 && open http://localhost:1313/) & \
	$(TAILWIND) -i ./assets/css/tailwind.css \
		-o ./static/css/tailwind.css --watch

# Build production site with minification
build: hugo-install
	HUGO_ENVIRONMENT=production hugo --minify

# Backwards-compatible alias
tailwind-download: tailwind-install

# Watch for CSS changes and rebuild automatically
watch: tailwind-install
	$(TAILWIND) -i ./assets/css/tailwind.css \
		-o ./static/css/tailwind.css --watch

# Build Tailwind CSS for production (minified)
tailwind-build: tailwind-install
	$(TAILWIND) -i ./assets/css/tailwind.css \
		-o ./static/css/tailwind.css --minify

# Generate PDF from a live site using the external script
cv: deps
	# Replace URL and filename as needed
	bun cv.mjs https://www.v01.io/pages/services/ cv.pdf

# Generate PDF from local development site
dev-cv: deps
	bun cv.mjs http://localhost:1313/pages/services/ dev-cv.pdf
