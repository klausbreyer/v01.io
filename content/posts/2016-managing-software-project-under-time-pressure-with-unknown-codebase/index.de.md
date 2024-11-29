---
title: "Wie man unter Zeitdruck ein Software-Projekt mit einer völlig fremden Codebase übernimmt und am Laufen hält."

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

aliases:
  - "/posts/wie-man-unter-zeitdruck-ein-software-projekt-mit-einer-vollig-fremden-codebase-ubernimmt-und-am-laufen-halt/"
categories: ["Engineering"]
---

Wer ein größeres Software Projekt übernimmt, dessen Codebase er nicht kennt, hat erst einmal mit viel Komplexität und Unsicherheiten zu kämpfen. Ein Rewrite kommt selten in Frage. Mal davon abgesehen, [dass Rewrites meist ohnehin Todesmärsche sind](http://chadfowler.com/2006/12/27/the-big-rewrite.html) , muss ja auch noch die laufende Plattform maintained werden. Meist sind auch die vorherigen Entwickler nicht sonderlich kooperativ.

"Never attribute to malice what can be adequately explained by stupidity.” ([Hanlons Razor](https://www.exceptionnotfound.net/fundamental-laws-of-software-development/))

Ich habe da inzwischen für mich ein Muster entwickelt, welches ich mit euch teilen möchte.
1.. Live-System auf reproduzierbare Infrastruktur hieven
Falls das Projekt bisher auf einem einzigen Hardware-Server gelaufen ist, oder auf einem händisch eingerichteten Cloud Server, gibt es gleich zwei Probleme:

1. Die Gefahr eines Single Point of Failure, der im Falle von Last schlecht kurzfristig skaliert
1. Das Environment und damit Fehler können nur schlecht reproduziert werden

Ein Cloud Service, welcher sich um das Deployment kümmert, wie Elastic Beanstalk oder eine Software wie Chef, hat den Vorteil von “reproduzierbaren” Infrastrukturen.

Ein exakt gleiches Environment zu haben, ist der springende Punkt: Oftmals unterscheiden sich Server in minimalen Konfigurationen, an die man nicht denkt. Ebenso ist oftmals auch die Lokale Umgebung immer leicht anders, als die Live-Umgebung. Ich sage nur: https, File Uploads oder Timezones.

In einem reproduzierbaren Environment können beliebig viele exakt identische Versionen der selben Software mit unterschiedlichen Datenbanken laufen.

Voraussetzung ist natürlich, dass die Software auf einem Stand ist, auf dem keine Daten lokal gespeichert werden. Assets der Nutzer wie Bilder etc. müssen auf einen Drittserver oder Drittanbieter wie z.B. [Amazon S3](https://aws.amazon.com/de/s3/) ausgelagert sein. 2. Demoumgebung mit sinnvollen Defaults
Um nicht jedes mal die allersten Stammdaten einzugeben, braucht es eine Demo-Umgebung, welche nach einem Deployment mit sinnvollen und Kunden vorzeigbaren Defaults aufwartet.

Wenn ein neues Feature entwickelt wird, ist dieser Datenbestand auch immer Ausgangsbasis.

Konfiguration:
Das kann durch ein einfaches Script, wie z.B. einem Symfony Command oder Default-Testdaten des eigentlichen Testrunners realisiert werden.

Cronjobs:
Dieses System ist dauerhaft live und wird vom Team für Präsentationstermine verwendet. Ein Cronjob setzt die Defaults nächtlich zurück. 3. Simulationsumgebung mit Live-Datenbestand
Da große Codebases erst einmal wie eine black Box daherkommen, braucht es eine 1:1 Simulationsumgebung des Live-Systems, welche von der Außenwelt hermetisch isoliert ist.

In diesem System können Entwickler / Tester sich im Namen jedes Accounts einloggen und sämtliche Aktionen ausführen, um zu beobachten wie sich das System verhält. Dieses System verschickt keine E-Mails ([bzw. leitet sie weiter an einen selbst](http://symfony.com/doc/current/email/dev_environment.html)) und ist nur von bestimmten erlaubten IP Adressen erreichbar. So kann man exakt nachvollziehen, was im Namen welches Nutzers passiert ohne selbst all zu große und ständige Hacks am Live-System durchzuführen.

Konfiguration:
Das System sollte natürlich über Firewall-Regeln und .htaccess abgesichert sein. Es benötigt einen Befehl, welcher einen Datenbankdump des Live-Systems nimmt und ihn in der Simulationsumgebung einspielt. Anschließend alle Passwörter auf einen einziges Default-Passwort zurücksetzen, welches hinreichend kompliziert ist.

Cronjobs:
Auf jeden Fall exakt die selben Cronjobs wie im Live System, um sämtliches Verhalten zu reproduzieren. 4. Staging Umgebung für beide Fälle schaffen
Sind die alltäglichen Bugs im Griff, wird weiterentwickelt. Um neue Features unter realen Bedingungen zu testen, benötigt es noch eine weitere Umgebung die sich exakt genau so verhält.
Je nach Anforderung kann die Staging Umgebung sowohl mit Demo-Daten arbeiten (am Beginn ganz neuer Features) oder ebenfalls mit den Simulations-Daten (Bugfixes, spätere Integration Tests) betrieben werden. Die Befehle um die jeweiligen Szenarien auszulösen, sollten an diesem Punkt natürlich bereits vorhanden sein.
Konfiguration:
Bei oder nach Deployment je eine der beiden Demo- oder Simulations-Konfigurationen auslösen.

Cronjobs:
Je nach Anforderung / Modus
Wohlgemerkt: Worst Case Szenario
Diese Tipps beziehen sich vor allem auf mittlere bis komplexe Projekte mit kleinem oder gar keinem Team, dessen Codebase gänzlich unbekannt ist und wo schnelle pragmatische Lösungen gesucht werden.

Das Hilft einem noch nicht, sämtliche Effekte welche unter besonderen Datenkonstellationen passieren, komplett abzutesten. Und es ersetzt auch keine Testabdeckung. Aber diese parallelen Systeme bringen einen schon mal gehörigen Schritt bei einem unbekannten System weiter, wenn es total unklar ist welchen Weg Daten durch ein System nehmen.

Nach und nach sollte der Code natürlich auf ein Niveau gehieft werden, indem es deterministischer ist, was bei welchen Daten passiert.
