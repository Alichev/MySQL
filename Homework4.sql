DROP DATABASE IF EXISTS homework4;

CREATE DATABASE IF NOT EXISTS homework4;

USE homework4;

CREATE TABLE IF NOT EXISTS AUTO 
(       
  REGNUM VARCHAR(10) PRIMARY KEY, 
  MARK VARCHAR(10), 
  COLOR VARCHAR(15),
  RELEASEDT DATE, 
  PHONENUM VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS CITY 
(	
  CITYCODE INT PRIMARY KEY,
  CITYNAME VARCHAR(50), 
  PEOPLES INT 
);

CREATE TABLE IF NOT EXISTS MAN 
(	
  PHONENUM VARCHAR(15) PRIMARY KEY , 
  FIRSTNAME VARCHAR(50),
  LASTNAME VARCHAR(50),  
  CITYCODE INT, 
  YEAROLD INT	 
);

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES
  (111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221'),
  (111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334'),
  (111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334'),
  (111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332'),
  (111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336'),
  (111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444'),
  (111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null),
  (111117,'BMW', 'СИНИЙ', date'2005-01-01', null),
  (111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);

INSERT INTO CITY (CITYCODE,CITYNAME,PEOPLES)
VALUES
  (1,'Москва', 10000000),
  (2,'Владимир', 500000),
  (3, 'Орел', 300000),
  (4,'Курск', 200000),
  (5, 'Казань', 2000000),
  (7, 'Котлас', 110000),
  (8, 'Мурманск', 400000),
  (9, 'Ярославль', 500000);

INSERT INTO MAN (PHONENUM,FIRSTNAME,LASTNAME,CITYCODE,YEAROLD)
VALUES
  ('9152222221','Андрей','Николаев', 1, 22),
  ('9152222222','Максим','Москитов', 1, 31),
  ('9153333333','Олег','Денисов', 3, 34),
  ('9173333334','Алиса','Никина', 4, 31),
  ('9173333335','Таня','Иванова', 4, 31),
  ('9213333336','Алексей','Иванов', 7, 25),
  ('9213333331','Андрей','Некрасов', 2, 27),
  ('9213333332','Миша','Рогозин', 2, 21),
  ('9214444444','Алексей','Галкин', 1, 38);

# Вывести на экран, сколько машин каждого цвета для марок BMW и LADA
SELECT MARK, COLOR, COUNT(COLOR) AS 'Количество'
FROM AUTO
WHERE MARK = 'BMW'
GROUP BY MARK, COLOR
UNION SELECT MARK, COLOR, COUNT(COLOR) AS 'Количество'
FROM AUTO
WHERE MARK = 'LADA'
GROUP BY MARK, COLOR;

# Вывести на экран марку авто (количество) и количество авто не этой марки
SELECT MARK, 
  (SELECT COUNT(1) FROM AUTO AS a1 WHERE a1.MARK = a.MARK) AS 'Кол-во а/м этой марки', 
  (SELECT COUNT(1) FROM AUTO AS a1 WHERE a1.MARK <> a.MARK) AS 'Кол-во а/м других марок' 
FROM AUTO AS a
GROUP BY MARK;

# Даны 2 таблицы. Написать запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT
CREATE TABLE IF NOT EXISTS test_a 
  (id_number int, data1 varchar(1));

CREATE TABLE IF NOT EXISTS test_b 
  (id_number int);

INSERT INTO test_a (id_number, data1) 
VALUES 
  (10, 'A'),
  (20, 'A'),
  (30, 'F'),
  (40, 'D'),
  (50, 'C');

INSERT INTO test_b (id_number) 
VALUES 
  (10),
  (30),
  (50);

SELECT * FROM test_a
LEFT JOIN test_b
USING (id_number)
WHERE test_b.id_number IS NULL;