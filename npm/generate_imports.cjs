const fs = require('fs');
const path = require('path');

const distDir = path.join(__dirname, '.');
const indexFile = path.join(__dirname, 'index.ts');

let ex = '';
fs.readdirSync(distDir).forEach(file => {
    if (path.extname(file) === '.ts') {
        const base = file.slice(0, -3);
        ex += `export * from './${base}';\n`;
    }
});
console.log("Write index", indexFile);
fs.writeFileSync(indexFile, ex);