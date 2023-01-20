---
title: 'Shape Up Track for Scrum - how to hack a process v2'
author: Klaus Breyer
date: 2022-09-23T14:02:47+02:00
publishdate: 2022-09-23T14:02:47+02:00
lastmod: 2022-12-16T10:54:01+01:00
draft: false
description: 'Shape Up Track for Scrum - how to hack a process'
categories: ['Engineering Org']
tags: ['agile', 'scrum', 'process', 'shapeup']
Social: "https://www.linkedin.com/posts/klaus-breyer_shape-up-track-for-scrum-how-to-hack-a-activity-7004381835472318464-EtFX"
---



Not everybody on our team was happy with the overhead of Scrum. But it isn't easy to change a development process for an (otherwise) stable team.

We tried nonetheless and approached it as an experiment: Test and prove that something new is working for us while not wholly abandoning what is currently working.

As a result, we realized that Scrum and [Shape Up](https://basecamp.com/shapeup) are not mutually exclusive but complement each other perfectly.

Update, 2022-11-16: Since I first released this post, a lot happened. I gained some more insights on my own, while other friendly Shape Up practitioners from USA to New Zeeland approached me for sparring. So I decided to add/update some sections.
*Those sections are highlighted*.

Update, 2022-12-16: [A follow-up article on the Shape Up migration for Scrum teams is now talking about more abstract patterns](../20221216shape-up-staffing-and-process-patterns).
  ## Problem Space
But let's start with the root cause: In the current world of software engineering, Scrum comes with much bureaucratic overhead, while all the effort often results in half-assed features (distributed across multiple sprints). [Agile became doing half of Scrum poorly and using Jira](https://beny23.github.io/posts/my_take_on_engineering_room_9/). Also, product teams introduced [mini-waterfalls to optimize resources while lacking team spirit and drowning in context switches](https://www.amazingcto.com/why-we-always-endup-with-waterfall-even-scrum/).

But on the other hand, [Scrum seems to be the best-established method to tame non-technical managers of larger organizations not to interfere too much](https://blog.pragmaticengineer.com/project-management-at-big-tech/) (at least for two weeks).

Traditional (but businesswise often neglected) engineering wisdom says: There are two very different types of speed: short-term speed (Sprint) and long-term speed (Marathon). In software development (and in running as well), you can't have both. (Actually, [to get both, Intervals are a possibility](https://www.apptio.com/blog/speed-in-software-development/).)

Another solution to deal with this Dilemma is splitting the team altogether.[Then, a product has a "Feature Team" and a "Quick Reaction Force" to ensure stable operations](https://medium.com/engineering-manager-hub/engineering-org-structures-the-qrf-team-model-7b92031db33c).
  ## Solution Space
Okay, but what is Shape Up? If you have never heard of it: In some sense, it is timeboxed method for feature development, while it is agile in the original intent. [Nobody can explain it as well as Ryan Singer himself. If you have not already, watch this video before continuing with this article.](https://www.youtube.com/watch?v=h_8M23wVjXk)

So, the reasons for Shape Up are plenty. But furthermost, the implications for engineers and designers are that they interdisciplinary work together on the same thing, rather than preparing different non-working parts that do not fit together. While for business, it is all about getting more deliberate in how you allocate resources to create value for users.

Our Experiment: Augmenting a stable Scrum process with a [Shape Up](https://basecamp.com/shapeup) track to have the benefits of Shape Up without making a frightening "all-in" decision to ditch Scrum.

   ![](2022-09-23-processes-scrum-vs.-shapeup-v2-process1.svg)

Before we get into more details, first, a bit of context: I am currently in the role of Tech Lead of a remote international team to develop a PWA product in the IIoT context.

Scrum working mode:

- 4 Software Engineers (fulltime)
- 2 UX (parttime)
- 2 UI designers (parttime)
- 1 PO (with other responsibilities as well)
- Working together for well above a year in this exact constellation.
- PO decides the focus of the next couple of sprints.
- UX and UI work with PO outside Scrum, preparing everything for the developers.


It is not precisely [dual-track Scrum](https://www.agile-academy.com/de/product-owner/dual-track-scrum/), but a formal method was not necessary: We have excellent communication between the trades, and things are ready when the engineers need them.

   ![](2022-11-16-processes-scrum-mini-waterfall.svg)

Still, there was always more pre-work than Engineering could implement cleanly. And that always came with pressure in every engineer's mind. Also, in planning, tickets with medium priority were pushed to the next sprint, again and again.

We used the vacation season, when almost half of the team was gone, to try out Shape up. We hoped that a very stripped-down team could work with high efficiency and without the Scrum ceremonies.

Our Shape Up working mode:

- The project to work on was defined in advance by the PO.
- Strong collaboration between developers and designers and PO during the shaping phase
- The timeframe was specified upfront. In this case: 6/8 weeks.
- Fix team, no vacations during this time
- 2 Engineers (fulltime),
- 1 UX Designer (parttime)
- 1 UI Designer (parttime)
- No external testers. Testing is part of the team's interdisciplinary responsibility.
- No Scrum obligations, except to show an intermediate status at the joint Scrum review.
- Builders organize themselves: Dailies and progress tracking is in their hands.
- Cooldown phase of 4 weeks (2 sprints) afterward to strengthen inter-engineer collaboration while UX + PO leads the shaping of the next feature.


While I am writing this article during the shaping phase for the second Shape Up sprint, for me, some first general patterns start to emerge:

- Product Owner: There is an extensive phase of collaboration between the PO and the whole team during the shaping, led by UX. In return, almost a lot lesser obligations during the implementation because no formalities require a PO presence, like sessions for refinement, planning, or estimations. *Communication with PO and the team moves from Push to Pull.*
- User Experience: A UX designer was part of the Shape Up team for ongoing product decisions as they were used to working very closely with UI Designers. In practice, this designer kept a lot of the meta picture in mind and owned the test cases.
- User Interface: *Would have preferred to deliver the work as "1 piece",* but instead was led to some part by engineering, by what's possible. So designers needed to make some compromises, which they otherwise would not have allowed. But all in all, I think they spend significantly less time on the project.
- Engineering: Engineers loved the meeting-free time to tackle some challenging problems of a very technical feature. Besides the coding, it is worth mentioning that they came up with many of the final product's bells and whistles. Also, they were more involved in testing the feature directly with the beta customers. *But it is essential to stay connected to the rest of the team via a bi-weekly developers huddle to discuss technical architecture and how new features are integrated into the codebase.*
- Business: Knows precisely how much (time) budget they want to allocate to tackle a specific problem.
- *Collaboration: We only had one larger daily for the whole team (PO optional), where we showed work and drove decisions. And those discussions were magical: Designers and Developers working at the same thing, at the same time, bringing their perspective - without the need to constantly context switch (like in Scrumfall).*


*The builders formed what I would call a "temporary squad": Working focused on one thing while still being in exchange with their peers so that the overall architecture and visual esthetics do not suffer.*

   ![](2022-11-16-shape-up-teamsetup-squad.svg)

An exciting aspect emerged for the rest of the team (working within a regular Scrum track): Communication for them was also much more efficient when there were no longer 4 developers but only 2 developers who had to coordinate. ([Remember: communication increases exponentially](https://www.leadingagile.com/2018/02/lines-of-communication-team-size-applying-brooks-law/).)
*This avoids situations where in backlog refinement/grooming, there are sometimes discussions that only concern some attendees: If 1 UI + 1 dev argues about a particular detail, it doesn't help that 2 UI designers (and sometimes even the other developers) are present for this time.*

Our Learnings:

- Designers should (as developers) also not be shared across Shape Up and Scrum when possible.
- If we want to continue this work style, we see Kanban as a better fit for the baseline work than Scrum.
- Collaborative shaping workshops are better in the real world (not remote)!
- Cycles can vary in length, depending on the feature and other circumstances.
- When the scrum team is stretched thin, it is crucial not to create additional pressure on them with too many new features when they are already busy onboarding customers and fixing bugs.
- *Unscoped work for the first week works surprisingly well, and everybody is just starting with what's within reach, finding out what the real work is that needs to be done*
- *We underestimated how much work needs to go into the Pitch. So in the end it was probably overshaped in some parts, while it was undershaped in others. [It seems, that the "perfect pitch" would need a lot more technical / codebase knowledge involved during shaping.](https://www.youtube.com/watch?v=jnW0fAIpLbo)*
- *This mixture of too much and too little detail simultaneously created much pressure on the team.*
- *While on the other hand, when the technical unknowns are not really covered, but just "assumptions it is very hard to discuss the appetite.*


Things that we have not implemented from Shape Up:

- We didn't have multiple pitches competing (yet)
- Therefore, no betting.
- We didn't use [Hill charts](https://basecamp.com/shapeup/3.4-chapter-13#work-is-like-a-hill) for progress but integrated the Shape up Team into our Scrum reviews.

 ### Bigger Picture
*To scale up Shape Up for larger Orgs, UX must end up in a position where it only provides sparring to the builders while already leading the pitches for the next feature together with the PO.*

   ![](2022-11-16-processes-scrum-vs.-shapeup-v3-compare.svg)

*But because our pitch could have been at a better altitude, we needed to make some decisions during the sprint. So we ended up in an "RND Mode".
This will scale poorly for a larger product/dev org. But in the end, it was a fundamental agile approach because we could show real things to actual customers, making important decisions on the way.*

   ![](2022-11-16-processes-scrum-vs.-shapeup-v3-corporate-rnd-mode.svg)

## Whats next?
This particular team's next step is to decide its future process. But not by a rash decision to throw Scrum entirely overboard. First, the other engineers and designers need to gather some experience with Shape up. Only then a well-informed (*and advocated!*) decision for the future process is possible for the whole team.

*Ultimately, it is not just about Scrum vs. Shape Up. [It is essential to know the methods (in their purity) and to have applied them. Only then can you properly assess and use the tradeoffs.](https://changelog.com/gotime/247)*

So, if you (as the reader) will only take away one thing: You can have both. You can try something out without sacrificing what works.

It is the scientific method - just for processes.

*But somebody needs to own the process of improving the process ([as Cal Newport wrote in his book](https://www.calnewport.com/books/a-world-without-email/)).*

If there are any questions, inspirations, or other thoughts: feel free to contact me via [email](mailto:kb@v01.io). I am happy to chat about this topic and Shape Up in general - because this brings an exciting new aspect to my 12-year-long journey: teams working happy, focused, and collaboratively on problems that are worth it.

So, was this all? No, not quite.

This blog article is the first of a whole series I plan to write on how Shape Up can work for existing scrum teams. Feel free to give me feedback on what to write about next.

