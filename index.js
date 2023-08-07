const mysql = require('mysql2');
const inquirer = require('inquirer');

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '8MUU8Byp6b',
    database: 'charm_db'
});


function query(...args) {
    const query = args[0];
    const placeholders = args.slice(1);
    console.log(placeholders);
    db.execute(query, placeholders,
        (err, results) => {
            if (err) {
                console.error(err);
                return;
            }

            if (query.toUpperCase().includes('SELECT')) {
                console.table(results);
            }
        });
}

inquirer.prompt([
    {
        name: "main_choice",
        type: "list",
        message: "What would you like to do?",
        choices: [
            'view all departments',
            'view all roles',
            'view all employees',
            'add a department',
            'add a role',
            'add an employee',
            'update an employee role'
        ]
    }
])
.then((answer) => {
    switch(answer.main_choice) {
        case 'view all departments':
            query("SELECT * FROM department");
            break;

        case 'view all roles':
            query(
                `SELECT title, role.id, department.name AS department, salary
                FROM role
                JOIN department ON role.department_id = department.id
                ORDER BY role.id;
                `);
            break;
        
        case 'view all employees':
            query(
                `SELECT employee.id, first_name AS "first name", last_name AS "last name", role.title, department.name AS department, salary, manager_id AS manager
                FROM employee
                JOIN role ON employee.role_id = role.id
                JOIN department ON role.department_id = department.id
                ORDER BY employee.id;`
            );
        
        case 'add a department':
            inquirer.prompt([
                {
                    name: 'department name',
                    type: 'input',
                    message: 'What is the name of the department?'
                }
            ])
            .then(answer => {
                query(
                    `INSERT INTO department(name) VALUES (?);`, answer['department name']
                );
            });

        case 'add a role':
            let choices = [];
            db.execute('SELECT * FROM department', (err, results) => {
                if (err) return;

                choices = results.map(result => {
                    return {
                        name: result.name,
                        value: result.id
                    };
                });
                console.log(choices);

                inquirer.prompt([
                    {
                        name: 'role name',
                        type: 'input',
                        message: 'What is the name of the role?'
                    },
                    {
                        name: 'role salary',
                        type: 'input',
                        validate: (input) => !isNaN(parseFloat(input)),
                        message: 'What is the salary of the role?'
                    },
                    {
                        name: 'role department',
                        type: 'list',
                        choices: choices,
                        message: 'What is the department of the role?'
                    }
                    
                ])
                .then(answer => {
                    query(
                        `INSERT INTO role(title, salary, department_id) VALUES (?,?,?);`,
                        answer['role name'], answer['role salary'], answer['role department']
                    );
                });
            });
            


            break;
        
        default:
            break;
    }
});
    
// db.end();