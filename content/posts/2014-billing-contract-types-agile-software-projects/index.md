---
title: 'Billing and contract types in agile software projects'
author: Klaus Breyer
date: 2014-03-01T11:26:47+01:00
publishdate: 2014-03-01T11:26:47+01:00
lastmod: 2023-01-10T14:58:38+01:00
draft: false
categories: ['Engineering Org']
social: "https://www.linkedin.com/posts/klaus-breyer_billing-and-contract-types-in-agile-software-activity-7036240860795019264-VPK7"
---

A topic that people prefer to avoid talking about: Contracts and billing. After all, what is the most sensible way to bill agile software projects? Especially when the effort amounts to 100 or more billing days, it is almost impossible to find a fair price. In the worst case, you try to plan an already very complex project even more difficult and go massively with conception in advance. But some typical situations can already be used as a guideline.

The objective:

- We want to set a framework in the contract that guarantees cooperation and penalizes violations of cooperation.
- We want to avoid adding to the initial complexity by making the plan or planning process even more complex.
- Our experience shows: Empiricism & knowledge about solutions emerge during the project.
- We want to avoid expensive change requests and the associated administrative overhead.
- We aim for high business value, not discussing the contract or its penalties.

### Contract types Fixed-price

- Payment is according to a fixed price based on specifications.
- Payment after acceptance.
- Risk 100% on the service provider side.
- Requirements could be more estimable.
- Expensive for the customer
- No focus on business value.
- Expensive Change Requests.
- Empirical & emergent knowledge of solutions emerges during the project.
- Requirements change during the project as a customer also learns.

This is the German "Werkvertragsrecht" from when there was no software development.

### T&M - Time & Materials

- Payment by the hour
- Until the agreed project is completed.
- Risk is 100% on the client side.
- Without additional elements (Scrum, self-motivation, etc.), there is little incentive for the service provider to deliver high business value.

That is the other extreme. Depending on the situation, clarity of requirements, and possibilities of the customer, pure T&M can make sense.

### T&M with cancelation

- T&M: Payment by the hour
- After a few sprints, the customer realizes little business value is left.
- With a lead time of, e.g., 1 Sprint, the customer can terminate the project at any time after a Sprint.
- The lead time necessary for the service provider to reschedule resources.

Advantages for both sides, cooperation is supported.

### T&M on Steroids

- T&M: Payment by the hour
- Accounting after completed sprints
- Customer cannot pay for a single sprint without giving reasons
- Special termination right of the service provider if the customer does not pay for a sprint the 2nd time.

Result: Chaining of both sides in cooperation. The customer thinks very carefully about when not to pay for a sprint. The service provider has an interest in sound, results-oriented work.

### Agile with fixed price

- Both parties are aware that no fixed feature set can be delivered. The budget, however, is fixed.
- No complete work can be defined.
- A single user-story represents a mini-work to which warranty rules are applied.
- The team can only accept user stories if they are sufficiently specified/estimated from their perspective.
- Acceptance of the mini-work in the sprint review. In case of non-acceptance (because the story is not achieved!), the story is returned to the backlog and is scheduled again for the next sprint, for example.
- Monthly retainer based on services rendered
- If an already realized user story is extended/replaced by a new one, the warranty starts anew.

Warranty is distributed over several mini-trades instead of one large trade. Decoupling of payment from warranty/acceptance. Only if something that has been accepted is demonstrably not right after the fact, i.e., during operation, does it have to be fixed free of charge.

### Money For Nothing, Changes For Free

- Standard fixed price and T&M for changes.
- The exchange of features of equal effort (SP) still needs to be started. (Changes For Free)
- New features are possible if low-prio features are dropped with the same effort.
- If the customer does not adhere to Scrum, the project becomes pure T&M.
- Both parties can agree on SP estimates. Otherwise, conversion to T&M.
- If the cost of a feature is more expensive than the business value, cancel the project.
- Compensation for early termination of the project: 20% of the remaining budget goes additionally to the service provider (Money for Nothing)

Only worthwhile if optimized for business value. And only if it is clear that the budget should not be used up to the end. Not worth it if the funding can be used well and wisely anyway.

### Conclusion

The most important thing is that no guarantee is given on a complete product, but the risk is broken down into individual user stories/features. Otherwise, as a service provider, you will encounter the problem of constantly needing new features. Once the budget is fixed, individual features can still be exchanged or prioritized differently. Disclaimer: I am not a lawyer, and this is not legal advice. The article is based on a [lecture][1] by Mayflower - but in a more straightforward form.

I recommend the book [The Agile Fixed Price][2] for more information.

[1]: http://de.slideshare.net/BjoernSchotte/vertraege-in-agilen-projekten?
[2]: https://amzn.to/40IlOUl
