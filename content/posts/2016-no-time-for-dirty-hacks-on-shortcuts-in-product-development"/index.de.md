---
title: "Keine Zeit für Dirty Hacks: Über Abkürzungen bei der Produktentwicklung"

date: 2016-09-22T09:26:52+02:00
publishdate: 2016-09-22T09:26:52+02:00
lastmod: 2022-12-02T16:47:09+01:00
categories: ["Product"]
tags: ["agency", "product development", "software engineering"]
---

Ich war 6 Jahre CTO der Social Media Agentur [buddybrand](http://buddybrand.com) und bin nun fast ein Jahr CTO des SaaS Startups [BuzzBird](https://www.buzzbird.de).

Auch wenn der Themenbereich mit Social Media / Ad Tech sehr ähnlich ist, unterscheidet es sich doch fundamental, ob für (mehrere) Kunden ein Projekt abgewickelt, oder ein eigenes Produkt immer weiterentwickelt und besser gemacht wird.
Agentur-Dienstleistung
Der Vorteil einer Agentur ist sicherlich auch ihr Nachteil: Man hat da so Projekte am laufen. Und zwar eine ganze Menge Projekte. Bei buddybrand hatten wir in 3 Jahren 500 Apps geshipped.

Das bringt eine schnelle Lernkurve mit sich - für alle Beteiligten. Wenn ein Projekt mal eher so mittelmäßig lief, finden Learnings daraus direkt im nächsten Projekt Anwendung. Das Betrifft die Entwicklung genauso wie das Projektmanagement und die Zusammenarbeit sämtlicher Gewerke.

Gerade in der Entwicklung kann super mit neue Frameworks experimentiert werden. Wir hatten in all den Agentur-Jahren sicherlich 5 verschiedene Frameworks sowohl im Backend als auch im Frontend. Diese Erfahrung macht auch für die absurdesten Kundenwünsche unglaublich flexibel.

Leider existiert ein hoher Zeit- und Budget-Druck, so dass man oft hinter seinen Möglichkeiten zurück bleibt. Andererseits ist das ja auch irgendwie egal, da die Projekte selten für die Ewigkeit sind.
Produktentwicklung
Bei der Produktentwicklung gibt es keine Abkürzungen. Dinge müssen ordentlich gemacht werden. Alles, was einmal live ist, wird verwendet und beeinflusst zukünftige Entscheidungen.

Die Anwendungs-Architektur muss dabei so sauber wie möglich aufgesetzt sein,um sowohl Stabil zu sein als auch Handlungsspielraum zu gewähren. Dabei immer im Hinterkopf: Jede Stelle Code, die einmal geschrieben wurde, wird irgendwann auch noch einmal refactored.

Bei der Datenhaltung gibt es absolut keinen Toleranz für unsauber modellierte Daten. Jede Entscheidung zieht immer einen langen Rattenschwanz nach sich. Sei es das Format der Daten oder nur die Benennung von Datenbankspalten.

Es geht nicht mehr nur darum, ob rechtzeitig die Deadline geschafft wird, sondern wie aufwendig zukünftige Änderungen sind. Jedes Release erfordert bereits bestehende Daten zu migrieren und sehr aufwendig zu testen.

Das macht die Entwicklung von neuen Features deutlich langsamer, als die Freiheit bei jedem Release frisch zu starten.
Es gibt keine Abkürzungen
Jede Abkürzung oder jeder “Dirty Hack” kostet auf lange Sicht das doppelt davon, was er ursprünglich eingespart hat. Das heißt nicht, dass Produkt nicht schlank entwickeln werden sollten - aber sauber müssen sie sein. Es geht selten darum, ein neues Feature zwei Wochen früher zu shippen - sondern wo man nächstes Jahr ist und wie flexibel man dabei bleibt.

Auf der anderen Seite: Wer in einer Agentur arbeitet, sollte bitteschön auch immer den neusten heissen Scheiss nutzen und von der krassen Lernkurve profitieren.

Im Optimalfall kann während einem Berufsleben auch mehrfach die Seite gewechselt werden. Jede Seite profitiert von den Erfahrungen der anderen. Aktuell wechselt auch im Rahmen eines Mentorings meinerseits jemand “die Seite” - was mich bewogen hatte mal meine Gedanken dazu aufzuschreiben.
