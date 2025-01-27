#!/usr/bin/env bash

for d in */; do
  echo "--------------------"
  echo "Verarbeite Ordner: $d"

  # Prüfen, ob index.md existiert
  if [ -f "$d/index.md" ]; then
    echo "  -> index.md gefunden. Extrahiere Titel-Zeile..."

    # Title-Zeile einlesen (erste Zeile mit 'title:')
    line=$(grep -m1 '^title:' "$d/index.md")
    echo "  -> Gefundene Zeile: $line"

    # Jahreszahl extrahieren (Regex an die Anführungszeichen und ähnliches angepasst)
    y=$(echo "$line" | sed -nE 's/.*,\s*([0-9]{4})([^0-9]|$).*/\1/p')
    echo "  -> Extrahierte Jahreszahl: $y"

    if [ -n "$y" ]; then
      # Neuer Ordnername
      newname="${y}-${d%/}"
      echo "  -> Neuer Name wird: $newname"

      # Umbenennen
      echo "  -> Führe Umbenennung durch: mv \"$d\" \"$newname\""
      mv "$d" "$newname"
    else
      echo "  -> Keine Jahreszahl gefunden, überspringe Umbenennung."
    fi
  else
    echo "  -> Keine index.md in diesem Ordner, überspringe."
  fi
done

echo "--------------------"
echo "Fertig."
