---
title: "Checkliste zur Analyse bestehender Projekte"

date: 2016-02-21T11:22:55+01:00
publishdate: 2016-02-21T11:22:55+01:00
lastmod: 2021-06-29T10:40:29+02:00
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

aliases:
  - /de/posts/checkliste-zur-analyse-bestehender-projekte/
  - /posts/checkliste-zur-analyse-bestehender-projekte/
---

In meiner Eigenschaft als Freelance CTO habe ich in der Vergangenheit auch regelmäßig mit komplett neuen Projekten und Codebases zu tun. Manchmal muss ich mich ganz reinabeiten, manchmal muss ich nur die Struktur erst mal bewerten. Im folgenden möchte ich einmal mit euch meine Checkliste dafür teilen mit welcher ich bei einem neuen Projekt aufschlage.

## Team

- Teamlead?
- Teamstruktur?
- Background der Teammitglieder
- Studium
- Berufserfahrung
- Interessante vorherige Arbeitgeber=

## Stack

- Programmiersprache?
- Backend Framework?
- Frontend Framework?
- Datenbank?
- Weitere interessante Technologien /Frameworks? Worker Queues? Elastic Search, Solr?

## Code

- Styleguides? PSR?
- Testabdeckung Unit Tests?
- Dokumentation? Im Code?
- Versionierung? Git? Branches oder Pfuschen?
- Wurde Code übernommen oder lokal entwickelt?
- Wird Code von Dritten verwendet? Falls ja: Welche Software-Lizenzen stecken im Code?
- Package-Manager?

## Hosting

- Caching? Memcache? Varnish?
- Hosting Anbieter?
- Server Standort?
- Loadbalancer?
- Lasttests?
- Ausfallsicherheit? Redundanter Backupserver?
- Backups? Prozess?
- CDN?

## Security

- <https://> ?
- Code Audits?
- Gab es bereits Angriffe?
- Ist das System Mehrmandantenfähig?
- Wie werden einzelne Mandanten voneinander abgegrenzt?

## Rechtlich

- Werden ADV abgeschlossen?
- ISO-Normen? 9001?
- Technisch Organisatorische Maßnahmen?
- Weitere Zertifizierungen?

## Features

- Handelt es sich bei dem Produkt um einen Managed Service oder melden Kunden sich selbst an?
- Multilingual? Vorbereitet? Wie viele Sprachen implementiert?
- ACL?
- Wie erweiterbar ist das System?
- Wie echtzeitfähig ist das System?
- Cronjobs? Routineaufgaben?
- Ist eine besondere algorithmische Leistung erbracht worden?

## Prozess

- Frontend-Workflow? Gulp? Webpack?
- Feste Releasezyklen? Wöchentliche Deployments?
- Integration Tests?
- Deployment Prozess? Continous Integration?
- Behaviour Driven Development?

Feedback auf meine Checkliste ist ausdrücklich erwünscht. :)
