# v01-hugo

## Redirects

Old paths live in the destination page's `aliases` front matter. Hugo generates
the redirects. In German content, `/../old-path/` creates an alias at the domain
root instead of under `/de/`.

Keep `https://www.v01.io/` as the base URL. Configure the apex-to-www redirect
at the hosting provider and remove the old Worker route after deploying the aliases.
