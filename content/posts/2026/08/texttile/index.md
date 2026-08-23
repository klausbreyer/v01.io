---
title: "Texttile, a blog engine for people who write together"
date: 2026-08-22
aliases:
  - /posts/2026-texttile/
categories: ["Engineering"]
image: preview.png
linkedin: |
  Every programmer ships a CMS once. Here is mine.

  My wife and I have blogged about every trip since our honeymoon. One of us writes, the other reads along and adds the photos and videos from the phone. But WordPress never got that part. There eis only support for one author, and a bunch of plugins nobody maintains.

  So I wrote Texttile. Two people in the same entry at the same time, photos and videos as first class citziens included. 
  
  Technically we are speaking of Elixir, one Docker container, SQLite inside, nothing loaded from outside. 100% Open source.

  The demo on the homepage starts a real blog for you for 24 hours, and you can keep it. Link in the first comment.

  Comment:
  Demo and source: https://www.texttile.blog
  The long version: https://www.v01.io/posts/2026/08/texttile/
---

Since our honeymoon in 2015, my wife and I have blogged about every trip we take. For the people at home, for ourselves later, and by now for our children. In [Polynesia]({{< relref "polynesia" >}}) in 2025 we spent three weeks and kept one journal between us. We took turns writing. Whoever was not writing added photos and videos.

The text was never the hard part. The photos and videos were. Picking them was work. Getting them out of the phone and into the CMS was the real pain: on the phone, on a slow line, far from home. And the CMS was WordPress: updates every few weeks, a plugin its author had abandoned, and bots at the login page around the clock. 

So after [Mexico]({{< relref "mexico" >}}) this year I did what every programmer apparently has to do once. I wrote my own CMS. It is called Texttile, it is open source, and it is written in Elixir.

## What it does differently

Most blog engines give an entry one author and a lock. Texttile gives it company. Two people can have the same entry open. One of them has the text and types, the other watches the words arrive and can take the text over with one tap. The gallery is never locked: both of you drag tiles into place at the same time, and you see each other doing it. A tile is a photo or a video, and the gallery treats them the same. An entry is text and tiles. That is the name.

![Your screen: you write while the other person reads along](writing-you.png)

![The other person's screen showing the same entry](writing-other.png)

Both screens show the same entry at the same moment. The writer sees a purple status bar and can edit the text. The other person sees an orange status bar and a read-only editor. Both can still work on the gallery. One click lets the other person take over the text.

Travel shaped the rest:

- Texttile loads nothing from outside. No CDN, no tracker, no captcha, no hosted font, no cookie banner. A reader's browser talks to your server and nothing else.
- It stays light enough for a slow line: small pages, little JavaScript, and pictures only as large as the screen asks for.
- Videos come from your own server. Drop one in and Texttile converts it once, with ffmpeg, into one MP4 every browser plays, with a poster frame. One at a time, at the lowest priority, so the blog stays quick while it works. No YouTube embed, no player from anywhere else.
- Texttile stores your Markdown byte for byte. A version diff shows real edits and nothing else.
- One container, one folder. Phoenix, LiveView and SQLite live in one Docker image. Everything is in `/data`. Move that directory and you move the blog.
- Comments, a newsletter, and statistics stay on your server. Texttile uses no cookies and stores no IP addresses.
- English and German, for now.

## What it is not

There are no roles, no permission matrix, no plugins, no themes marketplace. Everybody with an account is an admin. I built it for people who trust each other, because that is who writes a blog together. A part of Texttile is right when nothing is left to take away.

## Why Elixir

Two people editing one thing at the same time is what the BEAM was made for. The lock is a GenServer, the keystrokes travel over PubSub, and the whole thing runs on one small machine next to a SQLite file. No Redis, no queue, no second service.

## Try it

Run it on your own machine:

```sh
docker run -d --name texttile \
  -p 4000:4000 \
  -v texttile-data:/data \
  -e SECRET_KEY_BASE="$(openssl rand -base64 48)" \
  -e PHX_HOST=localhost \
  -e ADMIN_USERS=you@example.com \
  ghcr.io/texttile-blog/texttile:3
```

Or start a demo at [www.texttile.blog](https://www.texttile.blog). You get a real Texttile of your own for 24 hours. If you like it, you can keep it. If not, it goes to sleep and is deleted 30 days later, with everything in it. Our own travel blog from Mexico runs on it too, at [demo.texttile.blog](https://demo.texttile.blog), if you want to see it from the reader's side.

The code is at [github.com/texttile-blog/texttile](https://github.com/texttile-blog/texttile). I would like to hear what you think, and especially what is missing for the way you blog.

<video autoplay muted playsinline preload="metadata" poster="writing-poster.jpg" width="1080" height="1080" style="max-width:100%;height:auto">
  <source src="writing.mp4" type="video/mp4">
  <img src="writing-poster.jpg" alt="Two screens, one entry: one person writes, the other reads along and can take over">
</video>
