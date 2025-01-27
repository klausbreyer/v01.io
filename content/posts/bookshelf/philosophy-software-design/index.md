---
title: "A Philosophy of Software Design, John Ousterhout, 2021"
date: 2024-06-21
social: "https://www.linkedin.com/posts/klaus-breyer_a-philosophy-of-software-design-john-ousterhout-activity-7209854295003877376-gbiQ?"
categories: ["Bookshelf"]
aliases:
  - "/posts/2024-bookshelf-philosophy-software-design/"
---

{{< gallery "https://amzn.to/3VCsS3h,title.jpg" >}}

A Philosophy of Software Design is a book based on [John Ousterhout](https://en.wikipedia.org/wiki/John_Ousterhout)'s lectures at Stanford.

It has a nice flow and dives deep into the philosophy of software development. It is another one of those books that you could read over 2-3 weeks while reflecting on your current architecture and practices in your team.

Here are some key insights from my notes.

### The Nature of Complexity

Complexity is the root of all software problems. Ousterhout defines complexity as anything in the software's structure that makes it hard to understand and modify. Common symptoms include change amplification, cognitive load, and unknown unknowns. The main causes are dependencies and obscurity. Ousterhout advocates for a zero-tolerance policy because complexity grows incrementally.

### Working Code Isn't Enough

Programming is about more than just about making things work. There's a distinction between tactical and strategic programming. Tactical programming focuses on getting immediate results, while strategic programming aims for long-term maintainability.

### Deep Modules

A module should have a simple interface but hide a complex implementation. This approach makes the system easier to manage. Ousterhout emphasizes the importance of designing modules that address current needs but are general enough to support multiple uses.

### Information Hiding

Effective information hiding is crucial. Modules should expose as little as possible and keep their complexities hidden. This makes them easier to understand and modify.

### General-Purpose Modules

Creating modules in a "somewhat general purpose" fashion is beneficial. The functionality should reflect current needs, but the interface should be general enough to support multiple uses. Avoid designing modules solely for specific UI cases; focus on the problem domain.

### Different Layers, Different Abstraction

Each layer in the software should offer a different level of abstraction. Pulling complexity downwards into deeper classes helps maintain a simple interface. Configuration parameters often cause complexity to bubble up, so it's better to handle these within the module.

### Better Together or Better Apart?

Combine components if they share information, simplify interfaces, or eliminate duplication—separate general-purpose and special-purpose code for clarity.

### Define Errors Out of Existence

Handle errors in ways that prevent them from propagating. Techniques include defining mistakes out of existence, exception masking at low levels, exception aggregation at higher levels, and crashing if necessary.

### Design it Twice

Consider designing critical parts of your system twice. The first design reveals complexities and pitfalls, while the second design benefits from these insights.

### Writing Comments

Good code should be self-documenting, but comments are essential for capturing the designer's intent and thoughts that aren't obvious from the code. Comments should describe the "why" behind the code, not just the "how."

### Comments Should Describe Things Not Obvious from the Code

Developers should understand a module's abstraction without reading the code. Follow conventions like godoc or jsdocs, and avoid repeating the code in comments. Low-level comments add precision, while high-level comments enhance intuition. Cross-module design decisions should be documented separately and referenced in the code.

### Choosing Names

Names should create a clear and precise image. Use consistent naming and avoid extra words. If naming is difficult, reconsider the design for simplicity.

### Write Comments First

Use comments as part of the design process. A design is good if it can be clearly expressed.

### Modifying Existing Code

Stay strategic when modifying code. After each change, the system should appear as if it was designed that way from the start. Maintain comments close to the code they describe and avoid duplication.

### Consistency

Consistency in naming, coding style, interfaces, design patterns, and invariants is crucial. Document and enforce these conventions and adapt to existing ones even if you have a better idea.

### Code Should Be Obvious

Make code clear with good naming, judicious use of whitespace, and comments. Avoid practices that obscure code, like event-driven programming, generic containers, or mismatched declaration and allocation types.
