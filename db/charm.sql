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
    last_name VARCHAR(3) NOT NULL,
    role_id INT,
    manager_id INT,

    FOREIGN KEY(role_id)
    REFERENCES role(id)
    ON DELETE SET NULL,

    FOREIGN KEY(manager_id)
    REFERENCES employee(id)
    ON DELETE SET NULL
);

INSERT INTO department(name) VALUES
    ("Conjuration"),
    ("Enchantment"),
    ("Spells"),
    ("Potions"),
    ("Magical Creatures");

INSERT INTO role(title, salary, department) VALUES
    ("Necromancer", 65, 1),
    ("Grand Summoner", 100, 1),
    ("Enchantress", 80, 2),
    ("Blacksmith", 55, 2),
    ("Scroll Scribe", 50, 2),
    ("Wizard", 75, 3),
    ("Spellcrafter", 99, 3),
    ("Wandsmith", 83, 3),
    ("Brewer", 65, 4),
    ("Chemist", 77, 4),
    ("Potion Tester", 34, 4),
    ("Familiar Trainer", 47, 5),
    ("Riding Coach", 42, 5),
    ("Vet", 89, 5);



