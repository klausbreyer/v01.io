---
title: "SMB Olek, eine Apple-TV-App, die direkt von der SMB-Freigabe streamt"
date: 2026-09-17
categories: ["Shipped"]
image: preview.png
linkedin: |
  Ich wollte unsere Reisevideos von der SMB-Freigabe auf dem Raspberry Pi auf der Couch sehen. Also habe ich eine Apple-TV-App gebaut.

  Warum? Jede App, die ich ausprobiert habe, war entweder nervig kompliziert oder wollte noch einen weiteren Server auf dem Pi. Ich wollte etwas ganz Einfaches, das einfach seinen Job macht: Videos von einer lokalen SMB-Freigabe abspielen.

  Also habe ich SMB Olek geschrieben (gesprochen: Samba Olek - ich hoffe, ihr versteht den Witz 🔥).

  Version 1.0 ist gerade im App Store gelandet. Link im ersten Kommentar.

  Die lange Version: https://www.v01.io/de/posts/2026/09/smb-olek/
social: "https://lnkd.in/p/devA6cTu"
---

Unsere Reisevideos liegen auf einem Raspberry Pi. Eine Samba-Freigabe, ein travel-Ordner, eine Datei pro Reise: [Costa Rica]({{< relref "/posts/2021/08/costa-rica-ein-bericht/" >}}), [Japan]({{< relref "/posts/2023/11/japan-ein-bericht/" >}}), [Sulawesi]({{< relref "/posts/2024/09/sulawesi-ein-bericht/" >}}), [Polynesien]({{< relref "/posts/2025/09/polynesia/" >}}), [Raja Ampat]({{< relref "/posts/2022/08/raja-ampat-ein-bericht/" >}}).

Ich wollte sie auf der Couch sehen. Also habe ich eine Apple-TV-App gebaut.

## Warum?

Jede App, die ich ausprobiert habe, war entweder nervig kompliziert oder wollte noch einen weiteren Server.

Kompliziert, weil dieselbe App nebenbei fünf andere Use Cases bedient: eine Filmmediathek mit Covern aus dem Internet, Untertitel, einen Musikplayer, Cloud-Speicher, Playlists. Bis zu meinem einen Ordner waren es mehr Klicks als das Video lang ist.

Noch ein Server, weil Plex, Jellyfin und Co. einen Daemon auf dem Pi oder dem NAS wollen, der indexiert, transkodiert und sich selbst aktualisiert. Ich will keinen Medienserver betreiben. Ich habe einen Ordner.

Und die großen Dateien. Der Raja-Ampat-Schnitt hat 15 GB. Er lief entweder gar nicht an, oder er ruckelte alle paar Sekunden.

Also habe ich getan, was ich ein paar Wochen zuvor mit [Texttile]({{< relref "/posts/2026/08/texttile/" >}}) getan hatte. Ich habe das kleine Ding selbst gebaut. Es heißt SMB Olek. Sprich: Samba Olek. Ich hoffe, ihr versteht den Witz.

![SMB Olek: spielt Videos von deinen SMB-Freigaben](preview.png)

## Was es macht

Netzwerkgerät auswählen, Freigabe öffnen, Ordner öffnen, Video abspielen. Das ist die ganze App.

- Der Apple TV findet SMB-Server im lokalen Netzwerk per Bonjour. Wenn deiner sich nicht meldet, trägst du Host und Freigabe von Hand ein.
- Freigaben und Unterordner werden direkt durchsucht. Ordner ohne Videos verschwinden, sobald sie vollständig gescannt sind. Backups und AppleDouble-Kram bleiben verborgen.
- Jedes Video bekommt ein Vorschaubild, gerendert aus einem Frame der Datei selbst. Nichts wird aus dem Internet geladen.
- Die Wiedergabe streamt Bytebereiche direkt von der Freigabe. Kein Kopieren, kein Warten auf einen Download. Spulen springt zum Byte-Offset und läuft von dort weiter, auch jenseits von 4 GiB.
- Die Fernbedienung tut, was man erwartet: Play und Pause, zehn Sekunden links und rechts, Zurück schließt das Video. Die Steuerung blendet sich nach vier Sekunden aus.
- Kennwörter landen im Schlüsselbund. Die App schreibt nie auf die Freigabe.

![Der Netzwerk-Bildschirm: ein Raspberry Pi, gefunden per Bonjour](network.png)

![Die Freigabe: ein paar Ordner, travel darunter](share.png)

![Der travel-Ordner mit Vorschaubildern. Raja Ampat 2022 hat 14,82 GB](travel.png)

![Wiedergabe mit der kompakten Steuerung: Zeit, Titel, Fortschritt](player.jpg)

## Was es nicht ist

Keine Mediathek. Keine Cover aus dem Internet. Kein Metadaten-Scraping. Kein Server auf dem Pi. Kein Konto, keine Analytics, keine Werbung. Die Oberfläche ist schwarz und weiß und zeigt deine Ordnernamen, sonst nichts.

Ich habe es für eine Couch und einen Ordner gebaut (auch wenn es mehrere kann). Ein Produkt ist fertig, wenn man nichts mehr wegnehmen kann.

![Das Icon: ein brennender Fernseher](icon.png)

## Probier es aus

[SMB Olek ist im App Store](https://apps.apple.com/de/app/smb-olek/id6809174802). 12,99 Euro einmalig, kein Abo.

Du brauchst eine SMB-2- oder SMB-3-Freigabe mit eigenen Videos. Die App bringt keine Filme mit und braucht kein Konto. Für geschützte Freigaben nutzt du die Zugangsdaten deines Servers.

Wie kommen deine Videos vom NAS auf den Fernseher?
