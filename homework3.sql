/*
 ii. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
*/
SELECT firstname DISRINCT FROM users ORDER BY firstname ASC;


/*
 iii. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
 Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)
*/
ALTER TABLE profiles ADD COLUMN is_active ENUM('true', 'false') DEFAULT 'true';
UPDATE profiles 
SET 
	is_active = 'false'
WHERE 
	birthday < CURRENT_TIMESTAMP()  - INTERVAL 18 YEAR
;


/*
 iv. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
*/
DELETE FROM messages WHERE created_at > NOW();

