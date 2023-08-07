// combines separate SQL files into one charm.sql file for user to source

const fs = require('fs');
const path = require('path');

const readFile = (filename) => {
    return fs.promises.readFile(path.join(__dirname, filename), 'utf-8', (err, data) => {
        if (err) {
            console.error(err);
            return '';
        }

        return data;
    });
}

async function readAllFiles() {
    const schema = await readFile('schema.sql');
    const seedDep = await readFile('seed-department.sql');
    const seedRole = await readFile('seed-role.sql');
    const seedEmployee = await readFile('seed-employee.sql');
    const allFiles = [schema, seedDep, seedRole, seedEmployee];
    return allFiles;
}

readAllFiles()
.then((allFiles) => {
    console.log('files', allFiles);
    
    const data = allFiles.reduce((data, file) => data + file + '\n\n', '');
    console.log('data', data);
    fs.writeFile(path.join(__dirname, 'charm.sql'), data, (err) => {
        if (err) console.error(err);
    });
});