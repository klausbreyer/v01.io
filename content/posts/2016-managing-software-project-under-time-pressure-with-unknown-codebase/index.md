---
title: "Managing a Software Project Under Time Pressure With an Unknown Codebase"

date: 2016-08-23T09:20:28+02:00
publishdate: 2016-08-23T09:20:28+02:00
lastmod: 2021-06-29T10:40:28+02:00
draft: false
tags:
  [
    "software project",
    "codebase",
    "maintenance",
    "deployment",
    "testing",
    "staging environment",
  ]

categories: ["Code"]
---

When you take over a larger software project whose codebase you are unfamiliar with, you initially have to grapple with a lot of complexity and uncertainties. A rewrite is rarely an option. Apart from the fact that [rewrites are usually death marches](http://chadfowler.com/2006/12/27/the-big-rewrite.html), the existing platform must also be maintained. Previous developers are often not particularly cooperative.

"Never attribute to malice what can be adequately explained by stupidity." ([Hanlon's Razor](https://www.exceptionnotfound.net/fundamental-laws-of-software-development/))

I've developed a pattern for this situation, which I'd like to share with you.

**1. Elevate Live System to a Reproducible Infrastructure**
If the project has so far run on a single hardware server, or on a manually set up cloud server, there are two problems:

- The danger of a single point of failure that can't scale well in the event of heavy load.
- The environment and thus errors can be poorly reproduced.

A cloud service that takes care of the deployment, like Elastic Beanstalk, or software like Chef, has the advantage of "reproducible" infrastructures.

The critical point is to have an exactly identical environment: Servers often differ in minimal configurations that are overlooked. Likewise, the local environment is always slightly different from the live environment. I'm talking about https, file uploads, or timezones.

**2. Demo Environment with Sensible Defaults**
To avoid having to input the same master data every time, you need a demo environment that presents sensible and client-showable defaults after deployment.

Configuration can be achieved through a simple script, such as a Symfony command or default test data from the actual test runner.

Cronjobs on this system are live permanently and are used by the team for presentation appointments. A cronjob resets the defaults every night.

**3. Simulation Environment with Live Data Stock**
As large codebases initially seem like a black box, you need a 1:1 simulation environment of the live system, which is hermetically sealed from the outside world.

In this system, developers/testers can log in on behalf of any account and perform any actions to observe how the system behaves. This system doesn't send emails (or [forwards them to oneself](http://symfony.com/doc/current/email/dev_environment.html)) and is only accessible from certain approved IP addresses.

**4. Create a Staging Environment for Both Cases**
Once everyday bugs are under control, development continues. To test new features under real conditions, you need another environment that behaves exactly the same. Depending on the requirement, the staging environment can work with both demo data (at the beginning of completely new features) or with the simulation data (bug fixes, later integration tests).

**Keep in Mind: This is a Worst Case Scenario**
These tips refer mainly to medium to complex projects with a small or even no team, whose codebase is completely unknown and where quick pragmatic solutions are sought.

This doesn't help you to completely test all effects that happen under special data constellations. And it doesn't replace test coverage either. But these parallel systems take a significant step forward with an unknown system when it is totally unclear which way data takes through a system.

Gradually, the code should of course be brought to a level where it is more deterministic as to what happens with which data.
