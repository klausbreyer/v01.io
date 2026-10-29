---
title: "tldr.tf, eine Zusammenfassung für jeden Link"
date: 2026-10-29
categories: ["Open Source", "Shipped"]
image: preview.png
linkedin: |
  Mich nerven ja Videos mit Clickbait-Titeln. Und oft habe ich in meinem YouTube-Feed mehr interessante Videos, als ich Zeit habe. Um da auszusieben, habe ich in der Vergangenheit immer Gemini via API angefragt (kann YouTube-Videos anschauen), damit es mir die Videos zusammenfasst. Das war aber immer etwas umständlich, weil das über die Gemini-App nicht geht.

  Also habe ich mir einen kleinen Service gebaut, den ihr gerne auch nutzen könnt. Er heißt tldr.tf, ist aber auch Open Source, wer es selbst hosten mag.

  Einfach Link rein. Zusammenfassung raus. Tokens gehen auf mich!
  Ich tracke da nichts, also müsst ihr mir selbst sagen, wofür ihr es verwendet und wie ihr es findet. Bin gespannt auf euer Feedback :)

  Ausprobieren: https://tldr.tf
  Die lange Version: https://www.v01.io/de/posts/2026/10/tldr/
---

Mich nerven Videos mit Clickbait-Titeln. Und oft habe ich in meinem YouTube-Feed mehr interessante Videos, als ich Zeit habe.

Eine Weile habe ich von Hand aussortiert. Ich habe die Videoadresse an die Gemini-API geschickt und um eine Zusammenfassung gebeten. Gemini kann ein YouTube-Video anhand seiner Adresse anschauen, Bild und Ton. Das wissen die wenigsten, weil die Gemini-App das nicht kann. Nur die API.

Das hat funktioniert, war aber jedes Mal umständlich: Terminal öffnen, die Anfrage raussuchen, Adresse einfügen, JSON lesen.

Also habe ich einen kleinen Service drumherum gebaut. Er heißt [tldr.tf](https://tldr.tf) und ist Open Source. Link rein, Zusammenfassung raus.

![tldr.tf mit einer Zusammenfassung von Theos Video "How To Give Claude Unlimited Usage"](preview.png)

## Was es macht

- Eine Webseite oder ein YouTube-Video, ein Feld nimmt beides.
- Die Zusammenfassung ist ein Satz und drei bis sechs Punkte. Der Satz sagt, was die Quelle behauptet, nicht, worum es geht. Die Punkte behalten die Namen, Zahlen und Beispiele.
- Bei einem Video schaut Gemini das Video selbst. Es gibt kein Transkript dazwischen. Wenn ein Vortrag eine Folie zeigt oder ein Test ein Produkt, steht das in der Zusammenfassung.
- Wenn jemand eine Meinung vertritt, nennt die Zusammenfassung die Person: "Laut Theo ...".
- Wenn es nichts zusammenzufassen gibt, wegen einer Paywall oder eines Logins, sagt die Zusammenfassung das, statt sich etwas auszudenken.
- Deutsch oder Englisch, egal in welcher Sprache die Quelle ist.
- Mehrere Links auf einmal. Die Links wandern in die Adresszeile, du kannst die Seite mit ihren Zusammenfassungen also als einen Link teilen.

Eine Webseite dauert ein paar Sekunden. Ein langes Video dauert bis zu einer Minute.

## Was es nicht ist

Es gibt keinen Account, keinen Verlauf und keine Datenbank. Ich speichere weder die Links noch die Zusammenfassungen, und ich tracke nicht, wer es benutzt. Wenn ich wissen soll, wofür du es verwendest, musst du es mir sagen.

PDFs und andere Dateien gehen noch nicht. Private und altersbeschränkte Videos gehen auch nicht, weil Google sie dem Modell nicht zeigt. Es gibt keine Browser-Erweiterung und keine App.

Ein Produkt ist fertig, wenn man nichts mehr wegnehmen kann.

## Warum Elixir und Gemini

Gemini ist das einzige Modell, das ich kenne, das ein YouTube-Video anhand seiner Adresse anschaut. tldr.tf schickt die Adresse über OpenRouter an Gemini 3.8 Flash und bekommt einen Satz und eine Liste zurück, als JSON mit festem Schema. Eine Webseite wird vorher geholt und als Text geschickt.

Die App ist Phoenix mit LiveView. Jeder Link läuft in seinem eigenen Prozess, drei Links auf einmal sind also drei Prozesse. Das Ganze läuft in einem Container bei Bunny in Frankfurt. Jeder Push auf `main` deployt es.

## Probier es aus

Geh auf [tldr.tf](https://tldr.tf) und füge das nächste Video ein, bei dem du nicht sicher bist, ob es sich lohnt. Tokens gehen auf mich.

Der Code liegt auf [github.com/klausbreyer/tldr](https://github.com/klausbreyer/tldr). Zum Selbst-Hosten: Repository klonen, deinen eigenen OpenRouter-Key in die `.env` schreiben und `make start` ausführen. Den Rest erklärt die README.
