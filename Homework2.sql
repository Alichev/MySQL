CREATE DATABASE IF NOT EXISTS homework2;

USE homework2;

DROP TABLE IF EXISTS sales;

CREATE TABLE IF NOT EXISTS sales (
id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
order_date DATE,
count_product INT UNSIGNED
);

INSERT sales (order_date, count_product)
VALUES
	('2022-01-01', 156),
    ('2022-01-02', 180),
    ('2022-01-03', 21),
    ('2022-01-04', 124),
    ('2022-01-05', 341);

SELECT * FROM sales;

SELECT id,
CASE
	WHEN count_product<100
		THEN 'Маленький заказ'
	WHEN count_product>300
		THEN 'Большой заказ'
	ELSE 'Средний заказ'
END AS 'Тип заказа'
FROM sales;

CREATE TABLE IF NOT EXISTS orders (
id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
employee_id VARCHAR(10) NOT NULL,
amount DECIMAL(6,2),
order_status VARCHAR(20)
);

INSERT orders (employee_id, amount, order_status)
VALUES
	('e03', 15.00, 'open'),
	('e01', 25.50, 'open'),
	('e05', 100.70, 'closed'),
	('e02', 22.18, 'open'),
	('e04', 9.50, 'cancelled');

SELECT * FROM orders;

SELECT id, employee_id, amount,
CASE
	WHEN order_status='open'
		THEN 'Order is in open state'
	WHEN order_status='closed'
		THEN 'Order is closed'
	WHEN order_status='cancelled'
		THEN 'Order is cancelled'
END AS full_order_status
FROM orders;

/* 
NULL - отсутсвующее значение, а 0 - числовое значение "ноль"
*/