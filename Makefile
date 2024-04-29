start:
	hugo server --buildDrafts & ./tailwindcss -i ./assets/css/tailwind.css -o ./static/css/tailwind.css --watch

build:
	HUGO_ENVIRONMENT=production hugo --minify

tailwind-download:
ifeq ($(shell uname -s), Darwin)
	curl -sLO https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-macos-arm64
else ifeq ($(shell uname -s), Linux)
	curl -sLO https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64
endif
	mv tailwindcss-* tailwindcss
	chmod +x tailwindcss

watch:
	./tailwindcss -i ./assets/css/tailwind.css -o ./static/css/tailwind.css --watch

tailwind-build:
	./tailwindcss -i ./assets/css/tailwind.css -o ./static/css/tailwind.css --minify

