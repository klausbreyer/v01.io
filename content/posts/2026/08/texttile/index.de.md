---
title: "Texttile, eine Blog-Engine für Leute, die zusammen schreiben"
date: 2026-08-27
aliases:
  - /posts/2026-texttile/
categories: ["Engineering"]
image: preview.png
linkedin: |
  Jede:r Programmierer:in baut einmal im Leben ein CMS. Hier ist meins.

  Meine Frau und ich bloggen über jede Reise, seit unserer Hochzeitsreise vor 10 Jahren. Wir haben uns beim Schreiben abgewechselt, aber Fotos und Videos hatten beide auf dem Handy. Jeden Tag mussten sie hin und her geschickt und sortiert werden. Aber genau das hat WordPress nie hinbekommen. Nicht das mobile Schreiben, nicht die Videos, nicht die Galerie, und ganz sicher nicht das "Zusammen". Du bist auf eine:n Autor:in pro Eintrag begrenzt (dafür bekommst du einen Haufen Plugins, die niemand pflegt, und ständige Bot-Attacken auf dein wp-admin).

  Also habe ich Texttile geschrieben. Mehrere Leute gleichzeitig im selben Eintrag, mit Fotos und Videos (ordentlich komprimiert!) als gleichberechtigten Inhalten.

  Unter der Haube: Elixir, ein Docker-Container, SQLite drin, nichts wird von außen geladen. 100% Open Source.

  Die Demo auf der Homepage gibt dir einen echten Blog für 24 Stunden, und du kannst ihn behalten, wenn du magst. Link im ersten Kommentar.

  Demo und Quellcode: https://www.texttile.blog
  Die lange Version: https://www.v01.io/de/posts/2026/08/texttile/
---

Meine Frau und ich bloggen über jede Reise, seit unserer Hochzeitsreise vor 10 Jahren. Für die Daheimgebliebenen, für uns selbst später, und inzwischen für unsere Kinder. Wir haben uns beim Schreiben abgewechselt, aber Fotos und Videos hatten beide auf ihren Handys.

Der Text war nie der schwere Teil. Die Fotos und Videos waren es: Jeden Tag schickte eine:r von uns sie vom Handy an die andere Person, die sie hochladen und in der richtigen Reihenfolge in den Eintrag sortieren musste.

Für diesen Teil habe ich zuerst [imaedge](https://imaedge.org) gebaut, und wir haben es auf der nächsten Reise ausprobiert, dieses Jahr in [Mexiko]({{< relref "mexico" >}}). Der Upload hat gehalten. Tiles kommen in der Reihenfolge an, die die Kamera vorgibt, und wer eins verschiebt, ändert die Reihenfolge in der Galerie.

Was noch fehlte: das Ganze mit dem Text zusammenzubringen. Der Familienblog lief auf WordPress, aber WordPress hat das nie hinbekommen. Nicht das mobile Schreiben, nicht die Videos, nicht die Galerie, und ganz sicher nicht das "Zusammen". Du bist auf eine:n Autor:in pro Eintrag begrenzt (dafür bekommst du einen Haufen Plugins, die niemand pflegt, und ständige Bot-Attacken auf dein wp-admin).

Also habe ich nach Mexiko, mit bewährter Galerie, getan, was anscheinend jede:r Programmierer:in einmal tun muss. Ich habe mein eigenes CMS geschrieben. Es heißt Texttile, es ist Open Source, und es ist in Elixir geschrieben.

## Was es anders macht

In den meisten Blog-Engines kann nur ein:e Autor:in einen Eintrag bearbeiten. Texttile denkt Content-Management als Multiplayer.

- **Text:** Mehrere Leute können denselben Eintrag offen haben. Eine Person hat den Text und tippt, die andere sieht die Wörter ankommen und kann den Text mit einem Klick übernehmen.
- **Tile:** Ihr zieht beide gleichzeitig Tiles mit Fotos und Videos an ihren Platz, und ihr seht einander dabei zu. Die Galerie ist nie gesperrt.

Ein Eintrag besteht aus Text und Tiles - daher der Name.

![Dein Bildschirm: du schreibst, die andere Person liest mit](writing-you.png)

![Der Bildschirm der anderen Person mit demselben Eintrag](writing-other.png)

Beide Bildschirme zeigen denselben Eintrag im selben Moment. Wer schreibt, sieht eine violette Statusleiste und kann den Text bearbeiten. Die andere Person sieht eine orange Statusleiste und einen schreibgeschützten Editor. An der Galerie können beide weiterarbeiten.

Das Reisen hat den Rest geprägt:

- Texttile lädt nichts von außen. Kein CDN, kein Tracker, kein Captcha, keine gehosteten Fonts, kein Cookie-Banner. Der Browser deiner Leser:innen spricht mit deinem Server und sonst mit niemandem.
- Es bleibt leicht genug für eine langsame Leitung: kleine Seiten, wenig JavaScript, und Bilder nur so groß, wie der Bildschirm sie braucht.
- Videos kommen von deinem eigenen Server. Wirf eins rein und Texttile konvertiert es, Thumbnail inklusive. Kein YouTube-Embed, kein Player von woanders.
- Texttile speichert dein Markdown Byte für Byte. Ein Versions-Diff zeigt echte Änderungen und sonst nichts.
- Ein Container, ein Ordner. Phoenix, LiveView, ffmpeg und SQLite leben in einem Docker-Image. Alles liegt in `/data`. Verschiebe den Ordner und du verschiebst den Blog.
- Kommentare, ein Newsletter und Statistiken bleiben auf deinem Server. Texttile nutzt keine Cookies und speichert keine IP-Adressen.
- Englisch und Deutsch (weitere Übersetzungen sind als Contribution willkommen!)

## Was es nicht ist

Es gibt keine Rollen, keine Rechtematrix, keine Plugins, keinen Theme-Marktplatz. Wer einen Account hat, ist Admin. Ich habe es für Leute gebaut, die einander vertrauen, denn genau die schreiben zusammen einen Blog. Meine Philosophie ist, dass ein Produkt erst perfekt ist, wenn man nichts mehr wegnehmen kann.

## Warum Elixir

Mehrere Leute, die gleichzeitig denselben Eintrag bearbeiten: genau dafür wurde die BEAM gemacht. Der Lock ist ein GenServer, die Tastenanschläge reisen über PubSub, und das Ganze läuft auf einer kleinen Maschine neben einer SQLite-Datei. Kein Redis, keine Queue, kein zweiter Dienst.

## Probier es aus

Auf deiner eigenen Maschine:

```sh
docker run -d --name texttile \
  -p 4000:4000 \
  -v texttile-data:/data \
  -e SECRET_KEY_BASE="$(openssl rand -base64 48)" \
  -e PHX_HOST=localhost \
  -e ADMIN_USERS=you@example.com \
  ghcr.io/texttile-blog/texttile:3
```

Oder starte eine Demo auf [www.texttile.blog](https://www.texttile.blog). Du bekommst deinen eigenen Blog für 24 Stunden. Wenn er dir gefällt, kannst du ihn behalten. Wenn nicht, geht er schlafen und wird 30 Tage später gelöscht, mit allem, was drin ist.

Beiträge unseres eigenen Reiseblogs aus Mexiko habe ich unter [demo.texttile.blog](https://demo.texttile.blog) online gebracht, wenn du ihn von der Leseseite sehen willst.

Der Code liegt auf [github.com/texttile-blog/texttile](https://github.com/texttile-blog/texttile). Jetzt bin ich an deinem Feedback interessiert! Wie bloggst du von unterwegs?

Und hier ist es in Aktion:

<video autoplay muted playsinline preload="metadata" poster="writing-poster.jpg" width="1080" height="1080" style="max-width:100%;height:auto">
  <source src="writing.mp4" type="video/mp4">
  <img src="writing-poster.jpg" alt="Zwei Bildschirme, ein Eintrag: eine Person schreibt, die andere liest mit und kann übernehmen">
</video>
