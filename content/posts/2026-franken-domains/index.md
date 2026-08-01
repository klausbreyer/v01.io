---
title: "franken.domains: Every Dictionary .com Is Taken. Here Is What's Left."
date: 2026-08-01
categories: ["Engineering"]
image: preview.jpg
linkedin: |
  New side project: https://franken.domains/

  Every dictionary word .com is taken. But there are still plenty of creative alternatives in the form of domain hacks: wilderness becomes wilderne.ss, uploading becomes upload.ing, etc.

  Stitched-together domains, hence franken.domains: 355,000 words, checked and verified at the registry for every TLD. Result: 12,799 real words, registrable right now.

  ***

  Neues Sideprojekt: https://franken.domains/

  Jedes Wort aus dem Wörterbuch ist als .com vergeben. Aber es gibt noch viele kreative Alternativen in Form von Domain Hacks: Wilderness wird wilderne.ss, Uploading wird upload.ing, etc.

  Zerstückelte Domains, also franken.domains: 355.000 Wörter, geprüft und verifiziert bei der Registry für jede TLD. Ergebnis: 12.799 echte Wörter, sofort registrierbar.
---

![franken.domains](./preview.jpg)

Every dictionary word .com is taken. Registered between 1995 and 2005, in every major language. The dictionary is sold out.

But there are still plenty of creative alternatives: domain hacks. Cut the word so its last letters become the top-level domain. *Wilderness* becomes **wilderne.ss**. *Uploading* becomes **upload.ing**. *Telephone* becomes **teleph.one**. Everyone knows the famous ones: [bit.ly](https://bit.ly), [insta.gram](https://www.instagram.com), [del.icio.us](https://del.icio.us).

Stitched-together domains, hence the name of my new side project: [franken.domains](https://franken.domains). Nobody could tell me how many of these are still free, so I checked all of them. At the time of writing: **12,799 real words, registrable right now.**

## Checking all of them

I took roughly 355,000 words from German, English, Spanish, and French word lists and generated every possible cut against every TLD in the IANA root zone. That produced **124,490 candidate domains across 208 TLDs**.

Every candidate goes through two checks: a cheap DNS lookup first, then an RDAP query at the responsible registry. A domain counts as free only when the registry itself answers 404. Anything unclear stays off the list. A worker loop keeps rechecking, so the list does not rot. (The pipeline is Elixir: thousands of concurrent lookups with per-registry rate limiting.)

## What you find there

The site shows a small rotating drop of free domains plus a rate-limited search, so nobody can scrape the full list. The biggest sources of free domains:

- **.ing** - over 1,700 free *-ing* words (upload.ing, gossip.ing, assign.ing). Google launched this TLD in 2023 and the market has not picked through it yet, though beware premium pricing.
- **.as** (American Samoa) and **.ng** (Nigeria) carry hundreds of Spanish and English endings.
- **.re** (Réunion) shows up in words like su.re, pu.re, and wi.re.
- **.ist**, **.bar**, **.tel** quietly absorb a lot of German.

And the German list is where it gets charming: fixpla.tz, schmierf.ink, and teleph.one, which works in both languages.
