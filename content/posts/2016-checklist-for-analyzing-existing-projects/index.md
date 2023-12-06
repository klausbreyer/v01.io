---
title: "Checklist for Analyzing Existing Projects"

date: 2016-02-21T11:22:55+01:00
publishdate: 2016-02-21T11:22:55+01:00
lastmod: 2023-04-14T17:46:29+02:00
draft: false
categories: ["Code"]
tags:
  [
    "Project Analysis",
    "CTO",
    "Freelance",
    "Code Evaluation",
    "Software Architecture",
    "Hosting",
    "Tech Stack",
  ]
---

As a freelance CTO, I regularly deal with completely new projects and codebases. Sometimes I have to dive deep into them, and sometimes I just need to evaluate the structure first. In the following, I would like to share with you my checklist, which I use when starting a new project.

## Team

- Team lead?
- Team structure?
- Background of team members
  - Education
  - Professional experience
  - Interesting previous employers

## Stack

- Programming language?
- Backend framework?
- Frontend framework?
- Database?
- Other interesting technologies/frameworks? Worker queues? Elastic Search, Solr?

## Code

- Style guides? PSR?
- Test coverage of unit tests?
- Documentation? In the code?
- Versioning? Git? Branches or messy code?
- Was code adopted or developed locally?
- Is third-party code used? If so: What software licenses are included in the code?
- Package manager?

## Hosting

- Caching? Memcache? Varnish?
- Hosting provider?
- Server location?
- Load balancer?
- Load tests?
- Fault tolerance? Redundant backup server?
- Backups? Process?
- CDN?

## Security

- <https://> ?
- Code audits?
- Have there been any attacks?
- Is the system multi-tenant capable?
- How are individual tenants separated from each other?

## Legal

- Are data processing agreements signed?
- ISO standards? 9001?
- Technical and organizational measures?
- Further certifications?

## Features

- Is the product a managed service or do customers sign up themselves?
- Multilingual? Prepared? How many languages implemented?
- ACL?
- How expandable is the system?
- How real-time capable is the system?
- Cronjobs? Routine tasks?
- Has any special algorithmic performance been achieved?

## Process

- Frontend workflow? Gulp? Webpack?
- Fixed release cycles? Weekly deployments?
- Integration tests?
- Deployment process? Continuous Integration?
- Behavior Driven Development?

Feedback on my checklist is explicitly welcome. :)
