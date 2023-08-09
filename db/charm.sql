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
	("Maridel", "Koblas", 6, NULL),
	("Elora", "Vanya", 12, NULL),
	("Rosalyn", "Kopans", 1, NULL),
	("Erinna", "Malvie", 3, NULL),
	("Krissy", "Deaner", 5, NULL),
	("Annice", "Bucella", 11, NULL),
	("Drona", "Olen", 4, NULL),
	("Sheela", "Ermanno", 8, 6),
	("Cortney", "Secundas", 10, 6),
	("Dulcine", "Jayme", 13, NULL),
	("Nadiya", "Krysta", 9, NULL),
	("Valentina", "Ingmar", 13, NULL),
	("Staci", "Frederique", 2, NULL),
	("Jan", "Tony", 11, NULL),
	("Rowena", "Blessington", 1, 6),
	("Bill", "Agamemnon", 6, NULL),
	("Natka", "Wylma", 6, NULL),
	("Agata", "Halie", 6, 6),
	("Ann-Marie", "Cioban", 2, NULL),
	("Elene", "Kylie", 6, 6),
	("Shandeigh", "Bishop", 1, NULL),
	("Dorotea", "Petie", 7, NULL),
	("Augustine", "Marleah", 11, NULL),
	("Melony", "Vladamar", 3, NULL),
	("Shellie", "Bernt", 13, NULL),
	("Josee", "Osbourne", 6, NULL),
	("Amberly", "Drolet", 8, NULL),
	("Chrissy", "Baker", 12, NULL),
	("Modesta", "Erikson", 8, NULL),
	("Nolie", "Chandos", 3, 6),
	("Melessa", "Kore", 4, 29),
	("Sarah", "Briggs", 8, 6),
	("Guenna", "Lempres", 4, NULL),
	("Hildegaard", "Esmerolda", 13, NULL),
	("Malia", "Sparks", 8, NULL),
	("Jemmie", "Langer", 1, 6),
	("Molly", "Rolanda", 2, 34),
	("Tisha", "Geilich", 9, NULL),
	("Katy", "Bucky", 3, 34),
	("Alberta", "Parik", 1, NULL),
	("Mavis", "Castle", 3, 34),
	("Stevena", "Persian", 4, NULL),
	("Catharina", "Perrin", 12, NULL),
	("Faye", "Tertia", 11, 34),
	("Binni", "Jessalyn", 9, 6),
	("Rose", "Witkin", 5, 34),
	("Alane", "Zilvia", 6, 6),
	("Nikolia", "Alonzo", 7, NULL),
	("Mavra", "Saltzman", 8, 48),
	("Tracey", "Gathers", 5, 6),
	("Aryn", "Lancaster", 5, 29),
	("Martynne", "Allison", 8, 29),
	("Mame", "McClure", 3, 48),
	("Veradis", "Durst", 14, 48),
	("Mariellen", "Duong", 12, 48),
	("Malva", "Placido", 1, 6),
	("Corrie", "Brina", 9, 48),
	("Natalee", "Robins", 7, 6),
	("Darby", "Pentha", 12, NULL),
	("Adrian", "Winnie", 14, 34),
	("Briny", "Paxton", 2, NULL),
	("Hally", "Moriarty", 12, 61),
	("Terra", "Eldora", 13, 29),
	("Malanie", "Yeta", 5, 48),
	("Becka", "Kwasi", 14, 61),
	("Ammamaria", "Madid", 13, 6),
	("Daffy", "Hilten", 11, 61),
	("Gaynor", "Lucita", 10, 48),
	("Sara", "Lasala", 1, 61),
	("Elysia", "Wolgast", 10, 48),
	("Rosalia", "Godderd", 10, 61),
	("Fionna", "Amathist", 3, 6),
	("Kanya", "Koran", 3, 48),
	("Cyndie", "Hare", 12, 48),
	("Kylie", "Ricker", 9, 29);

