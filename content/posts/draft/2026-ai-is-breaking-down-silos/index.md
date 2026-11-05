---
title: "AI Is Breaking Down Silos: How We Work at myo Now"
date: 2026-11-05
draft: true
categories: ["Leadership"]
image: preview.jpg
---

This is the long version of my [talk at code.talks]({{< relref "/posts/2026/11/codetalks/" >}}) in Hamburg: how I am transforming my current team at [myo](https://myo.de). What worked for us, what did not, and what we are still figuring out.

Here is what worked in our context. Your context is different.

## Our Past: The Best Process I Ever Had

Our old process was Shape Up. Product was no longer the bottleneck. It was the best process I ever had.

Then I noticed something uncomfortable. Alone with agents, I am faster than the team.

Not because the people are slow. Because of what we wait for:

- Consensus before building.
- The code review queue.
- The communication overhead.

What costs us is waiting on people. And Amdahl's law applies: the overall speedup is capped by the part you do not speed up.

The industry answer right now is software factories, product factories, GTM factories. John Cutler asks whether we are reimagining work one silo at a time. I think we are.

My picture for the alternative is Amsterdam's Alexanderplein experiment. The city switched the traffic lights off at a busy intersection. Traffic kept flowing. People looked at each other instead of waiting for a signal.

## Our Present: One Problem, One Person, No Approvals

Here is how we work now.

**Problem framing.** Whoever brings a problem frames it: context, outcome, no-gos, risk appetite, metric. No problem framing, no solution shaping.

**Directly responsible individuals.** The question was: how do we get a team as fast as one person? The answer: one problem, one person, no approvals. The DRI decides flow, layout, copy and data. As a leader, I had to let go of the how.

**Solution shaping.** The DRI clarifies details directly with stakeholders and collaborates in whatever way fits: prototypes, breadboarding, a quick call. Estimates are a ballpark. No consensus, but feedback.

**Delivery with agents.** Engineers need to learn to prompt for verification. The question I keep asking: how would you gain confidence if you could not read the code?

- Agents build, the DRI steers.
- Prompt the what, not the how.
- Ask for irrefutable proof, not vibes.
- Design patterns and a design.md instead of design approvals.
- AI reviews every PR, the DRI merges. Four eyes only if the DRI asks for them.

If you can't say how it was verified, don't merge.

**Guardrails.** A soft guard: critical paths live on a path list. A hard guard: separate packages the agent cannot edit at all. We set the risk appetite per project. Autonomy grows with distance from customer data.

**Measure with real numbers.** Real cases ran, and the metric is live if there is one. A bug means we first improve the verification. Agents can reach errors and telemetry. Everyone sees the metrics.

**Context.** If the agent can't see something, it makes it up. So context is now a product in itself: strategy, user types, interviews and framings on the product side, a pattern set and design.md on the design side, telemetry, logs and errors from production.

The team stays the unit of value creation. Makers, not silo factories.

## Your Future: Find Your Own Process

There is no single best solution. "Measure twice, cut once" and "launch, iterate and kill" are both valid, depending on what you build and for whom.

A few things I would take with me:

- Treat everything as an experiment. Grafana uses error budgets: a certain level of errors is allowed, so teams can be creative and make mistakes. Zero errors all the time means you are not innovating enough.
- Please don't be the "if you could just fill out a Jira ticket" guy.
- Consensus kills speed, top-down kills buy-in. Leaders: don't bring answers, facilitate shared learning.

Replace consensus with context. Then ask two questions. Does every agent have the context to work autonomously? Is every human empowered to work autonomously?
