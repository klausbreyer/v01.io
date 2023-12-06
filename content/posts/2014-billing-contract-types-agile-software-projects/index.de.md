---
title: "Abrechnung und Vertragsarten bei agilen Softwareprojekten"

date: 2014-03-01T11:26:47+01:00
publishdate: 2014-03-01T11:26:47+01:00
lastmod: 2021-06-29T10:37:38+02:00
draft: false
categories: ["Engineering Org"]
tags:
  [
    "Agile",
    "Contracts",
    "Billing",
    "Software Development",
    "Project Management",
  ]

aliases:
  - /posts/abrechnung-und-vertragsarten-bei-agilen-softwareprojekten/
---

Ein Thema, über das man ungerne redet: Verträge und Abrechnung. Denn wie rechnet man agile Softwareprojekte am sinnvollsten ab? Vor allem wenn der Aufwand 100 oder mehr Abrechnungstage beträgt, ist es fast unmöglich einen fairen Preis zu finden. Im schlimmsten Fall versucht man dann, ein ohnehin schon sehr komplexes Projekt, noch komplexer zu planen und geht massiv mit Konzeption in die Vorleistung. Aber dabei gibt es doch schon einige Standardsituationen, an denen man sich orientieren kann. Zielsetzung -

- Grundsätzlich möchten wir im Vertrag einen Rahmen setzen, der Kooperation garantiert und Verletzungen von Kooperation ahndet.
- Wir möchten die anfänglich gegebene Komplexität nicht durch einen noch komplexeren Plan oder Planungsprozess steigern.
- Unsere Erfahrung zeigt: Empirie & Wissen zu Lösungen entsteht emergent während des Projekts.
- Wir möchten teure Change Requests und der damit einherkommende Verwaltungs-Overhead vermeiden.
- Wir streben hohen Business Value an - nicht die Diskussionem über den Vertrag oder dessen Strafen.

Vertragsarten Festpreis

- Bezahlung nach Festpreis auf Basis eines Lasten-/Pflichtenheftes.
- Bezahlung nach Abnahme.
- Risiko 100% auf Dienstleister-Seite.
- Anforderungen sind zum Teil nicht schätzbar.
- Teuer für den Kunden
- Kein Fokus auf Business-Value.
- Teure Change-Requests.
- Empirie & emergentes Wissen zu Lösungen entsteht während Projekt.
- Anforderungen ändern während Projekt, da auch der Kunde lernt.

Das ist deutsches Werkvertragsrecht aus einer Zeit, als es noch keine Softwareentwicklung gab. T&M - Time & Materials

- Bezahlung Stundenweise
- Solange bis das vereinbarte Projekt fertiggestellt ist.
- Risiko liegt 100% auf Auftraggeber-Seite
- Ohne weitere Elemente (Scrum, Eigenmotivation, etc.) gibt es wenig Anreiz für den Dienstleister hohen Business-Value zu liefern

Das ist das andere extrem. Je nach Situation, Klarheit von Anforderungen, Möglichkeiten des Kunden, kann reines T&M Sinn ergeben. T&M mit Abbruch

- T&M: Bezahlung Stundenweise
- Kunde merkt nach einigen Sprints, dass nicht mehr viel Business Value zu holen ist.
- Mit einem Vorlauf von z.b. 1 Sprint kann der Kunde jederzeit nach einem Sprint das Projekt beenden.
- Vorlauf notwendig, damit der Dienstleister die Ressourcen umplanen kann.

Vorteile für beide Seiten, Kooperation wird gestützt. "T&M on Steroids"

- T&M: Bezahlung Stundenweise
- Abrechnung nach abgeschlossenen Sprints
- Kunde kann ohne Angabe von Gründen einen einzigen Sprint nicht bezahlen
- Sonderkündigungsrecht des Dienstleisters, wenn der Kunde das 2. Mal einen Sprint nicht bezahlt.

Ergebnis: Verkettung beider Seiten in Kooperation. Der Kunde überlegt sich sehr genau, wann er einen Sprint nicht bezahlt. Der Dienstleister hat ein Interesse an guter, ergebnisorientierter Arbeit. Agil mit Festpreis

- Beiden Parteien ist bewusst, dass kein fixes Feature-Set geliefert werden kann. Das Budget aber ist fix definiert.
- Es kann kein Gesamtwerk definiert werden.
- Eine einzelne User Story stellt ein Mini-Gewerk dar, auf das Gewährleistungsregeln angewandt werden.
- Team kann User Stories ablehnen, wenn diese aus ihrer Sicht nicht ausreichend spezifiziert/schätzbar sind.
- Abnahme des Mini-Gewerks im Sprint-Review. Bei Nicht-Abnahme (weil Story nicht erreicht!) kommt die Story zurück ins Backlog und wird z.b. für den nächsten Sprint wieder eingeplant.
- Monatlicher Retainer aufgrund der erbrachten Leistungen
- Wird eine bereits realisierte User Story durch eine neue erweitert/ersetzt, so beginnt die Gewährleistung neu.

Gewährleistung verteilt sich auf mehrere Mini-Gewerke statt auf ein großes Gewerk. Entkopplung der Bezahlung von Gewährleistung/Abnahme. Nur wenn im Nachhinein, also im Betrieb, etwas Abgenommenes nachweislich nicht stimmt, muss kostenlos gefixt werden. Money For Nothing, Changes For Free

- Standard fixed price und T&M für Changes.
- Tausch von Features gleichen Aufwands (SP), sofern noch nicht begonnen. (Changes For Free)
- Neue Features möglich, wenn Low Prio Features mit gleichem Aufwand wegfallen.
- Hält der Kunde sich nicht an Scrum, wandelt sich das Projekt in reines T&M.
- Beide Parteien können sich auf SP-Schätzungen einigen. Ansonsten Umwandlung in T&M.
- Wenn Kosten eines Features teurer als Business-Value, dann Abbruch des Projekts.
- Ausgleich für frühzeitige Beendigung des Projekts: 20% des übrig gebliebenen Budgets geht zusätzlich an den Dienstleister (Money for Nothing)

Lohnt sich nur bei Optimierung auf Business-Value. Und nur wenn klar ist, dass das Budget nicht bis zum Ende aufgebraucht werden soll. Lohnt sich nicht, wenn das Budget sowieso gut und sinnvoll genutzt werden kann. Fazit Am wichtigsten ist, dass keine Gewährleistung auf ein ganzes Produkt gegeben wird, sondern das Risiko auf einzelne User Stories / Features heruntergebrochen wird. Weil man als Dienstleister sonst in die Problematik kommt, dass ständig neue Features gewünscht sind. Ist das Budget dann mal fix definiert, können einzelne Features immer noch getauscht oder anders priorisiert werden. Disclaimer: Ich bin kein Anwalt und das ist natürlich keine Rechtsberatung. Der Beitrag ist angelehnt an einen [Vortrag](http://de.slideshare.net/BjoernSchotte/vertraege-in-agilen-projekten?) von Mayflower – aber in einer etwas übersichtlicheren Form Für noch mehr Lektüre sei das Buch [Der agile Festpreis\*](https://amzn.to/31qiRbp) empfohlen.
