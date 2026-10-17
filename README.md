# v01-hugo

## Hosting

Bunny hosts the static site `v01-io` in the DE storage region. GitHub Actions
builds and deploys pushes to `main`, using the `BUNNYNET_API_KEY` repository
secret. The workflow also supports manual runs on `main`.

For a manual production deployment, run `bunny sites deploy --build`.
To roll back, run `bunny sites deployments publish --previous --force`.

Cloudflare manages DNS. Both `www.v01.io` and `v01.io` point to
`sites-v01-io-mmkyeg.b-cdn.net` with proxying disabled. Bunny provides HTTPS
and redirects the apex domain to `https://www.v01.io/`, preserving paths
and query strings.

## Redirects

Old paths live in the destination page's `aliases` front matter. Hugo generates
the redirects. In German content, `/../old-path/` creates an alias at the domain
root instead of under `/de/`.

Keep `https://www.v01.io/` as the base URL. Hugo aliases work directly on Bunny
without a Cloudflare Worker.
