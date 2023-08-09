const fs = require('fs');
const path = require('path');

const data = 
`DB_NAME=charm_db
DB_HOST=localhost
DB_USER=root
DB_PASSWORD="your password here"`;

fs.writeFileSync('.env', data, (err) => {
    if (err) throw err;

    console.info('.env template built')
})