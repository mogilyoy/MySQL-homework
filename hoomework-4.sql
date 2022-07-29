/*
1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
Заполните их текущими датой и временем.
*/

UPDATE users 
SET 
	created_at = NOW(),
	updated_at = NOW();

/*
2. Таблица users была неудачно спроектирована. 
Записи created_at и updated_at были заданы типом VARCHAR 
и в них долгое время помещались значения в формате "20.10.2017 8:10". 
Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
*/

UPDATE users
	SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'),
		updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %k:%i');	
	
ALTER TABLE users 
	MODIFY COLUMN created_at DATETIME DEFAULT NOW();
	
ALTER TABLE users 
	MODIFY COLUMN updated_at DATETIME DEFAULT NOW() ON UPDATE NOW();


/*
3. В таблице складских запасов storehouses_products 
в поле value могут встречаться самые разные цифры: 
0, если товар закончился и выше нуля, если на складе имеются запасы. 
Необходимо отсортировать записи таким образом, чтобы они выводились в 
порядке увеличения значения value. 
Однако, нулевые запасы должны выводиться в конце, после всех записей
*/
SELECT * FROM storehouses_products ORDER BY IF(value > 0, 0, 1), value;




-- 1. Подсчитайте средний возраст пользователей в таблице users
SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS mid_age FROM users;

/* 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
Следует учесть, что необходимы дни недели текущего года, а не года рождения.
*/
SELECT DATE_FORMAT(DATE(CONCAT_WS() ('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS what_day,
COUNT(*) AS total FROM users
GROUP BY what_day;


























