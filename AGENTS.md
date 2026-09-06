# Agent Instructions

## General rules

- Never use em dashes (U+2014) or en dashes (U+2013) in any output: not in posts, commit messages, PR descriptions, or chat. Use a plain hyphen `-` with spaces around it, commas, colons, parentheses, or separate sentences instead.
- Never create a Git commit unless the user explicitly asks for it.
- Never start a dev server on port 1313. That port is reserved for Klaus' own Hugo server. Use a different port, for example `hugo server -D --port 1314`.

## Before writing or editing a blog post

**Re-read this `AGENTS.md` from disk first, every time.** Klaus edits it directly in his editor between turns to refine conventions (frontmatter, style rules, dash policy, categories, etc.), so the version loaded earlier in the conversation may be stale. This applies to any task that creates or modifies files under `content/posts/`. Not required for unrelated tasks (git, layout, config, conversation).

## About the site

Personal site and blog of **Klaus Breyer** (CPTO, Berlin). Built with **Hugo** + **TailwindCSS**, deployed from `main`. Base URL: `https://www.v01.io/`. Two languages: `en` (default) and `de`.

Klaus writes as an experienced B2B SaaS CPTO / startup founder. Topics: leadership, product, process, remote, engineering, open source, plus personal and travel. Tagline: *Move Fast And Break Silos.*

## Repo layout

- `content/posts/YYYY/MM/slug/` - published blog posts, one folder per post (see naming below)
- `content/posts/draft/YYYY-slug/` - drafts, not yet dated into a month (see drafts below)
- `content/pages/` - standalone pages (cv, speaking)
- `content/snippets/` - reusable fragments included via `{{% include file="..." %}}`
- `archetypes/default.md` - Hugo archetype (used by `hugo new`)
- `layouts/` - Hugo templates and shortcodes
- `static/` - static assets served at site root
- `config.toml` - site config

Permalinks are `/posts/:year/:month/:contentbasename/`, so the URL of a post is derived from `date` and the folder name, for example `content/posts/2025/06/slicing-work/` becomes `https://www.v01.io/posts/2025/06/slicing-work/`.

## Post folder & file naming

One folder per post. All assets for the post live inside that folder (images, PDFs, galleries).

Folder path pattern: `content/posts/YYYY/MM/slug/`
- Year and month are directories, taken from the publish date. The folder name itself is only the slug.
- Slug is lowercase kebab-case. It is English for English-primary posts, German for German-only posts. No need to change the folder when a post is German-only.
- Examples: `2025/01/to-think`, `2026/08/texttile`, `2025/09/polynesia`, `2018/07/bali-ein-bericht`.

Files inside the folder:
- `index.md` - English version (default language)
- `index.de.md` - German version
- If a post is **German-only**, use only `index.de.md` (no English stub). Same for English-only: just `index.md`.
- Images live alongside the markdown in the same folder, referenced with relative paths: `![alt](preview.jpg)` or `![alt](./bonbonbon.jpg)`.
- Keep every post image in its post bundle under `content/posts/...`. Never move post images to `static`, `assets`, or another shared directory.
- Preview images are shared by translations and use an unsuffixed filename such as `preview.jpg` or `preview.png`. Do not create language-suffixed preview copies such as `preview.de.jpg`.
- PDFs for talk slides: `YYYY-slug.pdf` or `YYYY-slug.de.pdf`, rendered with the `pdf` shortcode.
- Galleries go in a `gallery/` subfolder inside the post folder (see `2025/09/polynesia/gallery/`).

## Drafts

- Unpublished posts live in `content/posts/draft/YYYY-slug/` and carry `draft: true` in the frontmatter.
- When a draft is published, move the folder to `content/posts/YYYY/MM/slug/` (year and month from the final `date`), drop the `YYYY-` prefix from the folder name, and remove `draft: true`.

## Frontmatter pattern

Frontmatter is YAML between `---` markers. The canonical shape for a new post, based on the most recent posts (`2026/08/texttile`, `2026/08/three-people-is-a-team`, `2026/08/mexico`):

```yaml
---
title: "Post Title in Title Case"
date: 2026-08-28
categories: ["Leadership"]
image: preview.jpg
---
```

Rules and options:
- **title**: always quoted. Title case for English, sentence/title-ish for German. Colons and question marks are fine. No em or en dashes.
- **date**: either a plain `YYYY-MM-DD` or a full RFC3339 timestamp with offset (`2025-01-23T08:33:12+01:00`). Both are in use - prefer plain date unless the time of day matters. The date determines the URL, so it must match the `YYYY/MM/` folders.
- **categories**: always a YAML list with **exactly one entry**. Pick the single most fitting category. Values in use (by frequency): `Bookshelf`, `Engineering`, `Product`, `Personal`, `Process`, `Travel`, `Open Source`, `Speaking`, `Leadership`, `Productivity`, `Remote`, `AI`. Only use multiple categories if Klaus explicitly asks for it.
- **image**: path to the social/preview image relative to the post folder. Often `preview.jpg` / `preview.png`, sometimes the hero image itself.
- **linkedin** (optional): planned LinkedIn post for the article as a `linkedin: |` multiline block (see `2026/08/breadboarding` and `2026/08/franken-domains`). For bilingual posts, put the English text in `index.md` and the German text in `index.de.md`.
- **social** (optional): URL to the LinkedIn post / podcast episode / external canonical where this piece was also shared. Once the planned LinkedIn post is published, add its URL here.
- **aliases** (optional): list of old URLs that should redirect here. Used when a post is renamed or moved. Most older posts carry an alias for their pre-2025 URL such as `/posts/2026-texttile/` or `/posts/bookshelf/2022-plays-well-with-others/`. New posts do not need aliases.
- **read_year** (optional, Bookshelf only): year in which the book was read. Keep this separate from `date`, which records the book's publication year.
- **draft: true** (optional): only for posts under `content/posts/draft/`. Never set `draft: false` explicitly, absence is fine.
- **tags** (optional, rare): YAML list; most posts only use categories.

## Writing style (derived from recent posts)

- Short paragraphs. One idea per paragraph. A single sentence often stands alone.
- Frequent H2 subheads (`##`) breaking the post into scannable sections. H2 headings often phrase a thesis or a question (e.g. *"It doesn't work for software."*, *"Separating Tasks Into 'To-Do' and 'To-Think'"*).
- Bullet lists for concrete items (steps, key facts, before/after).
- First person, conversational. Personal anecdote up front - a scene, a moment, a hook - before the point.
- Bold for emphasis on the key concept, not for decoration.
- Links inline; internal posts linked via Hugo's `{{< relref "/posts/YYYY/MM/slug/" >}}` shortcode with the full content path, not raw URLs. A bare slug like `{{< relref "polynesia" >}}` works only while the slug is unique across the site, so prefer the full path.
- End with a small takeaway or a call to reflection, not a hard sell.
- German posts follow the same structure, with gendered forms (`Entwickler:innen`, `Nutzer:innen`).
- **Never use em dash (—, U+2014) or en dash (–, U+2013) in new posts.** Use a plain hyphen `-` with spaces around it, or restructure the sentence. This applies to both English and German posts. (Older posts still contain dashes; leave existing text alone unless the user asks for a cleanup.)

## Reviewing / revising a post

Whenever going through an article again (re-reading, revising, polishing, or on request from Klaus), always check for:
- **Correct, complete sentences** - no fragments left from an edit, no dangling clauses, subject and verb agree, punctuation closes cleanly.
- **Spelling and typos** - in both English and German. Check German umlauts (ä/ö/ü/ß) are correct and not mangled (e.g. no stray `ae`/`oe`/`ue` where the umlaut belongs).
- Consistency of tense and person within a paragraph.
- The dash rule above still holds.

Fix what's clearly wrong. Flag anything ambiguous instead of silently rewriting voice.

## Common shortcodes

Defined in `layouts/shortcodes/`:
- `{{< youtube VIDEO_ID >}}` - embed YouTube
- `{{< pdf src="file.pdf" >}}` - embed a PDF viewer
- `{{< gallery "url1,thumb1|url2,thumb2" "extra-classes" >}}` - image gallery
- `{{% include file="content/snippets/cv.md" %}}` - include a snippet (note `%` for markdown-rendered includes)
- `{{< relref "/posts/YYYY/MM/slug/" >}}` - link to another post by content path

## Build / dev commands

- `make start` - run Hugo dev server + Tailwind watch (uses port 1313, which is reserved for Klaus; agents use `hugo server -D --port 1314` instead)
- `make build` - production build (`HUGO_ENVIRONMENT=production hugo --minify`)
- `make watch` - Tailwind watch only
- `make tailwind-build` - minified Tailwind one-shot

## Conventions when adding a new post

1. Create folder `content/posts/YYYY/MM/slug/` for a post with a publish date, or `content/posts/draft/YYYY-slug/` with `draft: true` if it is not ready yet.
2. Put images in that same folder. Use `preview.jpg` or `preview.png` for the social card when possible.
   - **Any image referenced in a post must physically live inside that post's folder.** When an image comes from somewhere else (Downloads, the Obsidian vault, a slide export), copy the file into the post folder first, then reference it with a relative path. Never link to a file outside the folder.
3. Create `index.md` (English) and/or `index.de.md` (German). Do not create empty stubs for a language that isn't written.
4. Use the frontmatter shape above. Always quote the title. Categories is always a list with one entry.
5. Reference images with relative paths (`![alt](preview.jpg)`), internal posts with `{{< relref "/posts/YYYY/MM/slug/" >}}`.
6. Don't set `draft: false` unless there's a reason - absence is fine.
