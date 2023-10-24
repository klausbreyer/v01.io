#!/bin/bash

# Zielverzeichnis für bearbeitete Bilder (ändern Sie dies nach Bedarf)
OUTPUT_DIR="./processed"

mkdir -p "$OUTPUT_DIR"

for img in *.jpg *.jpeg *.png; do
  # Nur wenn die Datei existiert
  if [[ -f "$img" ]]; then
    # Ermittle die Hintergrundfarbe des Bildes (von der oberen linken Ecke)
    bgcolor=$(convert "$img" -format '%[pixel:u.p{0,0}]' info:-)

    # Ändere die Größe des Bildes, ohne es zu beschneiden, und setze den Hintergrund auf die ermittelte Farbe
    convert "$img" -resize "1200x627" -gravity center -background "$bgcolor" -extent 1200x627 "$OUTPUT_DIR/$img"
    echo "Processed $img..."
  fi
done
