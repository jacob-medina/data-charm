DROP DATABASE IF EXISTS wand_db;
CREATE DATABASE wand_db;
USE wand_db;

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
	("Lianne", "Coffee", 1, NULL),
	("Laetitia", "Rivera", 4, NULL),
	("Cathrine", "Odell", 6, NULL),
	("Una", "Tecla", 8, NULL),
	("Annabelle", "Chadbourne", 13, NULL),
	("Bree", "Emlin", 13, NULL),
	("Jaclyn", "Landry", 3, NULL),
	("Joan", "Gallager", 4, NULL),
	("Natalya", "Wedurn", 2, NULL),
	("Merissa", "Cai", 12, NULL),
	("Kessia", "Clemen", 9, NULL),
	("Manya", "Veats", 10, NULL),
	("Kristina", "Weisler", 14, NULL),
	("Carmencita", "Rutger", 9, NULL),
	("Katrine", "Cardwell", 1, 11),
	("Gaylene", "Krahling", 13, 11),
	("Lidia", "Cooke", 1, 11),
	("Maible", "Syd", 13, 11),
	("Sukey", "Sihun", 12, NULL),
	("Shandra", "Bank", 10, NULL),
	("Konstanze", "Eirene", 11, NULL),
	("Naoma", "Louie", 9, NULL),
	("Noreen", "Lancey", 4, NULL),
	("Madeleine", "Izzy", 4, NULL),
	("Shoshanna", "Yonatan", 5, NULL),
	("Dian", "Mitzie", 11, NULL),
	("Gwendolin", "Rosella", 11, NULL),
	("Lila", "Palestine", 2, NULL),
	("Lissa", "Platt", 14, NULL),
	("Ashely", "Bernadina", 7, 29),
	("Alysia", "Ivens", 2, 29),
	("Simonne", "Harold", 13, NULL),
	("Alison", "Fabrianne", 9, NULL),
	("Cybil", "Bahr", 2, NULL),
	("Nyssa", "Krysta", 7, 11),
	("Nananne", "Kalin", 8, NULL),
	("Mikaela", "Nicolina", 13, NULL),
	("Rivi", "Follmer", 4, 11),
	("Oriana", "Ellicott", 13, NULL),
	("Krystal", "Little", 8, 29),
	("Michaelina", "Johnnie", 7, NULL),
	("Dulcinea", "Josiah", 10, NULL),
	("Carlene", "Erl", 4, NULL),
	("Frederique", "Mozza", 13, NULL),
	("Andriana", "Fergus", 1, 29),
	("Katherine", "Horbal", 9, NULL),
	("Zarla", "Swanhildas", 3, 29),
	("Danette", "Alcot", 11, NULL),
	("Stephie", "Kolivas", 6, 48),
	("Lyndsey", "Cranston", 7, 11),
	("Maddie", "Coffeng", 11, 11),
	("Linzy", "Jew", 3, NULL),
	("Tanhya", "Froehlich", 12, NULL),
	("Sophi", "Telford", 11, NULL),
	("Lyda", "Bartosch", 8, NULL),
	("Marylynne", "Tyrus", 8, 48),
	("Enriqueta", "Henigman", 10, NULL),
	("Gwenora", "Gregorius", 10, 29),
	("Marja", "Thorrlow", 1, NULL),
	("Myrilla", "Marx", 11, NULL),
	("Tatiania", "Billi", 12, 60),
	("Odette", "Kauffmann", 7, 48),
	("Aila", "Trip", 3, NULL),
	("Elyse", "Geoff", 2, NULL),
	("Malynda", "Yolanthe", 14, 48),
	("Audrye", "Kenzie", 1, 60),
	("Clarissa", "Corette", 9, 29),
	("Lynn", "Catriona", 4, 48),
	("Robby", "Sender", 6, 48),
	("Dorena", "Gibert", 1, 48),
	("Cathy", "Evin", 6, 11),
	("Nona", "Veronike", 13, NULL),
	("Daile", "Duwalt", 10, 29),
	("Ceil", "Hertz", 4, 29),
	("Ninetta", "Jurkoic", 2, 60);

