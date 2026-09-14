'use strict';

// Copies server.js into dist/ so the multi-stage Dockerfile runtime stage
// stays minimal (node:dist/server.js → node dist/server.js).

const fs = require('fs');
const path = require('path');

const SOURCE = path.join(__dirname, '..', 'server.js');
const DEST_DIR = path.join(__dirname, '..', 'dist');

fs.mkdirSync(DEST_DIR, { recursive: true });
const dest = path.join(DEST_DIR, 'server.js');
fs.copyFileSync(SOURCE, dest);

console.log(`built ${path.relative(process.cwd(), dest)}`);