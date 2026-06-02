---
title: "imaedge: Originalfotos gemeinsam sammeln"
date: 2026-05-30
categories: ["Open Source", "Travel", "Shipped"]
image: preview.de.png
---

![imaedge Homepage Vorschau](preview.de.png)

Weil wir inzwischen in Zeiten leben, in denen man schneller eine Lösung gebaut hat, als man sich lange über das Problem aufregt, habe ich [imaedge](https://www.imaedge.org/) gebaut.

Das Problem war einfach, und wir hatten es bisher in jedem Urlaub: Meine Frau und ich wollen unsere Fotos gemeinsam sammeln, aber keine der üblichen Lösungen passt so richtig.

Apple funktioniert für uns nicht, weil geteilte Fotoalben die Bilder komprimieren. Google Fotos funktioniert auch nicht, weil man immer alles synchronisieren muss. Noch dazu brauchen wir die Bilder danach wieder im Original, um von unterwegs WordPress damit zu befüllen und später ein Fotoalbum daraus zu machen.

## Ein geheimer Link für alle Fotos

Mit [imaedge](https://www.imaedge.org/) kann jeder einen geheimen Link erstellen und mit anderen teilen.

Alle mit dem Link können Fotos in eine gemeinsame Sammlung hochladen, und die Originaldateien bleiben erhalten.

Kein Account. Keine Komprimierung. Kein dauerndes Synchronisieren.

## Gebaut für schlechte Verbindungen

Besonders wichtig war mir der Upload selbst.

Die Bilder werden in kleine Chunks aufgeteilt hochgeladen. Gerade dort, wo wir oft Urlaub machen, ist der Empfang schlecht. Normale Uploads dauern ewig, brechen ab, oder man weiß nicht, in welchem Zustand sie gerade sind.

imaedge soll genau in diesen Situationen funktionieren: unterwegs, mit zwei Telefonen, vielen Bildern und einer Verbindung, der man nicht trauen sollte.

## Reihenfolge bleibt bearbeitbar

Man kann außerdem die Reihenfolge der Bilder anpassen, indem man das Datum aus den EXIF-Daten ändert.

Das klingt nach einem Detail, ist für unseren Workflow aber ziemlich wichtig. Wenn wir später einen Reisebericht schreiben oder ein Fotoalbum bauen, sollen die Bilder nicht danach sortiert sein, wer sie hochgeladen hat, sondern danach, wann der Moment wirklich passiert ist.

## Open Source

imaedge ist Open Source, falls ihr es für euch selbst aufsetzen wollt.

Der Code liegt auf GitHub: [github.com/klausbreyer/imaedge](https://github.com/klausbreyer/imaedge)

Falls ihr also mal gemeinsam Originalfotos sammeln wollt, ohne Account, ohne Komprimierung, ohne dauerndes Synchronisieren und ohne großes Theater: Dafür ist [imaedge](https://www.imaedge.org/) gebaut.
