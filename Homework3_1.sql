DROP DATABASE IF EXISTS homework3_1;

CREATE DATABASE IF NOT EXISTS homework3_1;

USE homework3_1;

CREATE TABLE IF NOT EXISTS salespeople (
  snum INT PRIMARY KEY, 
  sname VARCHAR(45), 
  city VARCHAR(45), 
  comm VARCHAR(10)
);

TRUNCATE salespeople;

INSERT  salespeople (snum, sname, city, comm)
VALUES
	(1001, 'Peel', 'London', '.12'),
	(1002, 'Serres', 'San Jose', '.13'),
	(1004, 'Motika', 'London', '.11'),
	(1007, 'Rifkin', 'Barcelona', '.15'),
	(1003, 'Axelrod', 'New York', '.10');

SELECT * FROM salespeople;

CREATE TABLE IF NOT EXISTS customers (
  cnum INT PRIMARY KEY, 
  cname VARCHAR(45), 
  city VARCHAR(45), 
  rating INT,
  snum INT
);

TRUNCATE customers;

INSERT  customers (cnum, cname, city, rating, snum)
VALUES
	(2001, 'Hoffman', 'London', 100, 1001),
	(2002, 'Jiovanni', 'Rome', 200, 1003),
	(2003, 'Liu', 'San Jose', 200, 1002),
	(2004, 'Grass', 'Berlin', 300, 1002),
	(2006, 'Clemens', 'London', 100, 1001),
	(2008, 'Cisneros', 'San Jose', 300, 1007),
	(2007, 'Pereira', 'Rome', 100, 1004);

SELECT * FROM customers;

CREATE TABLE IF NOT EXISTS orders (
  onum INT PRIMARY KEY, 
  amt DECIMAL(7,2), 
  odate DATE, 
  cnum INT,
  snum INT
);

INSERT orders (onum, amt, odate, cnum, snum)
VALUES
	(3001, 18.69, '1990-10-03', 2008, 1007),
	(3003, 767.19, '1990-10-03', 2001, 1001),
	(3002, 1900.10, '1990-10-03', 2007, 1004),
	(3005, 5160.45, '1990-10-03', 2003, 1002),
	(3006, 1098.16, '1990-10-03', 2008, 1007),
	(3009, 1713.23, '1990-10-04', 2002, 1003),
	(3007, 75.75, '1990-10-04', 2004, 1002),
	(3008, 4723.00, '1990-10-05', 2006, 1001),
	(3010, 1309.95, '1990-10-06', 2004, 1002),
	(3011, 9891.88, '1990-10-06', 2006, 1001);
    
SELECT * FROM orders;

# выводим столбцы в заданном порядке из таблицы salespeople
SELECT city, sname, snum, comm FROM salespeople;

# выводим рейтинг каждого заказчика в городе San Jose из таблицы customers
SELECT cname, rating 
FROM customers
WHERE city = 'San Jose';

# выводим уникальные значения snum из таблицы salespeople
SELECT DISTINCT snum
FROM salespeople;

# выведем имена заказчиков, которые начинаются с буквы G
SELECT cname 
FROM customers
WHERE cname LIKE 'G%';

# выведем все заказы со значением суммы больше 1000
SELECT onum, amt
FROM orders
WHERE amt>1000;

# выведем заказ с наименьшей суммой
SELECT MIN(amt)
FROM orders;

# выведем заказчиков с рейтингом больше 100 и находящимся не в Риме
SELECT * 
FROM customers
WHERE rating>100 AND city !='Rome';