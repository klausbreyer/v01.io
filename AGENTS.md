# Agent Instructions

- Never use em dashes (U+2014) in any output. Use commas, parentheses, colons, or separate sentences instead.
- After changing Karabiner configuration, restart Karabiner-Elements so the new configuration is loaded.
- Never create a Git commit unless the user explicitly asks for it.
- Keep every post image in its post bundle under `content/posts/...`. Never move post images to `static`, `assets`, or another shared directory. Preview images are shared by translations and use an unsuffixed filename such as `preview.jpg`; do not create language-suffixed preview copies such as `preview.de.jpg`.
- Planned LinkedIn posts for an article go into the article's frontmatter as a `linkedin: |` multiline block (see `2026/08/breadboarding` and `2026/08/franken-domains`). For bilingual posts, put the English text in `index.md` and the German text in `index.de.md`. Once the LinkedIn post is published, add its URL as `social:`.
- Never start a dev server on port 1313. That port is reserved for Klaus' own Hugo server. Use a different port, for example `hugo server -D --port 1314`.
