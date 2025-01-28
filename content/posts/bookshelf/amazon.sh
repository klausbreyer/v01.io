#!/usr/bin/env bash

for d in */; do
  # Prüfen, ob in diesem Ordner eine index.md liegt
  if [ -f "$d/index.md" ]; then
    # Titelzeile holen (erste Zeile mit title:)
    raw_title=$(grep -m1 '^title:' "$d/index.md" || true)
    # Falls nichts gefunden, weiter zum nächsten Ordner
    [ -z "$raw_title" ] && continue

    # title: "Brave New World, Aldous Huxley, 1932"
    # -> "Brave New World, Aldous Huxley, 1932" ohne vorangestelltes title: und ohne Anführungszeichen
    clean_title=$(echo "$raw_title" \
      | sed -E 's/^title:\s*"?//; s/"$//')

    # Jetzt via Python URL-encoden
    # - Leerzeichen -> %20
    # - Komma -> %2C
    # - etc.
    encoded_title=$(
      python3 -c "import urllib.parse, sys; print(urllib.parse.quote(sys.argv[1]))" \
      "$clean_title"
    )

    # Amazon-Link zusammenbauen
    amazon_link="https://www.amazon.de/s?k=${encoded_title}&__mk_de_DE=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=2IS6JM1I5F9OH&sprefix=${encoded_title}%2Caps%2C72&ref=nb_sb_noss"

    echo "----------------------------------"
    echo "Ordner:   $d"
    echo "Titel:    $clean_title"
    echo "Amazon-Link:"
    echo "$amazon_link"
    echo ""
  fi
done

echo "Fertig."
