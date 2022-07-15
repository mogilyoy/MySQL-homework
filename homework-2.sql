/*
Написать cкрипт, добавляющий в БД vk, которую создали на занятии, 3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)
*/


DROP TABLE IF EXISTS janres;
CREATE TABLE janres (
id SERIAL,
name VARCHAR(255)
);


DROP TABLE IF EXISTS music_bands;
CREATE TABLE music_bands (
id SERIAL,
name VARCHAR(255),
janre_id BIGINT UNSIGNED NOT NULL UNIQUE,

FOREIGN KEY (janre_id) REFERENCES janres(id)

);


DROP TABLE IF EXISTS music_albums;
CREATE TABLE music_albums (
id SERIAL,
name VARCHAR(255),
janre_id BIGINT UNSIGNED NOT NULL UNIQUE,
author_id BIGINT UNSIGNED NOT NULL UNIQUE,
created_at DATETIME,
FOREIGN KEY (janre_id) REFERENCES janres(id),
FOREIGN KEY (author_id) REFERENCES music_bands(id)
);



DROP TABLE IF EXISTS songs;
CREATE TABLE songs (
id SERIAL,
name VARCHAR(255),
author_id BIGINT UNSIGNED NOT NULL UNIQUE,
album_id BIGINT UNSIGNED NOT NULL UNIQUE,
janre_id BIGINT UNSIGNED NOT NULL UNIQUE,
lyrics = TEXT,

FOREIGN KEY (author_id) REFERENCES music_bands(id),
FOREIGN KEY (album_id) REFERENCES music_albums(id),
FOREIGN KEY (janre_id) REFERENCES janres(id)

);












