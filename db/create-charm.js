// combines separate SQL files into one charm.sql file for user to source
require('dotenv').config();
const fs = require('fs');
const path = require('path');
const mysql = require('mysql2');
const seedEmployee = require('./create-seed-employee.js');

const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    multipleStatements: true
});

const readFile = (filename) => {
    return fs.promises.readFile(path.join(__dirname, filename), 'utf-8', (err, data) => {
        if (err) {
            console.error(err);
            return '';
        }

        return data;
    });
}

async function combineFiles(...filenames) {
    const allFiles = []
    for (filename of filenames) {
        const file = await readFile(filename);
        allFiles.push(file);
    }

    return allFiles;
}


async function start() {
    const amountEmployees = process.argv[2];
    if (amountEmployees) await seedEmployee(amountEmployees);
    
    combineFiles(
        'schema.sql',
        'seed-department.sql',
        'seed-role.sql',
        'seed-employee.sql'
    )
    .then((allFiles) => {    
        const dbInit = `DROP DATABASE IF EXISTS ${process.env.DB_NAME};\nCREATE DATABASE ${process.env.DB_NAME};\nUSE ${process.env.DB_NAME};\n`;
        const data = dbInit + '\n' + allFiles.reduce((data, file) => data + file + '\n\n', '');
        
        db.connect(err => {
            if (err) throw err;

            db.query(dbInit, (err, results) => {
                if (err) throw err;
                console.info(`${process.env.DB_NAME} initialized.`);
            });
        });

        db.query(data, (err, results) => {
            if (err) throw err;
            console.info(`${process.env.DB_NAME} seeded.`);
        });

        db.end();

        fs.writeFile(path.join(__dirname, 'charm.sql'), data, (err) => {
            if (err) throw err;
            console.info(`db/charm.sql created.`);
        });
    });
}

start();