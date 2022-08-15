/*
Пусть задан некоторый пользователь. 
Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).
*/
SELECT from_user_id
FROM messages
WHERE  to_user_id  = @user_id 
GROUP BY from_user_id
ORDER BY COUNT(from_user_id) DESC
LIMIT 1


/*
Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..
 */
SELECT COUNT(*)
FROM likes
WHERE user_id IN (
	SELECT user_id  
	FROM profiles
	WHERE TIMESTAMPDIFF(YEAR, birthday, now()) < 10  
);


/*
 Определить кто больше поставил лайков (всего): мужчины или женщины.
*/
SELECT IF (
	(SELECT COUNT(*)
	FROM likes
	WHERE user_id IN (
		SELECT user_id 
		FROM profiles
		WHERE gender = 'f'
	)) > (SELECT COUNT(*)
	FROM likes
	WHERE user_id IN (
		SELECT user_id 
		FROM profiles
		WHERE gender = 'm'
	)), 
	'f', 'm');





