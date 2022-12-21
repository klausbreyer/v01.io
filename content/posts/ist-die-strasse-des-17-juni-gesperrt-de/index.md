---
title: 'ist die Straße des 17. Juni gesperrt .de'
author: Klaus Breyer
date: 2015-12-08T13:49:17+01:00
publishdate: 2015-12-08T13:49:17+01:00
lastmod: 2022-08-02T13:47:55+02:00
draft: false
description: 'ist die Straße des 17. Juni gesperrt .de'
categories: ['Uncategorized']
---


![](og-1024x541.png)

Update: Das Projekt ist derzeit offline. Mehr dazu: unten.

Ich habe ja [dieses tolle Nebenprojekt, welches in Echtzeit anzeigt(e), ob die Straße des 17. Juni gesperrt ist](https://istdiestrassedes17tenjunigesperrt.de/).
  ## 2015: VIZ & PHP Symfony
Ich konnte die Aussage bisher dadurch generieren, indem ich automatisiert überprüfte, ob auf der Seite des [VIZ bei den Baustellen und Sperrungen](https://viz.berlin.de/verkehr-in-berlin/baustellen-und-sperrungen/) "17. Juni" erwähnt wird. Irgendwann in den letzten Monaten hat sich dort beim VIZ allerdings etwas verändert.
Ich kann nicht sagen, ob dieses Projekt der Auslöser war, jedenfalls wurde das Abgreifen der Daten schwieriger gemacht. (Und das trotz der [Open Data Innitiative von Berlin](https://daten.berlin.de)!)
  ## April 2020: Google Maps Distance Matrix API & Rewrite in Node
Ich jedenfalls habe mein Projekt angepasst und beziehe die Daten nun nicht mehr von dieser öffentlichen Stelle. Nun stelle ich eine Anfrage an die [Google Maps Distance Matrix API](https://developers.google.com/maps/documentation/distance-matrix/intro?hl=de) und rufe in Echtzeit ab, ob die kürzeste Route zwischen Brandenburger Tor und Ernst-Reuter-Platz kürzer als 5km ist und man sie in weniger als 15 min zurücklegen kann.

Die Aussagen sind damit also noch akkurater. In Zukunft plane ich auch, dass ich dies noch um eine "history" API erweitere, die die historischen Daten dafür erfasst.
Desweiteren habe ich das Open Source Projekt auf eine serverless Infrastruktur gebracht, es skaliert nun beliebig - auch bei der größten Großveranstaltung. Die wird es vermutlich dieses Jahr nicht geben, aber für die nächste Welt-Olympia-Sylvester-Meisterschaft bin ich vorbereitet.
Spoiler Alert: gerade ist es (corona bedingt) natürlich nicht gesperrt.
  ## April 2021: Rewrite in Go
Ich habe die API in Go noch einmal neu geschrieben. Wen die Details interessieren, kann sich die von mir erzeugten Rohdaten über [die API](https://europe-west3-istdiestrassedes17tenjunigespe.cloudfunctions.net/availability) direkt und live abrufen. Die Abfrage an die Google Distance Matrix API bleibt allerdings die selbe, wie letztes Jahr. Ich habe allerdings eine kleine Optimierung gemacht: Ich nutze nun Geokordinaten, um die Strecke noch präziser zu bestimmen.

Im Frontend habe ich das ganze Tracking und 3rd-Party Bloat von Google Analytics, Twitter und Facebook raus genommen.

[Es gibt nun auch eine API Dokumentation bei Postman.](https://documenter.getpostman.com/view/6113937/TzJu8cPL)

Noch gibt es immer noch keine Anzeichen von bald anstehenden Veranstaltungen - aber ich bleibe gespannt.

[Ihr seid herzlich willkommen, von diesem Open Source Projekt zu lernen und es noch besser zu machen.](https://github.com/apiapi-rest/istdiestrassedes17tenjunigesperrt)
  ## April 2022: Vorläufiges Ende
Ich habe das Projekt erst mal offline genommen. Google Maps wurde immer besser und ich brauche mehr Zeit, um mich auf andere Projekte zu fokusieren. Deshalb werde ich erst einmal nicht weiter Zeit in den Betrieb stecken. Aber: Stay tuned!
  ## Medien-Erwähnungen  <!-- wp:audio {"id":2283} --> Interview mit mir bei den Sonntagsfahrern auf radioeins[](https://www.radioeins.de/programm/sendungen/die_sonntagsfahrer/_/ist-die-strasse-des-17--juni-gesperrt-.html) <!-- /wp:audio -->
- [Im Januar ist der 17. Juni nur sechs Tage offen](http://www.bz-berlin.de/berlin/mitte/im-januar-ist-der-17-juni-nur-sechs-tage-offen)
- [Website zeigt, ob die Straße des 17. Juni gesperrt ist – Berlin.de](https://www.berlin.de/tourismus/infos/5045705-1721039-website-stra%C3%9Fe-des-17-juni-gesperrt.html)
- [Diese Seite verrät euch, ob die Straße des 17. Juni gesperrt ist](https://mitvergnuegen.com/2017/diese-seite-verraet-euch-ob-die-strasse-des-17-juni-gesperrt-ist/)




