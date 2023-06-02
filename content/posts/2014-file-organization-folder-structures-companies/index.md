---
title: "File organization and folder structures for companies"
author: Klaus Breyer
date: 2014-04-01T21:13:34+02:00
publishdate: 2014-04-01T21:13:34+02:00
lastmod: 2023-02-10T14:45:52+01:00
draft: false
categories: ["Engineering Org"]
tags:
  [
    "File Organization",
    "Folder Structures",
    "Business Processes",
    "Productivity",
  ]

image: "folder-structure.png"
social: "https://www.linkedin.com/posts/klaus-breyer_file-organization-and-folder-structures-for-activity-7038781261212971008-sj0Y"
---

Anyone discussing the typical folder structure in a company must ask how much needs to be specified.

I recommend agreeing on the lowest common denominator. In the agency context at our company, that is:

```text
/customer/contract/project/
```

No more. And if there is more than one trade working in a job, each trade creates its folder again within the job, so:

```text
/customer/contract/project/work
```

Since each job can be different and have different trades working on it, each job organically shapes itself as the team works on it. For small jobs, you don't have to structure anything. It doesn't hurt if five files are unsorted in one folder.

This is a nice little rule set that also matches 1:1 with our billing and our time tracking. This also makes it very powerful, as there is no doubt about the naming. Because everyone knows precisely which project they are working on - and how not.

Now, this sounds very simple, but we've had it differently. And many other organizations make this much more complex as well. And I, therefore, know exactly how such complex structures are created because I was part of such a process myself.

A few privileged people try to think for others and avoid their mistakes. People then sit together in a meeting and consider the last detail about the processes and which files are needed for all possible projects and trades. Then constructs of empty folders are created and continually copied into new projects. The result can be something like this:

```text
00001_Customer
└── 103_Project_3
├── 00_Material
├── 01_Account
│ ├── 00_Briefing
│ ├── 01_Costs
│ ├── 02_Timing
│ ├── 03_Correspondence
│ ├── 04_Reportings
│ └── 05_Notes
├── 02_Concept
│ ├── 01_Groud concept
│ ├── 02_Fine concept
│ │ └── 120809_round_1
│ ├── 03_Wireframes
│ └── 04_text
│ └── 120809_round_1
├── 03_Design
│ └── 120809_round_1
│ ├── PNG
│ └── PSD
├── 04_Media
├── 05_Test
└── 06_Deliverables
```

This is what projects used to look like in our company before they even started. Even though I was involved in creating this construct, I'm no longer a big fan of such empty folder frameworks. Open folder frameworks are not only an increased effort when making because someone has to copy the folders, but at the same time also an increased effort when searching when content just isn't there yet, and I have to click through 3 empty folders to see that nothing has happened yet. At the same time, the empty shell forces a process on the whole project, which it may not have and is constantly optimized anyway. Analysis The primary intention was a good one - to avoid mistakes. [But even more important is to foster productivity.]({{< relref "2014-what-distinguishes-good-processes-from-bad-processes" >}})

A folder structure lives from the people who use it. Everybody can influence it every day by depositing files. This does not require an account manager who checks in Sisyphus's work whether all files are present. Each individual asks himself if everything he needs is there while he works in - and with - the structure.

The files may then not be stored in such a fine-granular way, but in the grand scheme of things, everything is more in order since maintenance involves fewer hurdles.
