/* 
Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
*/
DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
CREATE TABLE example.users (id int, name varchar(10)); --почему то myslq отказывался создавать таблицу без указания количества символов в varchar

/*
Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.

mysqldump example > example_dump.sql -u root -p

mysql> CREATE DATABASE example_dump;
Query OK, 1 row affected (0,01 sec)

mysql example_dump < example_dump.sql -u root -p

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| example            |
| example_dump       |
| information_schema |
| mysql              |
| performance_schema |
| shop               |
| sys                |
+--------------------+
7 rows in set (0,00 sec)


mysql> use example_dump
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+------------------------+
| Tables_in_example_dump |
+------------------------+
| users                  |
+------------------------+
1 row in set (0,00 sec)
*/

/*
(по желанию) Ознакомьтесь более подробно с документацией утилиты mysqldump. 
Создайте дамп единственной таблицы help_keyword базы данных mysql. 
Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.

mysqldump mysql help_keyword --where='1 limit 100' > 100_rows.sql -u root -p
*/