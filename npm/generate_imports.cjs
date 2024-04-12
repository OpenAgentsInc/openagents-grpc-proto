const fs = require('fs');
const path = require('path');

const distDir = path.join(__dirname, 'dist');
const indexFile = path.join(__dirname, 'index.js');

let ex = '';
fs.readdirSync(distDir).forEach(file => {
    if (path.extname(file) === '.js') {
        ex += `export * from './dist/${file}';\n`;
    }
});
console.log("Write index", indexFile);
fs.writeFileSync(indexFile, ex);