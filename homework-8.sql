/*
В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. 
Используйте транзакции.
*/
-- 
DROP TABLE IF EXISTS sample.users;
CREATE TABLE sample.users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


START TRANSACTION; 

SELECT * INTO @vid, @vname, @vbirthday, @vcreated, @vupdated FROM shop.users WHERE shop.users.id = 1;
SAVEPOINT selection;
INSERT INTO sample.users VALUES (@vid, @vname, @vbirthday, @vcreated, @vupdated);

COMMIT;


/*
Создайте представление, которое выводит название name товарной позиции из 
таблицы products и соответствующее название каталога name из таблицы catalogs.
*/

CREATE VIEW name_cat AS 
SELECT p.name AS 'products', c.name AS 'catalogs'
FROM 
	products AS p
	JOIN 
	catalogs AS c 
ON p.catalog_id = c.id;

SELECT * FROM name_cat;



/*
Создайте двух пользователей которые имеют доступ к базе данных shop. 
Первому пользователю shop_read должны быть доступны только запросы на чтение данных, 
второму пользователю shop — любые операции в пределах базы данных shop.

*/
CREATE USER shop IDENTIFIED WITH sha256_password BY 'password';
CREATE USER shop_read IDENTIFIED WITH sha256_password BY 'password';


GRANT * ON shop.* TO shop;
GRANT SELECT ON '.' TO shop_read;



/*
Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
с 18:00 до 00:00 — "Добрый вечер", 
с 00:00 до 6:00 — "Доброй ночи".
*/

CREATE FUNCTION hello()
RETURNS TEXT NOT DETERMINISTIC 
BEGIN 
	DECLARE hours INT DEFAULT HOUR(NOW());
	
	IF (hours >= 0 AND hours <= 6)THEN 
		RETURN 'Доброй ночи';
	ELSEIF (hours > 6 AND hours <= 12)THEN 
		RETURN 'Доброе утро';
	ELSEIF (hours > 12 AND hours <= 18)THEN 
		RETURN 'Добрый день';
	ELSEIF (hours > 18 AND hours <= 23)THEN 
		RETURN 'Доброй ночи';
	END IF;
END;

SELECT hello();
-- выдает ошибку на моменте присваивания, не понял почему
-- Причина:
--  SQL Error [1064] [42000]: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 69

/*
В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
При попытке присвоить полям NULL-значение необходимо отменить операцию.
*/
-- 
Delimiter //;

CREATE TRIGGER check_ctalog_id_insert BEFORE UPDATE ON products
FOR EACH ROW
BEGIN 
    IF (NEW.name IS NULL AND NEW.description IS NULL) THEN 
    SET NEW.name = OLD.name;
   	SET NEW.description = OLD.description;
   END IF;
END//

UPDATE products 
	SET 
		products.name = NULL,
		products.description = 'fsfksdlaf'
WHERE id = 6//









