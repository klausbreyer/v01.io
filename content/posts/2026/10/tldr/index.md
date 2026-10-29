---
title: "tldr.tf, one sentence instead of a 26 minute video"
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

"How To Give Claude Unlimited Usage." 26 minutes. I just want the answer.

My YouTube feed is full of titles like that. A question in the title, the answer somewhere in minute 18. Before that: a sponsor, a recap of the last video, a request to subscribe. I do not blame the creators. The algorithm rewards exactly this. But I open the video, scrub around, give up, and the question stays open.

The usual tools did not fix it for me. Browser extensions want to read everything I do. Transcript summarizers only see the words and miss what is on screen, which in a product review or a talk is half the content. And every one of them wants an account and a history of what I watched.

So I built the small thing myself. It is called [tldr.tf](https://tldr.tf) and it is open source. Paste a link, get one sentence and a few points.

![tldr.tf with a summary of Theo's video "How To Give Claude Unlimited Usage"](preview.png)

## What it does

One box takes any address. A web page or a YouTube video, you do not have to say which.

- **One sentence, a few points.** The tldr says what the source claims, not what it is about. Not "Theo talks about running Claude agents" but "Theo runs Claude agents for weeks by pairing several subscriptions with automated verification loops." Then three to six points with the names, numbers and examples.
- **Gemini watches the video.** No transcript. The model gets the video address and sees picture and sound. A product review shows the product, a talk shows its slides, and the summary knows.
- **Opinions carry a name.** When a creator argues something, the summary says so: "According to Theo ...". A disputed claim is never stated as fact.
- **Nothing to summarize? It says so.** A paywall, a login wall, an error page: the tldr says that plainly and invents nothing.
- **German or English.** The summary comes in your language, whatever the language of the source. A Japanese video gives a German summary if that is what you read.
- **Several links at once.** Paste three, get three summaries, newest first.

A page takes a few seconds. A long video takes up to a minute, and the page says so while Gemini watches.

## What it is not

There is no account, no history and no database. A link comes in, a summary goes out, and nothing outlives the request. Reload the page and the list is gone. That is not a missing feature. It is the reason I trust it with my own links, and the reason you can too.

There is no browser extension, no app, no chat with the video. PDFs and files do not work yet. Private and age-restricted videos fail, because Google will not show them to the model.

A product is done when there is nothing left to take away.

## Why Elixir and Gemini

The whole product is one function: parse the address, fetch the page or hand over the video, make one model call with a strict JSON schema, return a sentence and a list. Phoenix LiveView shows the waiting state and the result without a line of frontend framework. Every link runs in its own process, so three links at once are three processes, not a queue.

Gemini is the one model family that watches a YouTube video from its address. The call goes through OpenRouter to Gemini 3.8 Flash.

The whole thing runs in one container on Bunny in Germany. Every push to `main` deploys it.

## Try it

Go to [tldr.tf](https://tldr.tf) and paste the next video you do not want to watch.

The code is at [github.com/klausbreyer/tldr](https://github.com/klausbreyer/tldr). You can run it yourself if you want to: clone the repository, put your own OpenRouter key into `.env` and run `make start`. The README has the rest.
