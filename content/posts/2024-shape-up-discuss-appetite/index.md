---
title: "One question that changes everything in Shape Up – How to Discuss Appetite"
date: 2024-11-13T15:32:04+01:00
social: https://www.linkedin.com/posts/klaus-breyer_one-question-that-changes-everything-in-shape-activity-7262476423909490688-i8k9
categories: ["Agile"]
---

Let me share a recent story from a real project.

We're in week 4 of a 6-week cycle. We haven't entirely kept up with the expected speed, and it's taken much longer than anticipated because we had to modernize a lot of the architecture and the process. After all, the team is relatively new to an existing codebase.

Which is okay.

But we would need more time to complete everything we originally planned. I estimated it would take another four weeks, two weeks over the timebox.

The remaining scope is bulk user creation for our tenants. The plan was to build a form and an Excel upload feature to pre-populate the form automatically.

I raised this issue when the product, design, and engineering teams met to discuss this scope in more detail.

Then, I asked:

> Do we feel that finishing this scope perfectly is worth two extra weeks? Or are there other pressing matters that we need to focus on?

(For instance, we've been experiencing inconsistent behavior in the login/logout experience since the sprint began.)

Everyone initially agreed that it was essential to complete this feature thoroughly because our customers must have a suitable method of creating their users.

But then I asked:

> How would a 2-week version of this scope look? What could we leave out?

That's when the team clicked into the right mindset. Ideas started to flow. We arrived at a simpler version: just implementing the Excel upload with some basic verification/validation before user creation—no form.

Just creating an Excel upload would still provide a workaround to meet the essential need: bulk user creation. Plus, we structured the work so that this functionality could be expanded later to include the form. At the end of the cycle, we can now have a focused discussion about whether to add still that form or whether our time would be better spent addressing other critical issues.

[Ryan Singer wrote an excellent blog post about this kind of decision-making][1], including two key questions:

1\. Knowing the customer can't yet do what's in the idea, What are they doing instead?

2\. What's bad about that?

My take on it: Shipping early has the advantage of learning from how users use the feature. When we're ready to revisit, we might gain new insights into building the accompanying form.

[This is the beauty of working with "appetite" in Shape Up.][2] Only by approaching things this way—fixed time, variable scope— can a team stick to a fixed timeline. This requires a continual conversation about the scope and constantly challenging it, not just at the beginning or during the shaping phase.

Because initial estimates are just that: estimates and estimates are almost always off; we all know it.

Shape Up's Appetite is not only about setting boundaries. It is a communication technique!

And how impactful an open question can be instead of a reassuring question, showing how essential coaching skills are for a leader.

[1]: https://www.feltpresence.com/discovery-how-to-decide/
[2]: https://basecamp.com/shapeup/1.2-chapter-03
