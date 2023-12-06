---
title: "Hidden Treasures of TLDs: How I Scraped Hackernews for Domain Names"

publishdate: 2023-03-10T08:35:00+01:00
lastmod: 2023-03-10T08:35:00+01:00
draft: false
tags:
  - hackernews
  - go
  - mysql
  - domains
  - tld
categories:
  - Code
image: "hns.png"
social: "https://www.linkedin.com/posts/klaus-breyer_hidden-treasures-of-tlds-how-i-scraped-hackernews-activity-7040995326916206592-m8R6"
#views: 4,2k in 24h (HN)
---

{{< hackernewsstats >}}# hackernewsstats

## Background Story

As somebody who often starts new projects, I often need to think about project names and domain names.

[Derek Sivers once posted about how to find a good (and free) .com Domain][1], and I found it very inspiring. However, in some cases, there is the project name defined first - or you want to do a good play of words with the name and domain of the project. In those cases, you need to have a suitable TLD.

But finding such domain names is a tricky thing. [If you go through Wikipedia, you end up with more than 1.2k TLDs][2]. (Trust me, I did it).

So I needed to narrow it down. And I did so by running it through the filter of a bubble that a) seems relevant to me and b) was large enough: People who read and post on [Hackernews][3]. So I had my Raspberry Pi scraping the [Hackernews API][4] for about 3 Weeks (because of rate limits), and the results you find up there.

I had a database full of HN Stories since the very beginning, which accumulated to ~1GB.

## Takeaways

- There are currently 1283 relevant top-level domains.
- The historical graph, while funny to look at, has not had that much to take away for a new project because some super relevant domains were just released some years ago (like .dev)
- So I added an extra graph for the last full year (now: 2022). It has a logarithmic axe for the vast difference between .com and other domains.

## Method

Filter Settings:

- **Original:** The original generic top-level domains from the Internet's early development predate ICANN's creation in 1998.
- **Country:** [Country code top-level domains][5] (ccTLD)
- **Generic:** [Generic top-level domains][6] (gTLDs) - excluding geographic and brand gTLDs.
- **Brand:** brand gTLDs
- **Geographic:** geographic gTLDs

Not taken into account were the following TLDs:

- [test top-level domains][7] (tTLD)
- generic-restricted top-level domains (grTLD)
- [Internationalized brand top-level domains][8]
- [Special-Use Domains][9]
- [Non-IANA domains][10]
- [Infrastructure top-level domains][11]

URLs with one of the following patterns were ignored (for a full account of 0.001%):

- Wrong links: <http://blog.plover.com./prog/lib.html> (they do not make so much in the mass)
- URLs without Domain names that were pointing to IP addresses.

## Code

I wrote a small binary in Go to leverage the beautiful go routines for fast scraping. But it turned out that there was a rate limit in place, and I needed to limit the parallel routines to 4. (which is better than 1 - or writing it in almost any other language)

The entries were inserted in a single table MySQL DB. Why MySQL and not PostgreSQL? Just because I have used it for almost 20 years.

I created a JSON file from the database with another Go binary to ship it with the Frontend. The most exciting part here is [how I queried the data for specific years and how I substring-ed the column of URLs to group it by the top-level domai][12]n. By the way: [A huge shout-out to this Stackoverflow thread that teaches me how to do it!][13]

In the Frontend, it is vanilla Javascript leveraging [Plotly][14]. I implemented this into [a shortcode that I added to my Hugo template][15].

The data gathering and transformation code must be better documented, but it is undoubtedly open source.

[1]: https://sive.rs/com
[2]: https://en.wikipedia.org/wiki/List_of_Internet_top-level_domains
[3]: https://news.ycombinator.com/
[4]: https://github.com/HackerNews/API
[5]: https://en.wikipedia.org/wiki/Country_code_top-level_domain
[6]: https://en.wikipedia.org/wiki/Generic_top-level_domain
[7]: https://en.wikipedia.org/wiki/.test
[8]: https://en.wikipedia.org/wiki/List_of_Internet_top-level_domains#Internationalized_brand_top-level_domains
[9]: https://en.wikipedia.org/wiki/List_of_Internet_top-level_domains#Special-Use_Domains
[10]: https://en.wikipedia.org/wiki/List_of_Internet_top-level_domains#Non-IANA_domains
[11]: https://en.wikipedia.org/wiki/List_of_Internet_top-level_domains#Infrastructure_top-level_domains
[12]: https://github.com/klausbreyer/hackernewsstats/blob/main/queries/count-years.sql
[13]: https://stackoverflow.com/questions/9280336/mysql-query-to-extract-domains-from-urls
[14]: https://github.com/plotly/plotly.js
[15]: https://github.com/klausbreyer/v01.io/blob/main/layouts/shortcodes/hackernewsstats.html
