#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
cp ../smarthome-3d/smarthome.js .
cp ../smarthome-3d/index.html .
git add -A
git commit -m "Update smarthome.js $(date '+%d.%m.%Y %H:%M')" || echo "nichts zu committen"
git push origin main
echo "Live in ~1 Minute: https://hatchetman111.github.io/SmartHome-ThreeJS/"
