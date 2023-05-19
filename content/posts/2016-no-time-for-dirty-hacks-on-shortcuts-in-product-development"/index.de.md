---
title: "No Time for Dirty Hacks: On Shortcuts in Product Development"
author: Klaus Breyer
date: 2016-09-22T09:26:52+02:00
publishdate: 2016-09-22T09:26:52+02:00
lastmod: 2022-12-02T16:47:09+01:00
categories: ["Product"]
tags: ["agency", "product development", "software engineering"]
---

I was CTO of the social media agency [buddybrand](http://buddybrand.com) for 6 years and have now been CTO of the SaaS startup [BuzzBird](https://www.buzzbird.de) for almost a year.

Even though the subject area with social media / ad tech is very similar, it differs fundamentally whether a project is processed for (several) customers, or an own product is continuously developed and improved.
Agency Services
The advantage of an agency is certainly also its disadvantage: It has ongoing projects. And quite a lot of projects. At buddybrand we shipped 500 apps in 3 years.

This brings with it a fast learning curve - for all involved. If a project was rather mediocre, learnings from it are applied directly in the next project. This affects the development as well as the project management and the cooperation of all trades.

Especially in development, new frameworks can be experimented with superbly. In all the agency years we certainly had 5 different frameworks in the backend as well as in the frontend. This experience makes incredibly flexible for the most absurd customer wishes.

Unfortunately, there is a high time and budget pressure, so that one often falls behind one's possibilities. On the other hand, that's also somehow irrelevant, as the projects are rarely for eternity.
Product Development
In product development, there are no shortcuts. Things have to be done properly. Everything that is live once is used and influences future decisions.

The application architecture must be set up as cleanly as possible to be both stable and offer room for manoeuvre. Always keep in mind: Every piece of code that was written once will also be refactored at some point.

In data storage, there is absolutely no tolerance for poorly modelled data. Every decision always has a long tail. Be it the format of the data or just the naming of database columns.

It is no longer just about meeting the deadline on time, but how expensive future changes are. Every release requires migrating existing data and testing it very thoroughly.

This makes the development of new features significantly slower than the freedom to start fresh with each release.
There are no shortcuts
Every shortcut or "dirty hack" costs twice as much in the long run as it originally saved. This doesn't mean that products shouldn't be developed lean - but they must be clean. It's rarely about shipping a new feature two weeks earlier - but where you'll be next year and how flexible you remain.

On the other hand: Those who work in an agency should always use the latest hot stuff and benefit from the steep learning curve.

Ideally, you can switch sides several times during a career. Each side benefits from the experiences of the other. Currently, someone is "switching sides" in the context of mentoring by me - which prompted me to write down my thoughts on this.
