const mysql = require('mysql2');

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '8MUU8Byp6b',
    database: 'charm_db'
});

db.query(
    'SOURCE db/schema.sql', (err, results) => {
        if (err) {
            console.error(err);
            return;
        }

        console.table(results);
    }
);

db.end();