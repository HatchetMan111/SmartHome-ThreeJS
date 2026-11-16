#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
# Rebuild direkt mitbauen, damit Bundle und Publish-Ordner nie auseinanderlaufen
export PATH="$HOME/.local/node/bin:$PATH"
(cd ../smarthome-3d && npm run build) || { echo "Build fehlgeschlagen – Abbruch." >&2; exit 1; }
cp ../smarthome-3d/smarthome.js .
cp ../smarthome-3d/index.html .
# Versions-Cache-Buster in index.html hochzählen, sonst sehen Besucher das alte Bundle
V=$(grep -o 'smarthome.js?v=[0-9]*' index.html | head -1 | tr -dc 0-9)
V=$(( ${V:-0} + 1 ))
sed -i "s/smarthome.js?v=[0-9]*/smarthome.js?v=$V/" index.html
echo "→ smarthome.js?v=$V"
git add -A
git commit -m "Update smarthome.js (v$V, $(date '+%d.%m.%Y %H:%M'))" || echo "nichts zu committen"
git push origin main
echo "Live in ~1 Minute: https://hatchetman111.github.io/SmartHome-ThreeJS/?v=$V"
