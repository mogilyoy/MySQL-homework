/*
Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
который больше всех общался с выбранным пользователем (написал ему сообщений).
*/

SET @user_id = 1;

SELECT 
	messages.from_user_id AS user_id, 
	CONCAT(users.firstname, ' ', users.lastname) AS name, 
	COUNT(*) AS quantity  
FROM 
	messages
	JOIN 
	users
ON messages.to_user_id = @user_id AND messages.from_user_id = users.id
GROUP BY 
	messages.from_user_id
ORDER BY quantity DESC 
LIMIT 1
;


/*
Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
*/

SELECT 
	COUNT(*) AS quantity
FROM 
	likes
	JOIN 
	profiles
ON likes.user_id = profiles.user_id
WHERE timestampdiff(YEAR, profiles.birthday, NOW()) < 10;


/*
Определить кто больше поставил лайков (всего): мужчины или женщины.
*/
SELECT 
	count(*) AS quantity, 
	profiles.gender AS Gen
FROM 
	likes
	JOIN 
	profiles
ON likes.user_id = profiles.user_id
GROUP BY profiles.gender
ORDER BY quantity DESC
LIMIT 1
;





