# v01-hugo

## Redirects

The canonical site is `https://www.v01.io/`. Keep the apex-to-www redirect at
the hosting provider, with the request path and query string preserved.

Old paths are stored as `aliases` in the destination article's front matter.
Aliases for categories, tags, and other overview pages live in their `_index.md`.
Hugo generates static redirect pages that work on Cloudflare Pages and Bunny
without a Worker or `_redirects` support.

In German content, use `/../old-path/` for a legacy URL at the domain root.
Hugo otherwise prefixes aliases with `/de/`. Existing language-specific aliases
keep their usual form.

All aliases use `layouts/partials/redirect.html`.
JavaScript preserves the full query string and fragment and replaces the history
entry. Without JavaScript, a meta refresh and link still reach the destination,
but do not preserve the query string or fragment. These are HTML redirects,
not HTTP 301 responses.

The aliases cover all 262 website paths from `v01.io-workers`. Destinations
point directly to current pages, including German translations. Removed tags
lead to `/tags/`. The retired `/v01-fund/` page leads to `/`, and the removed
startup CTO article leads to `/tags/cto/`. `/consulting/` leads to the CV,
`/shape-up/` to the Shape Up tag, and `/reel/` to the speaking page.

The host redirect handles `/robots.txt` and `/sitemap.xml` without extra Hugo
rules. The old `workers.dev` test hostname is outside this site's control.
Unknown paths retain the host's normal not-found behavior.

### Hosting cutover

After deploying the site, configure the apex redirect and remove the old Worker
route so requests can reach Pages. Both settings are managed outside this repository.

- Cloudflare: match the apex hostname for HTTP and HTTPS, redirect permanently
  to `https://www.v01.io` with the original path, and preserve the query string.
- Bunny: attach the apex hostname with HTTPS enabled, then use a 301 Edge Rule
  matching `*://v01.io/*` with target `https://www.v01.io{{path}}`.
  Bunny's `{{path}}` includes the query string. Serve the Hugo output on `www`
  with directory index resolution (`/path/` serves `/path/index.html`).

### Validation

Build into a temporary directory so the local preview output stays untouched:

```sh
redirect_tmp=$(mktemp -d)
HUGO_RESOURCEDIR="$redirect_tmp/resources" hugo --environment production --minify \
  --destination "$redirect_tmp/public" --cacheDir "$redirect_tmp/cache" --noBuildLock
HUGO_REDIRECT_TEST_DIR="$redirect_tmp/public" node --test scripts/test-redirects.mjs
```
