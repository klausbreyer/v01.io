---
title: 'Dateiorganisation und Ordnerstrukturen in Unternehmen'
author: Klaus Breyer
date: 2014-04-01T21:13:34+02:00
publishdate: 2014-04-01T21:13:34+02:00
lastmod: 2021-06-29T10:37:31+02:00
draft: false
description: 'Dateiorganisation und Ordnerstrukturen in Unternehmen'
categories: ['Org']
---
![](Screen-Shot-2017-01-05-at-14.58.20.png)
Wer über die gemeinsame Ordnerstruktur in einem Unternehmen diskutiert, muss sich fragen, wie viel wirklich vorgegeben werden muss.
 Wie es geht..
Meine Empfehlung ist es, sich auf den kleinsten gemeinsamen Nenner zu einigen. Im Agenturkontext bei uns ist das:

/Kunde/Etat/Projekt/

Mehr nicht. Und wenn in einem Job mehr als ein Gewerk arbeitet, erstellt sich jedes Gewerk selbst innerhalb des Jobs nochmal seinen eigenen Ordner, also:

/Kunde/Etat/Projekt/Gewerk

Da jeder Job anders sein kann und auch verschiedene Gewerke daran arbeiten, gestaltet sich jeder Job organisch von selbst, während das Team darauf arbeitet. Bei kleinen Jobs muss man gar nichts strukturieren. Es schadet ja nicht, wenn 5 Dateien mal unsortiert in einem Ordner liegen.

Das ist ein schönes kleines Regelset, welches auch 1:1 mit unserer Abrechnung und unserer Zeiterfassung matched. Das macht es auch sehr mächtig, da es keinen Zweifel bei der Benennung gibt. Denn jeder weiß genau, an welchem Projekt er gerade arbeitet.
 .. und wie nicht.
Das hört sich jetzt sehr einfach an, aber wir hatten das auch schon anders. Und ich befürchte, viele andere Organisationen machen dies auch noch viel komplexer. Und ich weiß deshalb auch genau wie solche komplexere Strukturen entstehen, denn ich war selbst Teil eines solchen Prozesses.

Ein paar wenige Privilegierte versuchen für andere mitzudenken und versuchen deren Fehler zu vermeiden. Man sitzt dann in einem Meeting zusammen und überlegt sich bis ins letzte Detail, wie die Prozesse sind und welche Dateien für alle möglichen Projekte und alle möglichen Gewerke anfallen. Anschließend werden Konstrukte von leeren Ordnern erstellt, welche immer in neue Projekte kopiert werden. Herauskommen kann dann so etwas:

```
 00001_Kunde
 └── 103_Projekt_3
 ├── 00_Material
 ├── 01_Account
 │ ├── 00_Briefing
 │ ├── 01_Kosten
 │ ├── 02_Timing
 │ ├── 03_Korrespondenz
 │ ├── 04_Reportings
 │ └── 05_Notizen
 ├── 02_Konzept
 │ ├── 01_Grobkonzept
 │ ├── 02_Feinkonzept
 │ │ └── 120809_runde_1
 │ ├── 03_Wireframes
 │ └── 04_Text
 │ └── 120809_runde_1
 ├── 03_Design
 │ └── 120809_runde_1
 │ ├── PNG
 │ └── PSD
 ├── 04_Media
 ├── 05_Test
 └── 06_Deliverables
```

So sahen bei uns früher Projekte aus, bevor sie überhaupt gestartet sind. Auch wenn ich an der Entstehung dieses Konstrukts beteiligt war, bin ich überhaupt kein großer Freund mehr von solch leeren Ordnergerüsten. Leere Ordnergerüste sind nicht nur erhöhter Aufwand beim beim Erstellen, da jemand die Ordner kopieren muss, sondern zugleich auch noch ein höherer Aufwand beim Suchen, wenn Inhalte eben noch nicht vorhanden sind und ich mich durch 3 leere Ordner klicken muss, nur um zu sehen, dass noch nichts geschehen ist. Gleichzeitig zwingt die leere Hülle dem ganzen Projekt auch noch einen Prozess über, den es vielleicht gar nicht hat und der sich ohnehin ständig optimiert.
 Analyse
Die grundsätzliche Intension war eine Gute - es sollten Fehler vermieden werden. [Aber noch viel wichtiger ist es, Produktivität freizusetzen.](../20140115was-gute-prozesse-von-schlechten-prozessen-unterscheidet)

Eine Ordnerstruktur lebt von den Menschen die sie benutzen. Jeder kann sie jeden Tag durch abgelegte Dateien beeinflussen. Dafür braucht es keinen Account Manager, der in Sisyphusarbeit überprüft, ob alle Dateien vorhanden sind. Jeder einzelne fragt sich, ob alles da ist, was er benötigt, während er in - und mit - der Struktur arbeitet.

Die Dateien sind dann vielleicht nicht mehr so feingranular abgelegt, dafür aber insgesamt vollständiger, da das pflegen mit weniger Hürde verbunden ist.



