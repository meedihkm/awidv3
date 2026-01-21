const fs = require('fs');
const path = require('path');
const swaggerSpecs = require('../config/swagger');

const outputPath = path.join(__dirname, '../../docs/openapi.json');

// Ensure docs directory exists
const docsDir = path.dirname(outputPath);
if (!fs.existsSync(docsDir)) {
    fs.mkdirSync(docsDir, { recursive: true });
}

fs.writeFileSync(outputPath, JSON.stringify(swaggerSpecs, null, 2));
console.log(`OpenAPI specification saved to ${outputPath}`);
console.log('You can import this file directly into Postman (Import -> File).');
