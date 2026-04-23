## About the site

Personal site and blog of **Klaus Breyer** (CPTO, Berlin). Built with **Hugo** + **TailwindCSS**, deployed from `main`. Base URL: `https://www.v01.io/`. Two languages: `en` (default) and `de`.

Klaus writes as an experienced B2B SaaS CPTO / startup founder. Topics: leadership, product, agile, remote, engineering, open source, plus personal and travel. Tagline: *Move Fast And Break Silos.*

## Repo layout

- `content/posts/` — blog posts, one folder per post (see naming below)
- `content/pages/` — standalone pages (cv, speaking)
- `content/snippets/` — reusable fragments included via `{{% include file="..." %}}`
- `archetypes/default.md` — Hugo archetype (used by `hugo new`)
- `layouts/` — Hugo templates and shortcodes
- `static/` — static assets served at site root
- `config.toml` — site config

## Post folder & file naming

One folder per post. All assets for the post live inside that folder (images, PDFs, galleries).

Folder name pattern: `YYYY-[MM-]slug-in-kebab-case`
- Year-first, lowercase, kebab-case
- Month is optional and only used on some personal/travel posts (e.g. `2025-01-ioniq5`, `2018-07-bali-ein-bericht`). Most posts omit the month: `2025-to-think`, `2026-bonbonbon`, `2025-polynesia`.
- Slug is English for English-primary posts, German for German-only posts. No need to change the folder when a post is German-only.

Files inside the folder:
- `index.md` — English version (default language)
- `index.de.md` — German version
- If a post is **German-only**, use only `index.de.md` (no English stub). Same for English-only: just `index.md`.
- Images live alongside the markdown in the same folder, referenced with relative paths: `![alt](preview.jpg)` or `![alt](./bonbonbon.jpg)`.
- Language-specific images get the language suffix: `preview.jpg` (en) / `preview.de.jpg` (de), `header.de.jpg`.
- PDFs for talk slides: `YYYY-slug.pdf` or `YYYY-slug.de.pdf`, rendered with the `pdf` shortcode.
- Galleries go in a `gallery/` subfolder inside the post folder (see `2025-polynesia/gallery/`).

## Frontmatter pattern

Frontmatter is YAML between `---` markers. The canonical shape for a new post, based on the three most recent posts (`2026-bonbonbon`, `2025-working-products`, `2025-to-think`):

```yaml
---
title: "Post Title in Title Case"
date: 2026-02-01
categories: ["Leadership"]
image: preview.jpg
---
```

Rules and options:
- **title**: always quoted. Title case for English, sentence/title-ish for German. Colons, em dashes, and question marks are fine.
- **date**: either a plain `YYYY-MM-DD` or a full RFC3339 timestamp with offset (`2025-01-23T08:33:12+01:00`). Both are in use — prefer plain date unless the time of day matters.
- **categories**: always a YAML list, even with one entry. Common values (by frequency): `Bookshelf`, `Personal`, `Open Source`, `Product`, `Engineering`, `Agile`, `Travel`, `Leadership`, `Productivity`, `Remote`, `AI`, `Collaboration`. Multi-category is fine: `["Leadership", "Product", "Collaboration"]`.
- **image**: path to the social/preview image relative to the post folder. Often `preview.jpg` / `preview.png` / `preview.de.jpg`, sometimes the hero image itself.
- **social** (optional): URL to the LinkedIn post / podcast episode / external canonical where this piece was also shared.
- **aliases** (optional): list of old URLs that should redirect here. Used when renaming a post.
- **draft: false** (optional): rarely set explicitly.
- **tags** (optional, rare): YAML list; most posts only use categories.

## Writing style (derived from recent posts)

- Short paragraphs. One idea per paragraph. A single sentence often stands alone.
- Frequent H2 subheads (`##`) breaking the post into scannable sections. H2 headings often phrase a thesis or a question (e.g. *"It doesn't work for software."*, *"Separating Tasks Into 'To-Do' and 'To-Think'"*).
- Bullet lists for concrete items (steps, key facts, before/after).
- First person, conversational. Personal anecdote up front — a scene, a moment, a hook — before the point.
- Bold for emphasis on the key concept, not for decoration.
- Links inline; internal posts linked via Hugo's `{{< relref "slug" >}}` shortcode, not raw URLs.
- End with a small takeaway or a call to reflection, not a hard sell.
- German posts follow the same structure, with gendered forms (`Entwickler:innen`, `Nutzer:innen`).
- **Never use em dash (—, U+2014) or en dash (–, U+2013) in new posts.** Use a plain hyphen `-` with spaces around it, or restructure the sentence. This applies to both English and German posts. (Older posts still contain dashes; leave existing text alone unless the user asks for a cleanup.)

## Common shortcodes

Defined in `layouts/shortcodes/`:
- `{{< youtube VIDEO_ID >}}` — embed YouTube
- `{{< pdf src="file.pdf" >}}` — embed a PDF viewer
- `{{< gallery "url1,thumb1|url2,thumb2" "extra-classes" >}}` — image gallery
- `{{% include file="content/snippets/cv.md" %}}` — include a snippet (note `%` for markdown-rendered includes)
- `{{< relref "slug-or-path" >}}` — link to another post by folder name

## Build / dev commands

- `make start` — run Hugo dev server + Tailwind watch
- `make build` — production build (`HUGO_ENVIRONMENT=production hugo --minify`)
- `make watch` — Tailwind watch only
- `make tailwind-build` — minified Tailwind one-shot

## Conventions when adding a new post

1. Create folder `content/posts/YYYY-slug/` (add `MM-` only if the post is a dated personal/travel piece).
2. Put images in that same folder. Use `preview.jpg` for the social card when possible.
3. Create `index.md` (English) and/or `index.de.md` (German). Do not create empty stubs for a language that isn't written.
4. Use the frontmatter shape above. Always quote the title. Categories is always a list.
5. Reference images with relative paths (`![alt](preview.jpg)`), internal posts with `{{< relref "other-slug" >}}`.
6. Don't set `draft: false` unless there's a reason — absence is fine.
