DROP DATABASE IF EXISTS HumanFriends;
CREATE DATABASE HumanFriends;

USE HumanFriends;

# Создать таблицы с иерархией из диаграммы в БД 

DROP TABLE IF EXISTS animals;
CREATE TABLE animals
(
	animal_name VARCHAR(40),
    birthday DATE,
    commands VARCHAR(100)
);

DROP TABLE IF EXISTS pets;
CREATE TABLE pets
(
	animal_name VARCHAR(40),
    birthday DATE,
    commands VARCHAR(100)
);

DROP TABLE IF EXISTS cattle;
CREATE TABLE cattle
(
	animal_name VARCHAR(40),
    birthday DATE,
    commands VARCHAR(100)
);

DROP TABLE IF EXISTS dogs;
CREATE TABLE dogs
(
	animal_name VARCHAR(40),
    birthday DATE,
    commands VARCHAR(100)
);

DROP TABLE IF EXISTS cats;
CREATE TABLE cats
(
	animal_name VARCHAR(40),
    birthday DATE,
    commands VARCHAR(100)
);

DROP TABLE IF EXISTS hamsters;
CREATE TABLE hamsters
(
	animal_name VARCHAR(40),
    birthday DATE,
    commands VARCHAR(100)
);

DROP TABLE IF EXISTS horses;
CREATE TABLE horses
(
	animal_name VARCHAR(40),
    birthday DATE,
    commands VARCHAR(100)
);

DROP TABLE IF EXISTS camels;
CREATE TABLE camels
(
	animal_name VARCHAR(40),
    birthday DATE,
    commands VARCHAR(100)
);

DROP TABLE IF EXISTS donkeys;
CREATE TABLE donkeys
(
	animal_name VARCHAR(40),
    birthday DATE,
    commands VARCHAR(100)
);

# Заполнить низкоуровневые таблицы именами(животных), командами которые они выполняют и датами рождения

INSERT INTO dogs VALUES
('Goofy', '2021-01-01', 'Sit'),
('Pluto', '2022-01-01', 'Dig'),
('Butch', '2019-01-01', 'Come')
;

INSERT INTO cats VALUES
('Tom', '2020-05-04', 'Heel'),
('Pussinboots', '2000-01-01', 'No'),
('Behemoth', '1986-10-02', 'Wait')
;

INSERT INTO hamsters VALUES
('Jerry', '2020-05-03', 'Drop it'),
('Splinter', '1975-05-07', 'Leave it'),
('Remy', '1980-11-02', 'Stay')
;

INSERT INTO horses VALUES
('Pegasus', '2001-11-11', 'Fly'),
('Bullseye', '1990-01-01', 'Run'),
('Buck', '1999-01-02', 'Run')
;

INSERT INTO camels VALUES
('Scar', '2000-08-08', 'Heel'),
('Pumba', '2001-09-01', 'Drop it'),
('Timon', '1997-05-02', 'Run')
;

INSERT INTO donkeys VALUES
('Paul', '2017-07-01', 'Sit'),
('James', '2004-11-01', 'No'),
('Carl', '2009-07-11', 'Wait')
;

# Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой питомник на зимовку. Объединить таблицы лошади, и ослы в одну таблицу.

TRUNCATE TABLE camels;

SELECT animal_name, birthday, commands
FROM donkeys
UNION
SELECT animal_name, birthday, commands
FROM horses;

# Создать новую таблицу “молодые животные” в которую попадут все животные старше 1 года, но младше 3 лет и в отдельном столбце
# с точностью до месяца подсчитать возраст животных в новой таблице

DROP TABLE IF EXISTS young_animals;
CREATE TABLE young_animals
(
	animal_name VARCHAR(40),
    birthday DATE,
    commands VARCHAR(100),
    months_old INT
);

INSERT INTO young_animals (animal_name, birthday, commands, months_old)
SELECT animal_name, birthday, commands, TIMESTAMPDIFF(MONTH, birthday, CURDATE()) AS months_old
FROM cats
WHERE TIMESTAMPDIFF(MONTH, birthday, CURDATE()) BETWEEN 12 AND 36
UNION ALL
SELECT animal_name, birthday, commands, TIMESTAMPDIFF(MONTH, birthday, CURDATE()) AS months_old
FROM dogs
WHERE TIMESTAMPDIFF(MONTH, birthday, CURDATE()) BETWEEN 12 AND 36
UNION ALL
SELECT animal_name, birthday, commands, TIMESTAMPDIFF(MONTH, birthday, CURDATE()) AS months_old
FROM hamsters
WHERE TIMESTAMPDIFF(MONTH, birthday, CURDATE()) BETWEEN 12 AND 36
UNION ALL
SELECT animal_name, birthday, commands, TIMESTAMPDIFF(MONTH, birthday, CURDATE()) AS months_old
FROM donkeys
WHERE TIMESTAMPDIFF(MONTH, birthday, CURDATE()) BETWEEN 12 AND 36
UNION ALL
SELECT animal_name, birthday, commands, TIMESTAMPDIFF(MONTH, birthday, CURDATE()) AS months_old
FROM horses
WHERE TIMESTAMPDIFF(MONTH, birthday, CURDATE()) BETWEEN 12 AND 36
UNION ALL
SELECT animal_name, birthday, commands, TIMESTAMPDIFF(MONTH, birthday, CURDATE()) AS months_old
FROM camels
WHERE TIMESTAMPDIFF(MONTH, birthday, CURDATE()) BETWEEN 12 AND 36;

# Объединить все таблицы в одну, при этом сохраняя поля, указывающие на прошлую принадлежность к старым таблицам

CREATE TABLE spreadsheet AS
SELECT 'cats' AS animal_type, animal_name, birthday, commands
FROM cats
UNION ALL
SELECT 'dogs' AS animal_type, animal_name, birthday, commands
FROM dogs
UNION ALL
SELECT 'hamsters' AS animal_type, animal_name, birthday, commands
FROM hamsters
UNION ALL
SELECT 'donkeys' AS animal_type, animal_name, birthday, commands
FROM donkeys
UNION ALL
SELECT 'horses' AS animal_type, animal_name, birthday, commands
FROM horses
UNION ALL
SELECT 'camels' AS animal_type, animal_name, birthday, commands
FROM camels;