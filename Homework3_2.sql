DROP DATABASE IF EXISTS homework3_2;

CREATE DATABASE IF NOT EXISTS homework3_2;

USE homework3_2;

CREATE TABLE IF NOT EXISTS staff (
  id INT AUTO_INCREMENT PRIMARY KEY, 
  first_name VARCHAR(45), 
  last_name VARCHAR(45), 
  post VARCHAR(45), 
  seniority INT, 
  salary DECIMAL(8, 2), 
  age INT
);

TRUNCATE staff;

INSERT  staff (first_name, last_name, post, seniority, salary, age)
VALUES
	 ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
	 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
	 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
	 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
	 ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
	 ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
	 ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
	 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
	 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
	 ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
	 ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
	 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

# сортируем по возрастанию з/п 
SELECT * FROM staff
ORDER BY salary;

# сортируем по убыванию з/п 
SELECT * FROM staff
ORDER BY salary DESC;

# сортируем по убыванию з/п, отбираем 5 первых строк (с наибольшей з/п) и затем сортируем их по возрастанию
SELECT * FROM 
	(SELECT * FROM staff
	ORDER BY salary DESC
	LIMIT 5) AS salary
ORDER BY salary;

# группируем сотрудников по специальности и выводим данные по специальностям, обзая з/п которых больше 100000
SELECT post, SUM(salary) AS dept_salary
FROM staff
GROUP BY post
HAVING dept_salary>100000;


