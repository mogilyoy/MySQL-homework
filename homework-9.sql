
/*
 * Создайте таблицу logs типа Archive. Пусть при каждом создании записи 
 * в таблицах users, catalogs и products в таблицу logs помещается время и дата создания записи, 
 * название таблицы, идентификатор первичного ключа и содержимое поля name.
 */

USE shop;


DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
	`local_id` BIGINT UNSIGNED NOT NULL,
	`table_name` VARCHAR(255),
	`create_at` DATETIME,
	`name` VARCHAR(255)
) ENGINE = Archive;

DELIMITER //

CREATE TRIGGER `users_log` AFTER UPDATE ON `users`
FOR EACH ROW
BEGIN
	INSERT INTO `logs` VALUES (NEW.id, 'users', NOW(), NEW.name);
END//

DELIMITER ;


DELIMITER //

CREATE TRIGGER `catalogs_log` AFTER UPDATE ON `catalogs`
FOR EACH ROW
BEGIN
	INSERT INTO `logs` VALUES (NEW.id, 'catalogs', NOW(), NEW.name);
END//

DELIMITER ;


DELIMITER //

CREATE TRIGGER `products_log` AFTER UPDATE ON `products`
FOR EACH ROW
BEGIN
	INSERT INTO `logs` VALUES (NEW.id, 'products', NOW(), NEW.name);
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER `users_insert_log` AFTER INSERT ON `users`
FOR EACH ROW
BEGIN
	INSERT INTO `logs` 
	SET 
		`local_id` = NEW.id,
		`table_name` = 'users',
		`create_at` = NOW(),
		`name` = NEW.name;
END//

DELIMITER ;


DELIMITER //

CREATE TRIGGER `catalogs_insert_log` AFTER INSERT ON `catalogs`
FOR EACH ROW
BEGIN
	INSERT INTO `logs` 
	SET 
		`local_id` = NEW.id,
		`table_name` = 'catalogs',
		`create_at` = NOW(),
		`name` = NEW.name;
END//

DELIMITER ;


DELIMITER //

CREATE TRIGGER `products_insert_log` AFTER INSERT ON `products`
FOR EACH ROW
BEGIN
	INSERT INTO `logs` 
	SET 
		`local_id` = NEW.id,
		`table_name` = 'products',
		`create_at` = NOW(),
		`name` = NEW.name;
END//

DELIMITER ;



INSERT INTO 
	users (`name`, `birthday_at`) 
VALUES ('Андрюха', '2009-09-01');

SELECT * FROM `logs`; 



