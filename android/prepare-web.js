// Copies the PWA files (not the Windows companion) into ./www for Capacitor.
const fs = require('fs'), path = require('path');
const src = path.join(__dirname, '..', 'web'), dst = path.join(__dirname, 'www');
fs.rmSync(dst, { recursive: true, force: true });
fs.mkdirSync(dst, { recursive: true });
for (const f of ['index.html', 'style.css', 'script.js', 'manifest.json', 'sw.js']) fs.copyFileSync(path.join(src, f), path.join(dst, f));
fs.cpSync(path.join(src, 'assets'), path.join(dst, 'assets'), { recursive: true });
console.log('web files copied to', dst);
