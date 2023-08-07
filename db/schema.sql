DROP DATABASE IF EXISTS charm_db;
CREATE DATABASE charm_db;

USE charm_db;

CREATE TABLE department(
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name VARCHAR(30) NOT NULL
);

CREATE TABLE role(
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    title VARCHAR(30) NOT NULL,
    salary DECIMAL NOT NULL,
    department_id INT,
    
    FOREIGN KEY(department_id)
    REFERENCES department(id)
    ON DELETE SET NULL
);

CREATE TABLE employee(
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    role_id INT,
    manager_id INT,

    FOREIGN KEY(role_id)
    REFERENCES role(id)
    ON DELETE SET NULL
);

ALTER TABLE employee
	ADD CONSTRAINT
	FOREIGN KEY (manager_id)
	REFERENCES employee(id);
	-- ON DELETE SET NULL;