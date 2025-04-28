# Dependencies nur einmal installieren
deps:
	bun add puppeteer

# Hugo-Server & Tailwind-Watch bleiben unverändert
start:
	hugo server & ./tailwindcss -i ./assets/css/tailwind.css -o ./static/css/tailwind.css --watch

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

# CV via Puppeteer mit bun
cv: deps
	bun -e "import puppeteer from 'puppeteer'; import path from 'path'; import os from 'os'; \
	(async()=>{ \
	  const browser = await puppeteer.launch(); \
	  const page = await browser.newPage(); \
	  await page.goto('https://www.v01.io/pages/services/', { waitUntil: 'networkidle2' }); \
	  const filePath = path.join(os.homedir(), 'Downloads', 'cv.pdf'); \
	  await page.pdf({ path: filePath, format: 'A4', margin: { top:'1cm',bottom:'1cm',left:'1cm',right:'1cm' } }); \
	  await browser.close(); \
	})()"

# Lokale Dev-CV
dev-cv: deps
	bun -e "import puppeteer from 'puppeteer'; import path from 'path'; import os from 'os'; \
	(async()=>{ \
	  const browser = await puppeteer.launch(); \
	  const page = await browser.newPage(); \
	  await page.goto('http://localhost:1313/pages/services/', { waitUntil: 'networkidle2' }); \
	  const filePath = path.join(os.homedir(), 'Downloads', 'dev-cv.pdf'); \
	  await page.pdf({ path: filePath, format: 'A4', margin: { top:'1cm',bottom:'1cm',left:'1cm',right:'1cm' } }); \
	  await browser.close(); \
	})()"