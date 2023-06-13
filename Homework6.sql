CREATE DATABASE IF NOT EXISTS gb_homework6;
USE gb_homework6;


-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER //
CREATE FUNCTION sec_converting(sec INT)
RETURNS VARCHAR(150)
NO SQL
BEGIN
  DECLARE days INT;
  DECLARE hours INT;
  DECLARE minutes INT;
  DECLARE res_str VARCHAR(150);

  SET days = floor(sec / 86400);
  SET sec = sec % 86400;
  SET hours = floor(sec / 3600);
  SET sec = sec % 3600;
  SET minutes = floor(sec / 60);
  SET sec = sec % 60;
  SET res_str = CONCAT(days, ' days, ', hours, ' hours, ', minutes, ' minutes ', sec, ' and seconds');

  RETURN res_str;
END //

DELIMITER ;

SELECT sec_converting(345678);
SELECT sec_converting(123456);

-- Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10 

DELIMITER //
CREATE FUNCTION even__numbers(N INT)
RETURNS VARCHAR(50)
NO SQL
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE result VARCHAR(50) DEFAULT " ";
  
  WHILE i <= N DO
    IF i % 2 = 0 THEN
      SET result = CONCAT(result, i, ', ');
    END IF;
    SET i = i + 1;
  END WHILE;
  
  RETURN SUBSTRING(result, 1, LENGTH(result) - 2);
END //

DELIMITER ;

SELECT even__numbers(20);