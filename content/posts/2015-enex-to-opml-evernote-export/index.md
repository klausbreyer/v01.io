---
title: "enex-to-opml - Evernote Export"

date: 2015-08-18T13:50:38+02:00
publishdate: 2015-08-18T13:50:38+02:00
lastmod: 2020-05-15T12:00:59+02:00
draft: false
tags:
  [
    "Evernote",
    "Workflowy",
    "Node.js",
    "npm",
    "migration",
    "command line tool",
    "XML",
    "OPML",
  ]
aliases:
  - /de/posts/enex-to-opml-evernote-export/
  - /posts/enex-to-opml-evernote-export/
categories: ["Open Source"]
---

Whoever (like me) is currently migrating from [Evernote](https://evernote.com/intl/de/) to [Workflowy](https://workflowy.com/invite/2ede5294.lnx)\* would like to take their notes with them. Unfortunately Evernote is quite closed about that. So I wrote a small command line tool in Node to convert the unspeakable XML of the .enex files into cleaner .ompl for Workflowy.

## Features

- Each note title becomes a Workflowy entry.
- Note content and HTML (stripped) are used for note content.

I wrote it in Node.js and then published it [as npm](https://www.npmjs.com/package/enex-to-opml). The repository [at github](https://github.com/klausbreyer/enex-to-opml).

## Installation

To use it you only need Node.JS and of course npm. Then you can install it like this:

```
npm install enex-to-opml -g
```

## summary

The use is just as easy. Just go to the folder with your .enex files exported from Evernote and call the script with them as parameters.

```
cd /path/to/your/evernote-exports/ enex-to-ompl export.enex
```

You will get an export.ompl file, which you can copy and paste into Workflowy.

## Step by Step

### Export 1st Evernote notes

![](evernote-1024x590.png)

### call script

```
$ enex-to-opml example.enex Processing: example.enex Saved: example.opml $
```

### copy .opml file in text editor

![](code.png)

### import into Workflowy

![](workflowy.png)
