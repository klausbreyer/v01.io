#!/usr/bin/env bash

for d in */; do
  # Prüfen, ob index.md existiert
  if [ -f "$d/index.md" ]; then
    echo "------------------------------------"
    echo "Verarbeite: $d"

    # 1) Titel-Zeile finden
    title_line=$(grep -m1 '^title:' "$d/index.md")
    echo "  -> Gefundene Titel-Zeile: $title_line"

    # 2) Jahreszahl extrahieren (letzte oder einzige 4-stellige Zahl)
    year=$(echo "$title_line" | grep -Eo '[0-9]{4}' | tail -n1)
    echo "  -> Extrahierte Jahreszahl: $year"

    # 3) Falls eine Jahreszahl gefunden wird, schreibe sie in die date:-Zeile
    if [ -n "$year" ]; then
      echo "  -> Aktualisiere date: auf '${year}-01-01'..."

      # macOS-spezifische sed-Variante (-i "" ohne Backup-Datei)
      sed -i "" -E "s/^date:.*/date: ${year}-01-01/" "$d/index.md"

      echo "  -> Fertig aktualisiert: $d/index.md"
    else
      echo "  -> Keine Jahreszahl gefunden, Überspringe."
    fi
  fi
done

echo "------------------------------------"
echo "Alle fertig."
