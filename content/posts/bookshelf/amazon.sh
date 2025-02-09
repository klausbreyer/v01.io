#!/usr/bin/env bash

for d in */; do
  # Prüfen, ob in diesem Ordner index.md existiert
  if [ -f "$d/index.md" ]; then

    # Prüfen, ob KEINE JPG-Datei vorhanden ist
    # (find gibt nur dann leere Ausgabe zurück, wenn nichts gefunden wird)
    if [ -z "$(find "$d" -maxdepth 1 -type f -iname "*.jpg" 2>/dev/null)" ]; then

      # Titelzeile holen
      raw_title=$(grep -m1 '^title:' "$d/index.md" || true)
      [ -z "$raw_title" ] && continue

      # title: "Brave New World, Aldous Huxley, 1932" -> Brave New World, Aldous Huxley, 1932
      clean_title=$(echo "$raw_title" \
        | sed -E 's/^title:\s*"?//; s/"$//')

      # URL-Encoden per Python
      encoded_title=$(
        python3 -c "import urllib.parse, sys; print(urllib.parse.quote(sys.argv[1]))" \
        "$clean_title"
      )

      amazon_link="https://www.amazon.de/s?k=${encoded_title}&__mk_de_DE=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=2IS6JM1I5F9OH&sprefix=${encoded_title}%2Caps%2C72&ref=nb_sb_noss"

      echo "----------------------------------"
      echo "Ordner:   $d"
      echo "Titel:    $clean_title"
      echo "Amazon-Link (nur wenn kein JPG im Ordner existiert):"
      echo "$amazon_link"
      echo ""

    else
      echo "Ordner \"$d\" enthält eine JPG-Datei. Überspringe Amazon-Link."
    fi
  fi
done

echo "Fertig."
