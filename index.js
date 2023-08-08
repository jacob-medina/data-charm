require('dotenv').config();

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
                `SELECT emp.id, emp.first_name AS "first name", emp.last_name AS "last name", role.title, department.name AS department, role.salary, CONCAT(manager.first_name, ' ', manager.last_name) AS "manager"
                FROM employee emp
                LEFT JOIN employee manager ON emp.manager_id = manager.id
                LEFT JOIN role ON emp.role_id = role.id
                LEFT JOIN department ON role.department_id = department.id
                ORDER BY emp.id;`
            );

            break;
        
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

            break;

        case 'add a role':
            db.execute('SELECT * FROM department', (err, results) => {
                if (err) return;
                
                let choices = [];
                choices = results.map(result => {
                    return {
                        name: result.name,
                        value: result.id
                    };
                });

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
        
        case 'add an employee':
            db.execute('SELECT id, title FROM role', (err, results) => {
                if (err) return;
                
                let roleChoices = [];
                roleChoices = results.map(role => {
                    return {
                        name: role.title,
                        value: role.id
                    };
                });

                db.execute('SELECT id, first_name, last_name FROM employee', (err, results) => {
                    if (err) return;
                    
                    // add all employees
                    let managerChoices = [];
                    managerChoices = results.map(emp => {
                        return {
                            name: `${emp.first_name} ${emp.last_name}`,
                            value: emp.id
                        };
                    });

                    // add 'no manager' choice to beginning
                    managerChoices.unshift({
                        name: 'None',
                        value: null
                    });

                    inquirer.prompt([
                        {
                            name: 'emp fname',
                            type: 'input',
                            message: "What is the employee's first name?"
                        },
                        {
                            name: 'emp lname',
                            type: 'input',
                            message: "What is the employee's last name?"
                        },
                        {
                            name: 'emp role',
                            type: 'list',
                            choices: roleChoices,
                            message: "What is the employee's role?"
                        },
                        {
                            name: 'emp manager',
                            type: 'list',
                            choices: managerChoices,
                            message: "Who is the employee's manager?"
                        }
                        
                    ])
                    .then(answer => {
                        query(
                            `INSERT INTO employee(first_name, last_name, role_id, manager_id) VALUES (?,?,?,?);`,
                            answer['emp fname'], answer['emp lname'], answer['emp role'], answer['emp manager']
                        );
                    });
                });
            });

            break;

        case 'update an employee role':
            db.execute('SELECT id, first_name, last_name FROM employee', (err, results) => {
                if (err) return;
                
                let empChoices = [];
                empChoices = results.map(emp => {
                    return {
                        name: `${emp.first_name} ${emp.last_name}`,
                        value: emp.id
                    };
                });

                db.execute('SELECT id, title FROM role', (err, results) => {
                    if (err) return;
                    
                    let roleChoices = [];
                    roleChoices = results.map(role => {
                        return {
                            name: role.title,
                            value: role.id
                        };
                    });

                    inquirer.prompt([
                        {
                            name: 'emp id',
                            type: 'list',
                            choices: empChoices,
                            message: "Which employee's role do you want to update?"
                        },
                        {
                            name: 'emp role_id',
                            type: 'list',
                            choices: roleChoices,
                            message: 'Which role do you want to assign to the selected employee?'
                        }
                    ])
                    .then(answer => {
                        query(
                            `UPDATE employee
                            SET role_id = ?
                            WHERE id = ?;`, answer['emp role_id'], answer['emp id']);
                    });

                })
            });

            break;
        
        default:
            break;
    }
});
    
// db.end();