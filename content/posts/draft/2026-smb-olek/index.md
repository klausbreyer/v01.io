---
title: "SMB Olek, an Apple TV app that just plays what is on your NAS"
date: 2026-09-06
draft: true
categories: ["Shipped"]
image: preview.png
linkedin: |
  I built an Apple TV app because I wanted to watch our travel videos on the couch. That was the whole requirement.

  Our videos live on a Samba share on a Raspberry Pi. Every app I tried was either annoyingly complicated, because it also serves five other use cases, or it wanted yet another server running on the Pi or the NAS. And the big files, 15 GB of Raja Ampat, either did not start at all or stuttered every few seconds.

  So I wrote SMB Olek. Native tvOS, SwiftUI, three screens: network, folder, video. It streams straight from the share. No copying, no library, no account, no server. Even the 15 GB file plays and seeks.

  Version 1.0 is waiting for App Store review. Link in the first comment.

  The long version: https://www.v01.io/posts/2026/09/smb-olek/
  The German version: https://www.v01.io/de/posts/2026/09/smb-olek/
---

Our travel videos live on a Raspberry Pi in the hallway. One Samba share, one folder per trip: Costa Rica, Japan, Sulawesi, [Polynesia]({{< relref "/posts/2025/09/polynesia/" >}}), Raja Ampat. Some of these files are big. The Raja Ampat cut is 15 GB.

All I wanted was to sit on the couch and play them on the Apple TV.

## Everything else does too much or needs too much

I tried the apps that exist. They come in two groups.

The first group is annoyingly complicated, because the same app also serves five other use cases: a movie library with cover art from the internet, subtitles, a music player, cloud storage, playlists. Getting to my one folder took more clicks than watching the video.

The second group needs another server. Plex, Jellyfin and friends want a daemon on the Pi or the NAS that indexes, transcodes and updates itself. I do not want to run a media server. I have a folder.

And both groups struggled with the big files. The 15 GB file either did not start, or it started and stuttered every few seconds.

So I did what I had done with [Texttile]({{< relref "/posts/2026/08/texttile/" >}}) a few weeks earlier. I built the small thing myself.

![SMB Olek: plays videos from your SMB shares](preview.png)

## What SMB Olek does

Pick a device, open a share, open a folder, play a video. That is the whole app.

- The Apple TV finds SMB servers in the local network via Bonjour. If yours does not announce itself, you enter host and share by hand.
- Shares and subfolders are browsed directly. Folders without videos disappear once they are fully scanned. Backups and AppleDouble clutter stay hidden.
- Every video gets a thumbnail, rendered from a frame of the file itself. Nothing is fetched from the internet.
- Playback streams byte ranges straight from the share. No copying, no waiting for a download. Seeking jumps to the byte offset and continues from there, also beyond the 4 GiB mark.
- The remote does what you expect: play and pause, ten seconds left and right, back closes the video. The controls fade out after four seconds.
- Passwords go into the Keychain. The app never writes to the share.

![The network screen: one Raspberry Pi, found via Bonjour](network.png)

![The share: one folder per trip](share.png)

![The travel folder with thumbnails. Raja Ampat 2022 is 14.82 GB](travel.png)

![Playback with the compact controls: time, title, progress](player.jpg)

## What it is not

No media library. No cover art from the internet. No metadata scraping. No server on the Pi. No account, no analytics, no ads. The interface is black and white and shows your folder names, nothing else.

I built it for one couch and one folder. And I still think a product is only done when there is nothing left to take away.

![The icon: a burning television](icon.png)

## Why native

The app is Swift and SwiftUI with two decoders behind one player. AVFoundation handles HEVC and H.264 with hardware decoding. When AVFoundation cannot read a format, ProRes for example, the app switches to VLC's decoder (TVVLCKit) and the same file plays. The thumbnails fall back the same way.

The SMB part is libsmb2 with a thin Swift wrapper and one patch. Unpatched libsmb2 fails on guest sessions over SMB 3.1.1, because it signs the tree connect without a session key. The patch reads the guest flags the server sends. It does not loosen signing or encryption requirements. If the server demands them for a guest, the connection is refused, as it should be. SMB 2.0.2 through 3.1.1 are tested against the Pi.

And the 15 GB file? Plays, seeks, and keeps playing.

## Try it

SMB Olek is a paid app, 12.99 EUR once, no subscription. Version 1.0 is uploaded to App Store Connect and waiting for review. The link goes here as soon as it is live. The interface is German for now.

You need an SMB 2 or SMB 3 share with your own videos. The app brings no films and needs no account. For protected shares you use the credentials of your server.

I am curious: how do your videos get from the NAS to the TV?
