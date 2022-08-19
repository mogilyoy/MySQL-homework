/*
 * Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине. * 
 */

SELECT * 
FROM users 
WHERE id IN (
	SELECT user_id
	FROM orders
	GROUP BY user_id
);


/*
 * Выведите список товаров products и разделов catalogs, который соответствует товару.
 */

SELECT prod.name, cat.name 
FROM products AS prod
JOIN 
catalogs AS cat
ON prod.catalog_id = cat.id;
-- не совсем понял задание, надеюсь сделал то что требуется


/*
 * Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
 * Поля from, to и label содержат английские названия городов, поле name — русское. 
 * Выведите список рейсов flights с русскими названиями городов.
 */

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
	id SERIAL,
	`from` varchar(255),
	`to` varchar(255)
);

INSERT INTO 
	flights
	(`from`, `to`)
VALUES 
	('moscow', 'omsk'),
	('novgorod', 'kazan')
;

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	id SERIAL,
	`label` varchar(255),
	`name` varchar(255)
);

INSERT INTO 
	cities
	(`label`, `name`)
VALUES 
	('moscow', 'Москва'),
	('novgorod', 'Новгород'),
	('omsk', 'Омск'),
	('kazan', 'Казань')
;


SELECT 
	yep.id, 
	cities.name, 
	yep.name
FROM 
	cities
JOIN
(
	SELECT 
		flights.id, 
		flights.from, 
		cities.name
	FROM
		flights
		JOIN 
		cities
	ON flights.to = cities.label
	) AS yep
ON yep.from = cities.label 
;


