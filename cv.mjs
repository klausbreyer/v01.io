#!/usr/bin/env bun

import puppeteer from 'puppeteer';
import path from 'path';
import os from 'os';

async function main() {
  const [,, url, filename = 'output.pdf'] = process.argv;
  if (!url) {
    console.error('Usage: gen-pdf.mjs <url> [filename]');
    process.exit(1);
  }

  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.goto(url, { waitUntil: 'networkidle2' });

  const downloadsDir = os.homedir();
  const filePath = path.join(downloadsDir, 'Downloads', filename);
  await page.pdf({ 
    path: filePath, 
    format: 'A4', 
    margin: { top: '1cm', bottom: '1cm', left: '1cm', right: '1cm' }
  });

  await browser.close();
  console.log(`Saved PDF to ${filePath}`);
}

main().catch(err => {
  console.error(err);
  process.exit(1);
});