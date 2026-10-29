---
title: "tldr.tf, a summary for any link"
date: 2026-10-29
categories: ["Open Source", "Shipped"]
image: preview.png
linkedin: |
  Videos with clickbait titles annoy me. And my YouTube feed often has more interesting videos than I have time for. To sort them out, I used to ask Gemini via the API (it can watch YouTube videos) to summarize the videos for me. But that was always a bit of a hassle, because the Gemini app can't do it.

  So I built myself a little service, and you are welcome to use it too. It is called tldr.tf, and it is open source too, if you would rather host it yourself.

  Just paste a link. Get a summary. Tokens are on me!
  I don't track anything there, so you have to tell me yourself what you use it for and what you think. Curious to hear your feedback :)

  Try it: https://tldr.tf
  The long version: https://www.v01.io/posts/2026/10/tldr/
  The German version: https://www.v01.io/de/posts/2026/10/tldr/
---

Videos with clickbait titles annoy me. And my YouTube feed often has more interesting videos than I have time for.

For a while I sorted them out by hand. I sent the video address to the Gemini API and asked for a summary. Gemini can watch a YouTube video from its address, picture and sound. Hardly anyone knows that, because the Gemini app cannot do it. Only the API can.

That worked, but it was a hassle every time: open a terminal, find the request, paste the address, read JSON.

So I built a small service around it. It is called [tldr.tf](https://tldr.tf), and it is open source. Paste a link, get a summary.

![tldr.tf with a summary of Theo's video "How To Give Claude Unlimited Usage"](preview.png)

## What it does

- A web page or a YouTube video, one box takes both.
- The summary is one sentence and three to six points. The sentence says what the source claims, not what it is about. The points keep the names, numbers and examples.
- For a video, Gemini watches the video itself. There is no transcript in between. When a talk shows a slide or a review shows a product, that is in the summary.
- When somebody argues an opinion, the summary names them: "According to Theo ...".
- When there is nothing to summarize, because of a paywall or a login, the summary says so instead of making something up.
- German or English, whatever the language of the source.
- Several links at once. The links go into the address bar, so you can share the page with its summaries as one link.

A web page takes a few seconds. A long video takes up to a minute.

## What it is not

There is no account, no history and no database. I do not store the links or the summaries, and I do not track who uses it. If you want me to know what you use it for, you have to tell me.

PDFs and other files do not work yet. Private and age restricted videos do not work either, because Google does not show them to the model. There is no browser extension and no app.

A product is done when there is nothing left to take away.

## Why Elixir and Gemini

Gemini is the only model I know that watches a YouTube video from its address. tldr.tf sends the address to Gemini 3.8 Flash through OpenRouter and gets back a sentence and a list, as JSON with a fixed schema. A web page is fetched first and sent as text.

The app is Phoenix with LiveView. Every link runs in its own process, so three links at once are three processes. The whole thing runs in one container on Bunny in Frankfurt. Every push to `main` deploys it.

## Try it

Go to [tldr.tf](https://tldr.tf) and paste the next video you are not sure is worth your time. Tokens are on me.

The code is at [github.com/klausbreyer/tldr](https://github.com/klausbreyer/tldr). To run it yourself: clone the repository, put your own OpenRouter key into `.env` and run `make start`. The README has the rest.
