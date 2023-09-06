---
title: "2023 Homepage Relaunch"
author: Klaus Breyer
date: 2023-01-13T17:26:22+01:00
draft: false
categories: ["Code"]
image: "2023-relaunch.png"
social: "https://www.linkedin.com/posts/klaus-breyer_2023-relaunch-klaus-breyer-cto-writing-activity-7019586130656272384-Yl7H"
---

Over the quiet days at the end of last year, I relaunched my website.

And since relaunches of people with some visibility in the tech scene are always eyed with particular attention to the tech they used (and what they thought), here's my thinking.

## Design

My design has always been minimalistic, so there is no massive change here. It is much easier to do browser testing without a fancy design in mind.

For the colors, I first experimented with brighter colors in mind. But in the end, I took inspiration from the themes of my favorite editor, [VS Code][1]. If someone knows which colors work well together, or are suitable for the eye, then probably an editor of programmers who use them all day.

The primary font for the articles has serifs because of readability. I leveraged the [system font stack][2] to have no additional burden on another font because the contrasting font I use for headlines is already an [external one][3] - the only luxury I allow myself here.

## Functionality

As part of the minimalism initiative, I have also abandoned comments and replaced them with two other mechanisms.

I'd rather have the actual comment functionality on social media. I'll get more visibility there than if the comments only take place on my blog. So under each (newer) article is a link to LinkedIn.

[The whole repository is open source][4]. Send me a pull request if you find typos in my articles. You will find a small link now to the repository after each article.

## Switch from WordPress to Hugo

For a long time, WordPress was a thorn on my side. I prefer a minimalistic design anyway and wanted my page to load instantly. Now I have a solution without javascript and just a [very thin layer of CSS](https://github.com/klausbreyer/v01.io/blob/main/assets/sass/main.scss).

Overall, the overhead of WordPress was always more often in the way, as he would have brought me something.

- I prefer to embed my SVG as I see fit
- The wrong social thumbnail was often delivered, and it took a lot of work around this.

I was not 100% satisfied even with Hugo for the social thumbnail situation, [but here, it was easier to write the whole thing myself](https://github.com/klausbreyer/v01.io/blob/main/layouts/partials/meta.html).

The WordPress articles were converted to markdown using [an open-source script][5]. It was not perfect, but a solid 80% solution that saved me hours.

## Hosting and Redirects

For hosting, I am with [Cloudflare Pages][6]. Nothing is so fast everywhere in the world.

I used the rewrite to switch from v01.io to a solid www.v01.io domain. I think everybody preferred apex domains ten years ago, but nowadays, the technical advantages overweight the style factor)

For redirects from the old URL structure, I use the [workers provided by Cloudflare][7], which I feed with a long list of redirects - [also open source][8].

Now I am looking forward to your feedback.

[1]: https://code.visualstudio.com/
[2]: https://systemfontstack.com/
[3]: https://fonts.google.com/specimen/Share+Tech
[4]: https://github.com/klausbreyer/v01.io
[5]: https://nantipov.org/2019/12/converting-site-from-wordpress-into-hugo/
[6]: https://pages.cloudflare.com/
[7]: https://workers.cloudflare.com/
[8]: https://github.com/klausbreyer/v01.io-workers
