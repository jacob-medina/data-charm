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

INSERT INTO department(name) VALUES
    ("Conjuration"),
    ("Enchantment"),
    ("Spells"),
    ("Potions"),
    ("Magical Creatures");

INSERT INTO role(title, salary, department_id) VALUES
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

INSERT INTO employee(first_name, last_name, role_id, manager_id) VALUES
	("Elyssa", "Tonina", 6, NULL),
	("Ludovika", "Nickie", 2, NULL),
	("Bel", "Lucie", 13, NULL),
	("Marylin", "Zadoc", 4, NULL),
	("Mead", "Iinde", 7, NULL),
	("Michaelina", "Tolmach", 14, NULL),
	("Dredi", "Iredale", 2, NULL),
	("Christine", "Marder", 13, NULL),
	("Maggie", "Magnolia", 4, NULL),
	("Austina", "Waine", 8, NULL),
	("Rivkah", "Ehrsam", 6, NULL),
	("Gabrielle", "Africah", 5, 8),
	("Kandy", "Hock", 11, NULL),
	("Katusha", "Miltie", 8, NULL),
	("Riannon", "Hollenbeck", 14, NULL),
	("Fernanda", "Rillis", 3, NULL),
	("Teriann", "Willa", 8, NULL),
	("Bernardina", "Lorelle", 8, NULL),
	("Carlen", "Seymour", 8, 8),
	("Veronique", "Dougald", 3, NULL),
	("Meghan", "Silma", 10, NULL),
	("Harriet", "Kellsie", 13, NULL),
	("Roxana", "Marsh", 5, NULL),
	("Alaine", "Kuhlman", 9, NULL),
	("Elysia", "Concettina", 7, NULL),
	("Marin", "Binnie", 10, NULL),
	("Mildred", "Sheilah", 7, NULL),
	("Jennie", "Houston", 7, 8),
	("Rochelle", "Lawry", 10, 27),
	("Maris", "Whitcher", 8, NULL),
	("Shannen", "Selia", 10, NULL),
	("Verina", "Corder", 3, NULL),
	("Mercy", "Av", 12, NULL),
	("Rosalia", "Giacobo", 4, 33),
	("Charmain", "Zitvaa", 1, 27),
	("Jami", "Portwine", 5, NULL),
	("Shirleen", "Leoline", 7, 8),
	("Honey", "Beryle", 7, 33),
	("Jacynth", "Mellar", 12, NULL),
	("Marlene", "Winona", 1, 8),
	("Raquel", "Malca", 7, NULL),
	("Amil", "Burrell", 3, 33),
	("Ashien", "Sabella", 7, NULL),
	("Yvonne", "Sunday", 9, 8),
	("Adriaens", "Goode", 9, NULL),
	("Karlotta", "Koby", 9, 33),
	("Cathy", "Lissie", 13, NULL),
	("Christiane", "Rosenquist", 3, 27),
	("Lari", "Ringler", 12, NULL),
	("Claudelle", "Robers", 10, NULL),
	("Annice", "Russ", 13, 27),
	("Lexie", "Catherin", 4, 27),
	("Melantha", "Solenne", 3, NULL),
	("Corabella", "Schonfield", 11, NULL),
	("Tana", "Kelby", 12, 27),
	("Othilia", "Germin", 10, 27),
	("Kissee", "Frere", 2, 27),
	("Rubie", "Morette", 7, 54),
	("Dalila", "Edwards", 14, 33),
	("Nicol", "Ras", 8, 27),
	("Cloe", "Philan", 2, 27),
	("Cammy", "Landa", 10, 53),
	("Cherye", "Sitnik", 2, 8),
	("Catharina", "Madalena", 4, 54),
	("Charmion", "Rieth", 6, 33),
	("Antonetta", "Tiphany", 1, 53),
	("Shir", "Ottavia", 14, 8),
	("Dee Dee", "Morette", 13, 27),
	("Arleen", "Corkhill", 10, 27),
	("Gretta", "Filide", 11, 33),
	("Elisabeth", "Powell", 4, 27),
	("Max", "Certie", 5, 53),
	("Hulda", "Publus", 13, 54),
	("Nerta", "Bevis", 1, 27),
	("Bettine", "Galer", 2, 27);

