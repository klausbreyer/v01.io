---
title: "Bug Triage"
author: Klaus Breyer
date: 2021-12-23T09:17:20+01:00
publishdate: 2021-12-23T09:17:20+01:00
lastmod: 2023-04-14T17:43:22+02:00
draft: false
categories: ["Product"]
tags:
  [
    "bug triage",
    "prioritization",
    "backlog",
    "technical debt",
    "project management",
    "correctness",
    "urgency",
    "technical",
    "impact",
  ]
---

In every project, the question of prioritizing the backlog comes up again and again. In the end, in my experience, it is not a single criterion, and also not a two-dimensional matrix that can be used to classify a bug as Trivial / Minor / Major / Critical. Instead, there are many different aspects, not all of which fit every ticket type. Because: Visual bugs are different from Technical Debt, and a product close to release is a different situation than at the start of development.

However, if you think through 1 or 2 of the following aspects that fit the respective situation, you can actually derive the appropriate prioritization for each situation.

- Correctness: Pixel Optimization ↔ Misleading / wrong information?
- Urgency: More problems down the line ↔ Polishing, every time possible.
- Technical: Would be rather overengineering ↔ Is a real pain in the ass.
- Impact: Edgecase ↔ Mainstream
