---
title: 'Bug Triage'
author: Klaus Breyer
date: 2021-12-23T09:17:20+01:00
publishdate: 2021-12-23T09:17:20+01:00
lastmod: 2021-12-23T09:17:22+01:00
draft: false
description: 'Bug Triage'
categories: ['Product']
tags: ['bug triage', 'prioritization', 'backlog', 'technical debt', 'project management']
aliases:
    - /de/posts/bug-triage/
    - /posts/bug-triage/
---

In jedem Projekt kommt immer wieder die Frage nach der Priorisierung des Backlogs auf. Am Ende ist es in meiner Erfahrung allerdings nicht ein einziges Kriterium, und auch keine zweidimensionale Matrix, die man nutzen kann um einen Bug als Trivial / Minor / Major / Critical einzuordnen. Sondern es sind vielmehr unterschiedliche Aspekte, von denen nicht jedes auf jeden Ticket-Typ passt. Denn: Visuelle Bugs sind anders zu betrachten als Technical Debt und ein Produkt kurz vor Release ist eine andere Situation als beim Start der Entwicklung.

Wenn man jedoch 1 oder 2 der folgenden Aspekte, die auf die jeweilige Situation passen, gut durchdenkt, kann man eigentlich zu jeder Situation die entsprechende Priorisierung ableiten.

- Correctness: Pixel Optimization ↔ Misleading / wrong information?
- Urgency: More problems down the line ↔ Polishing, every time possible.
- Technical: Would be rather overengineering ↔ Is a real pain in the ass.
- Impact: Edgecase ↔ Mainstream
