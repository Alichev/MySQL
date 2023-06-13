/*
1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

DROP DATABASE IF EXISTS homework6;

CREATE DATABASE IF NOT EXISTS homework6;

USE homework6;

DELIMITER //
CREATE FUNCTION convert_to_days(seconds INT)
RETURNS VARCHAR(50)
NO SQL
BEGIN
  DECLARE days INT;
  DECLARE hours INT;
  DECLARE minutes INT;
  DECLARE final VARCHAR(50);

  SET days = floor(seconds / (24 * 3600));
  SET seconds = seconds % (24 * 3600);

  SET hours = floor(seconds / 3600);
  SET seconds = seconds % 3600;

  SET minutes = floor(seconds / 60);
  SET seconds = seconds % 60;

  SET final = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');

  RETURN final;
END //

DELIMITER ;

SELECT convert_to_days(98765);

/*
2. Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10 
*/

DELIMITER //

CREATE FUNCTION get_even_numbers(n INT)
RETURNS VARCHAR(50)
NO SQL
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE result VARCHAR(50) DEFAULT '';
  
  WHILE i <= n DO
    IF i % 2 = 0 THEN
      SET result = CONCAT(result, i, ', ');
    END IF;
    SET i = i + 1;
  END WHILE;
  
  RETURN SUBSTRING(result, 1, LENGTH(result) - 2);
END //

DELIMITER ;

SELECT get_even_numbers(10);
