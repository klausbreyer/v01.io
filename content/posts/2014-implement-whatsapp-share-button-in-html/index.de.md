---
title: "Den WhatsApp Share Button in HTML implementieren"
author: Klaus Breyer
date: 2014-02-21T18:18:00+01:00
publishdate: 2014-02-21T18:18:00+01:00
lastmod: 2021-06-29T10:40:30+02:00
draft: false
tags: ["facebook", "whatsapp"]
categories: ["Code"]
aliases:
  - /posts/den-whatsapp-share-button-in-html-implementieren/
---

WhatsApp bietet neuerdings (Dieser Artikel wurde 2014 geschrieben) einen Share Button. Buzzfeed testet ihn schon seit Anfang an, hatte ihn jetzt aber jüngst wieder entfernt. Der Button bietet die sehr praktische Möglichkeit, einen Artikel über WhatsApp zu teilen. Das hat mich natürlich sehr interessiert und ich habe mir den Button mal etwas genauer angeschaut. :)

## Wie geht das?

Hinter dem whatsapp Button liegt ein einfacher Link, welcher einen sogenannten native Deeplink direkt in die WhatsApp App hinein erzeugt und so der App einen Text übergibt. Ähnlich wie einen mailto:-Link kann diesen Link jeder in seine eigenen Website einbauen. Und zwar so:

```html
<a href="whatsapp://send?text=Text durch native Deeplink!">Send</a>
```

{{< rawhtml >}}
<a href="whatsapp://send?text=Text durch native Deeplink">
Bist du mobil auf der Seite? Dann kannst du den Code direkt hier testen.
</a>
{{< /rawhtml >}}

.

## Wie sieht das aus?

Nachdem man auf den Link geklickt hat, öffnet sich WhatsApp mit dem Inhalt, welcher hinter ?text übergeben wurde. Das sieht dann so aus:
![](2014-09-29-buddybrand-WhatsUp-WhatsApp-.png)

## Worauf ist zu achten?

Inzwischen funktioniert der Button sowohl für iOS als auch für Android und Windows Mobile. Beim Mac OS Betriebssystem öffnet sich die Desktop-WhatsApp App.

Bei der Implementierung muss des Weiteren darauf geachtet werden, dass nicht WhatsApp-Buttons von Drittanbietern geklaut werden, bei denen das Copyright nicht geklärt ist.

## Was passiert, wenn WhatsApp nicht installiert ist?

Wenn WhatsApp nicht installiert ist, wird der Nutzer in den App-Store geführt (In iOS und Mac OS auf jeden fall). Dort kann er sich WhatsApp dann installieren. Allerdings ist die Conversion für den Klick dann quasi beendet. Der Nutzer muss sich ja erst mal für WhatsApp anmelden und seine Freunde finden, bzw. zumindest einloggen und einen alten Account wieder reaktivieren.

Dies kann man Abfangen, um falscher Erwartungshaltung vorzubeugen, indem man den Nutzer vor dem Buttonklick vielleicht noch einmal fragt: Hast du WhatsApp installiert?

## Fazit

Ein wirklich einfaches wie effektives Mittel. Es ist im Gegensatz zum Facebook Button noch nicht mal Javascript o.ä. benötigt, sondern man bedient sich den nativen Funktionen des Betriebssystems. Die Möglichkeit ist also sehr leichtgewichtig und passt damit optimal zu einer einfachen mobilen App, wie es WhatsApp nun mal ist.

## Übrigens

- [Bei AllFacebook.de gibt es noch einen ausführlicheren Artikel von mir, worauf geachtet werden muss.](http://allfacebook.de/features/was-der-whatsapp-share-button-kann-und-worauf-geachtet-werden-muss)
- [Laut Recode wurde dieser Button bei buzzfeed sogar öfter geklickt, als der Twitter Button](http://recode.net/2014/02/20/before-facebook-deal-whatsapp-was-helping-buzzfeed-and-shazam-go-viral-with-new-platform-tools/).
- [Und Marcel Weiss von Neunetz sieht sogar eine Gefahr für Facebook dadurch!](http://www.neunetz.com/2014/02/20/buzzfeed-sieht-mehr-aktivitat-bei-whatsapps-share-button-fur-apps-als-beim-twitter-button/)
- [Rechtliche Zulässigkeit von WhatsApp Sharing-Button](http://www.it-recht-kanzlei.de/whatsapp-sharing-button-direktmarketing.html)
