---
title: "How I Do Job Interviews in 2026"
date: 2026-06-11
categories: ["Engineering"]
---

This morning, one of our engineers spent 45 minutes with a candidate. No algorithm quizzing, no whiteboard. Pairing. In our actual codebase, on a real task.

That session is the core of how I run technical interviews these days. And since I just sent out the emails for the current round, I want to write the whole process down - staying as close as possible to what candidates actually receive from me.

Back in 2017, I already wrote an [interview guide]({{< relref "2017-interview-leitfaden-engineer-developer-job-interviews" >}}). Much of it still holds. But one thing has fundamentally changed by 2026: a clean solution to a toy task proves nothing anymore. Any AI tool writes that for you in five minutes.

## The whole process fits in one email

This is the email candidates get when they make it to the technical round, verbatim:

> Hey, congratulations, you've made it to the next round!
>
> We'd love to move forward with you into the technical round. The coding task happens directly on our actual codebase. We want to get a realistic sense of how you handle the complexity, and over the course of the process you'll pair directly with one of our engineers, so it's as much about working together as it is about the code itself.
>
> Here's the timeline at a glance:
>
> This week:
> - Today: I'll send you the NDA. I'll need it back signed by tomorrow, along with your GitHub handle so we can give you access to the code.
> - Tomorrow, 4 June: You'll get the task, including a short walkthrough from one of our engineers to get you started.
>
> Week of 8 June:
> - Time for you to dig into it.
> - Thursday, 11 June (morning): a 45-minute session with our engineers for pairing and questions.
> - Afterwards you'll have more time to finish it.
>
> Week of 15 June:
> - Monday evening, 15 June: submission deadline. You hand in your code, plus a short video in which you walk us through your solution (your thinking, the key decisions, anything you'd want to highlight).
> - After that we'll review and decide who to advance to the next round.
>
> Week of 22 June:
> - Tuesday, 23 June (morning): team-fit interview. Here you'll get to meet 2-3 more people from the team, including from PM and design.
>
> I'll already send out calendar invites for the next steps so we can block the time on both sides. If something doesn't work for you, or if anything unforeseen comes up along the way, just let me know and we'll re-schedule, no problem at all.
>
> And of course, feel free to reach out anytime if you have questions. We're really looking forward to working with you!
>
> Cheers,
> Klaus

A few things in there I wouldn't skip anymore:

**The task happens in our actual codebase.** No sandbox, no todo-app clone. Real code has history, compromises, and rough edges, and dealing with exactly that is the job. That requires an NDA and a GitHub invite. (I anonymized our commit history with the help of codex beforehand.)

**The full timeline is set on day one.** Candidates usually have a job, often several parallel processes, sometimes a family. A process that drips along in installments ("we'll get back to you") is disrespectful of their time. All appointments go in the calendar on day one, on both sides. Rescheduling is explicitly fine.

**The pairing session sits in the middle, not at the end.** That placement is deliberate. If someone gets lost in a corner that has little to do with the core of the task, we can steer them back while there's still time. The submission should show what we actually want to see, not punish a wrong turn in the first days.

**The submission is code plus video.** In 2026, the video is the genuinely interesting part. Code alone no longer tells me much about who wrote it. How someone explains their decisions and trade-offs: no tool can do that for you. And not everyone shines under live interrogation; a video can be recorded calmly.

**Team fit comes at the end.** Two to three more people from the team, explicitly including PM and design. Our engineers don't work in a silo, so engineering isn't the only voice in the decision either.

## The task: real tech debt, not a puzzle

The task itself comes straight off our board. A recent key-management migration left a corner of our authentication handling in a state nobody is proud of, and candidates get to refactor a slice of it. No planted bug, no artificial puzzle: the same work our team would otherwise pick up next.

To get them started, the task arrives with a recorded walkthrough from one of our engineers, split into three Loom videos, plus real internal documentation, for example our data and encryption concept. Shared the way it actually is:

> - It's still work in progress, so small details may change over the next few days.
> - It's German only, sorry about that. We need it in German as the leading document for a major customer, so feel free to run it through a translation tool if that's easier for you.

I could polish the docs beforehand. I don't. Documents in flux and a leading document that has to be in German for customer reasons: that's our everyday work. Why should the interview show anything else?

## The process is the probation period in miniature

The process simulates the collaboration, not the application. Both sides see in advance what it feels like to work together: real code, real docs, real people from the team. If it's a match after that, it's a resilient one.

And if not, candidates have still seen something honest: how we really work. That's more than most interviews offer.
