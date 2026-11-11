# Smart Home · 3D-Szene (three.js)

Interaktive three.js-Szene: modernes Smart Home zur blauen Stunde — 20 Geräte
(Rasenroboter, Drohne, PV, Beschattung, E-Auto, Server …) über die Seitenleiste
schaltbar. Komplett aus Code, ein einziges Bundle, kein CDN.

**Live-Demo:** https://hatchetman111.github.io/SmartHome-ThreeJS/

## In Softr (oder jede Website) einbetten

1) Custom-Code-**Block** (dorthin, wo die Szene erscheinen soll):

```html
<div id="sm-scene" style="position:relative;width:100%;height:80vh;min-height:420px;border-radius:18px;overflow:hidden;background:#0d0f12">
  <div style="padding-top:38vh">3D-Szene wird geladen …</div>
</div>
```

2) **Einstellungen → Custom Code → Footer** (wichtig, nicht in den Block):

```html
<script>
(function () {
  var s = document.createElement('script');
  s.src = 'https://hatchetman111.github.io/SmartHome-ThreeJS/smarthome.js?embed=1&v=' + new Date().toISOString().slice(0, 10);
  s.defer = true;
  document.body.appendChild(s);
})();
</script>
```

Alternativ als iFrame (Plan B):
`<iframe src="https://hatchetman111.github.io/SmartHome-ThreeJS/index.html?embed=1" style="width:100%;height:80vh;border:0;border-radius:18px" title="Smart Home 3D" allowfullscreen></iframe>`

Details, Parameter und Fehlersuche: `softr-snippet.txt`.

## Parameter

An die Script- bzw. iframe-URL anhängen, kombinierbar:
`?embed=1&view=front|corner|low|aerial&light=morning|golden|dusk|night&quality=fast|balanced|high`

## Update-Workflow

Quellcode + Build liegen lokal in `smarthome-3d` (esbuild). Nach Änderungen:
`npm run build` → `./deploy.sh` (kopiert `smarthome.js` + `index.html` hierher und pushed).
