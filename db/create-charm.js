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

async function combineFiles(...filenames) {
    const allFiles = []
    for (filename of filenames) {
        const file = await readFile(filename);
        allFiles.push(file);
    }

    return allFiles;
}

combineFiles(
    'schema.sql',
    'seed-department.sql',
    'seed-role.sql',
    'seed-employee.sql'
)
.then((allFiles) => {    
    const data = allFiles.reduce((data, file) => data + file + '\n\n', '');
    fs.writeFile(path.join(__dirname, 'charm.sql'), data, (err) => {
        if (err) {
            console.error(err);
            return;
        }

        console.info('charm.sql successfully created!');
    });
});