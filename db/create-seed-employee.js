const fs = require('fs');
const path = require('path');
const randomName = require('./random-name/index.js');

const randInt = max => Math.floor(Math.random() * max);
const numberOfRoles = 14;

function createEmployees(amount, amountManagers=5) {
    const employees = [];
    const managers = Array(amountManagers).fill(0).map(id => id = randInt(amount));
    for (let id=1; id <= amount; id++) {
        let managerID = (managers.includes(id)) ? null : managers[randInt(managers.length)];
        if (managerID > id) managerID = null;

        const emp = {
            firstName: randomName.first(),
            lastName: randomName.last(),
            roleID: randInt(numberOfRoles) + 1,
            managerID: managerID
        }
        employees.push(emp);
    }

    return employees;
}

function generateSQL(employees) {
    let sql = 'INSERT INTO employee(first_name, last_name, role_id, manager_id) VALUES';
    for (emp of employees) {
        sql += '\n';
        sql += `\t("${emp.firstName}", "${emp.lastName}", ${emp.roleID}, ${emp.managerID ?? 'NULL'}),`
    }

    sql = sql.slice(0, -1);
    sql += ';'
    return sql;
}

async function seedEmployee(amount, amountManagers) {
    return fs.promises.writeFile(path.join(__dirname, 'seed-employee.sql'), generateSQL(createEmployees(amount, amountManagers)), (err) => {
        if (err) {
            console.error(err);
            return;
        }
    
        console.info('Write to seed-employee.sql successful!');
    });
}

module.exports = seedEmployee;