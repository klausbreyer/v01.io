---
title: "Sticky Notes Over Figma: Breadboarding as an Inclusive Way to Shape Software"
date: 2026-08-14
aliases:
  - /posts/2026-breadboarding/
categories: ["Agile"]
image: breadboard-myo-example.png
linkedin: |
  Anyone else know this one?

  A designer produces everything in Figma. The engineers review it, give a little feedback, and then start implementing. Somewhere along the way, they discover parts nobody thought through.

  Breadboarding flips this.

  Today I wanted to share a small example from our actual practice. The picture shows one of our boards.

  Yes, it looks messy. That is intentional. The board is a working surface, not a deliverable.

  And why this element is the central one: we put our human brains to work, we run into the friction together, we hold it, and we resolve it.

  Link to my latest blog post in the description.
---

Here is a pattern I have seen too many times: A designer produces 100 Figma screens. The engineers review them, give a little feedback, and then start implementing. Somewhere along the way, they discover parts that nobody thought through, because one discipline designed the solution and handed it to the next.

Breadboarding flips this. The name comes from electronics: a breadboard is a prototyping board where you figure out which components you need (how many LEDs, which transistors, which prefabricated parts) before you commit to mass production. You test the circuit cheaply before you invest in the real thing.

![Hardware breadboard](breadboard-hardware.png)
(Source: [Breadboard, Reichelt](https://www.reichelt.de/de/en/shop/product/development_boards_-_voltage_supply_for_plug-in_boards-202832))

In Shape Up, [breadboarding](https://basecamp.com/shapeup/1.3-chapter-04#breadboarding) works the same way. You start with an empty board. Pink stickies for places (pages, containers), yellow stickies for affordances (buttons, inputs, copy), arrows for interactions. That is the entire notation. No wireframe tool, no design expertise required. You figure out the components and their connections before anyone commits to building it.

Here is a concrete example from [myo](https://myo-formfix.de). We use breadboarding, but we still stitch it together with screenshots from the current system, and with small hi-fi prototypes where our designer needs them.

![Breadboard at myo, mixed with screenshots from the current system and hi-fi prototypes](breadboard-myo-example.png)

Yes, it looks messy. That is intentional. The board is a working surface, not a deliverable. Nobody tidies it up afterwards, because the moment it becomes something to present, people stop drawing on it.

## Engineers Take the Lead

This is the part that surprises people: in a breadboarding session, engineers take the lead. Not because they are in charge, but because they are closest to what is technically possible and what is not.

Technical realities shape the flow through an application. Can we send emails at this point? Do we have this data available? Can we run these two things in parallel or does one depend on the other? Engineers know this. When they develop the interaction flow from scratch on a whiteboard, they are shaping the solution, not just receiving it.

When I was an engineer myself and got handed 100 Figma screens, I gave a little feedback, sure. But I was not really part of the solution. I always discovered things during implementation that nobody had considered technically. Parts nobody thought through, because everyone just assumed they would work.

If you develop the flow together, in this deliberately cheap format, that stops happening.

## Designers Can Finally Focus on Users

Here is the other side: when engineers lead the technical flow, designers are free to do what they are best at.

Instead of worrying about whether an API can deliver certain data, or whether a database schema supports a particular view, designers can focus on the user experience. They can constantly ask: does this flow make sense from a user's perspective? Are we losing someone at this step? Is this interaction intuitive?

A designer who has to think about whether something is technically feasible is wasting their expertise. That is not their job. Their job is usability risk. Engineering owns feasibility risk. Product owns business viability. Breadboarding is the format that lets all three disciplines operate at their strengths, at the same level, at the same time.

## The Notation

The notation is deliberately simple. Depending on your setup, you can do it on paper or digitally in a tool like Miro.

On paper, with a marker:

![Handwritten breadboard notation](breadboard-notation-handwritten.jpg)

Or virtually, with digital stickies:

![Breadboard notation legend: place, affordance, technical detail, interaction, reference, time bomb](breadboard-notation-legend.png)

## Why Stickies, Not Wireframes

Being inclusive is the whole point. When you only see pink and yellow stickies, every engineer can contribute. Every product manager can sketch an alternative flow. Nobody needs to know Figma, nobody needs UX taste. An arrow and a rephrased sticky note is all it takes.

This does two things at once:

**It prevents overproduction.** If a designer creates all the detailed screens before the team has figured out the actual flow, those screens have internal dependencies. You cannot remove one screen later and expect the rest to still make sense. All that effort, wasted. With stickies, changing direction costs nothing.

**It forces everyone to think it through.** Not one profession moves forward too early. Not a complete PRD from product, not 100 Figma screens from design. Everyone works at the same altitude. The strategic decisions happen first, together. The tactical decisions (where exactly is the button, what color, what copy) move into the delivery phase, where the team can make them autonomously.

## A Fundamentally Different Way of Collaborating

Engineers lead the technical flow. Designers lead the user perspective. Product leads the business case. Nobody is stuck doing someone else's job. Nobody is reviewing something they had no part in creating. And the result is a solution that all three disciplines own, because they shaped it together.

AI would say: That is not a process improvement. That is a fundamentally different way of collaborating.

Does this create friction? Yes, definitely. In. every. single. case. But it creates the friction at the right moment, while everyone is still at the drawing board.
