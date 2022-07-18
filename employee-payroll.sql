Employee payroll service


UC1:creating database

mysql> create database payroll_service;
Query OK, 1 row affected (0.73 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
   my name
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
8 rows in set (4.36 sec)

mysql> USE payroll_service;
Database changed

_____________________________________________________________________________________________________________________________________________________________________________________________

UC2:creating tabble

mysql> CREATE TABLE employee
    -> (
    -> id INT unsigned NOT NULL AUTO_INCREMENT,
    -> name VARCHAR(150) NOT NULL,
    -> salary Double NOT NULL,
    -> start DATE NOT NULL,
    -> PRIMARY KEY (id));
Query OK, 0 rows affected (2.17 sec)

mysql> DESCRIBE employee;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(150) | NO   |     | NULL    |                |
| salary | double       | NO   |     | NULL    |                |
| start  | date         | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
4 rows in set (0.12 sec)

_____________________________________________________________________________________________________________________________________________________________________________________________

UC3: inserting data

mysql> INSERT INTO employee ( name , salary, start) VALUES
     ('BILL', 100000.00, '2021-01-29'),
     ('Terisa', 200000.00, '2020-05-5'),
     ('Charlie', 300000.00,'2019-03-14');
Query OK, 3 rows affected (0.15 sec)
Records: 3  Duplicates: 0  Warnings: 0

_____________________________________________________________________________________________________________________________________________________________________________________________

UC4:

mysql> select * from employee;
+----+---------+--------+------------+
| id | name    | salary | start      |
+----+---------+--------+------------+
|  1 | BILL    | 100000 | 2021-01-29 |
|  2 | Terisa  | 200000 | 2020-05-05 |
|  3 | Charlie | 300000 | 2019-03-14 |
+----+---------+--------+------------+
3 rows in set (0.00 sec)


________________________________________________________________________________________________________________________________________________________________________

UC5:

mysql> select salary from employee where name = 'BILL';
+--------+
| salary |
+--------+
| 100000 |
+--------+
1 row in set (0.00 sec)

mysql> select * from employee where start BETWEEN CAST('2020-02-05' AS DATE) AND DATE(NOW());
+----+--------+--------+------------+
| id | name   | salary | start      |
+----+--------+--------+------------+
|  1 | BILL   | 100000 | 2021-01-29 |
|  2 | Terisa | 200000 | 2020-05-05 |
+----+--------+--------+------------+
2 rows in set (0.03 sec)

_____________________________________________________________________________________________________________________________________________________________________________________________

UC6:

mysql> alter table employee add gender CHAR(1) after name;
Query OK, 0 rows affected (2.64 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> update employee set gender = 'M' where name = 'BILL';
Query OK, 1 row affected (0.36 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee set gender = 'F' where name = 'Terisa';
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee set gender = 'M' where name = 'Charlie';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee;
+----+---------+--------+--------+------------+
| id | name    | gender | salary | start      |
+----+---------+--------+--------+------------+
|  1 | BILL    | M      | 100000 | 2021-01-29 |
|  2 | Terisa  | F      | 200000 | 2020-05-05 |
|  3 | Charlie | M      | 300000 | 2019-03-14 |
+----+---------+--------+--------+------------+
3 rows in set (0.00 sec)
_____________________________________________________________________________________________________________________________________________________________________________________________
UC7:

mysql> select AVG(salary) from employee where gender = 'M' group by gender;
+-------------+
| AVG(salary) |
+-------------+
|      200000 |
+-------------+
1 row in set (0.05 sec)

mysql> select gender,AVG(salary) from employee group by gender;
+--------+-------------+
| gender | AVG(salary) |
+--------+-------------+
| M      |      200000 |
| F      |      200000 |
+--------+-------------+
2 rows in set (0.10 sec)

mysql> select AVG(salary) from employee;
+-------------+
| AVG(salary) |
+-------------+
|      200000 |
+-------------+
1 row in set (0.00 sec)

mysql> select gender,COUNT(salary) from employee group by gender;
+--------+---------------+
| gender | COUNT(salary) |
+--------+---------------+
| M      |             2 |
| F      |             1 |
+--------+---------------+
2 rows in set (0.00 sec)

mysql> select gender,SUM(salary) from employee group by gender;
+--------+-------------+
| gender | SUM(salary) |
+--------+-------------+
| M      |      400000 |
| F      |      200000 |
+--------+-------------+
2 rows in set (0.00 sec)

mysql> select gender,MIN(salary) from employee group by gender;
+--------+-------------+
| gender | MIN(salary) |
+--------+-------------+
| M      |      100000 |
| F      |      200000 |
+--------+-------------+
2 rows in set (0.03 sec)

mysql> select gender,MAX(salary) from employee group by gender;
+--------+-------------+
| gender | MAX(salary) |
+--------+-------------+
| M      |      300000 |
| F      |      200000 |
+--------+-------------+
2 rows in set (0.00 sec)

-----------------------------------------------------------------------------------------------------------------------

mysql> update employee set salary=300000 where name="Terisa";
Query OK, 1 row affected (0.32 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee;
+----+---------+--------+------------+
| id | name    | salary | start      |
+----+---------+--------+------------+
|  1 | BILL    | 100000 | 2021-01-29 |
|  2 | Terisa  | 300000 | 2020-05-05 |
|  3 | Charlie | 300000 | 2019-03-14 |
+----+---------+--------+------------+
3 rows in set (0.00 sec)


mysql> SELECT * FROM employee where start between '2019-01-14' AND '2020-05-05';
+----+---------+---------+------------+
| id | name    | salary  | start      |
+----+---------+---------+------------+
|  2 | Terisa  | 3000000 | 2020-05-05 |
|  3 | Charlie |  300000 | 2019-03-14 |
+----+---------+---------+------------+
2 rows in set (0.00 sec)


