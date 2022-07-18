uc1)creating address book database

 create database AddressBookService;
Query OK, 1 row affected (0.12 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| addressbookservice |
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
8 rows in set (0.00 sec)

mysql> use addressbookservice;
Database changed
-------------------------------------------------------------------------------------------------------------------------------------------------------

uc2)creating DDRESSBOOK TABLE

 create table AddressBook(
    ->      firstname varchar(50) not null,
    ->      lastname varchar(50) not null,
    ->      address varchar(100) not null,
    ->      city varchar(50) not null,
    ->      state varchar(50) not null,
    ->      zip int not null,
    ->      phonenumber double not null,
    ->      email varchar(100) not null);
Query OK, 0 rows affected (0.04 sec)

mysql> desc AddressBook;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| firstname   | varchar(50)  | NO   |     | NULL    |       |
| lastname    | varchar(50)  | NO   |     | NULL    |       |
| address     | varchar(100) | NO   |     | NULL    |       |
| city        | varchar(50)  | NO   |     | NULL    |       |
| state       | varchar(50)  | NO   |     | NULL    |       |
| zip         | int          | NO   |     | NULL    |       |
| phonenumber | double       | NO   |     | NULL    |       |
| email       | varchar(100) | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

--------------------------------------------------------------------------------------------------------------------------------------------

uc3)

mysql> insert into AddressBook(firstname,lastname,address,city,state,zip,phonenumber,email) values('nagaraj','sg','koppal','koppal','karnataka',583231,8660768341,'nagarajasg09@gmail.com');
Query OK, 1 row affected (0.01 sec)

mysql> insert into AddressBook(firstname,lastname,address,city,state,zip,phonenumber,email) values('shrikanth','hg','kustagi','koppal','karnataka',583131,8861462305,'srik78@gmail.com');
Query OK, 1 row affected (0.00 sec)

mysql> insert into AddressBook(firstname,lastname,address,city,state,zip,phonenumber,email) values('bharath','pg','hospet','vijayanagara','karnataka',583234,886359546,'bharathkh88@gmail.com');
Query OK, 1 row affected (0.00 sec)

mysql> select * from AddressBook;
+-----------+----------+---------+--------------+-----------+--------+-------------+------------------------+
| firstname | lastname | address | city         | state     | zip    | phonenumber | email                  |
+-----------+----------+---------+--------------+-----------+--------+-------------+------------------------+
| nagaraj   | sg       | koppal  | koppal       | karnataka | 583231 |  8660768341 | nagarajasg09@gmail.com |
| shrikanth | hg       | kustagi | koppal       | karnataka | 583131 |  8861462305 | srik78@gmail.com       |
| bharath   | pg       | hospet  | vijayanagara | karnataka | 583234 |   886359546 | bharathkh88@gmail.com  |
+-----------+----------+---------+--------------+-----------+--------+-------------+------------------------+
3 rows in set (0.00 sec)

-----------------------------------------------------------------------------------------------------------------------------------------------------
//UC4 editing the existing contact by their firstname

mysql> update Addressbook set lastname='Sg' where firstname='Nagaraj';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from AddressBook;
+-----------+----------+---------+--------------+-----------+--------+-------------+------------------------+
| firstname | lastname | address | city         | state     | zip    | phonenumber | email                  |
+-----------+----------+---------+--------------+-----------+--------+-------------+------------------------+
| nagaraj   | Sg       | koppal  | koppal       | karnataka | 583231 |  8660768341 | nagarajasg09@gmail.com |
| shrikanth | hg       | kustagi | koppal       | karnataka | 583131 |  8861462305 | srik78@gmail.com       |
| bharath   | pg       | hospet  | vijayanagara | karnataka | 583234 |   886359546 | bharathkh88@gmail.com  |
+-----------+----------+---------+--------------+-----------+--------+-------------+------------------------+
3 rows in set (0.00 sec)

-----------------------------------------------------------------------------------------------------------------------------------------------------
UC5 -deleting the contact by their lastname
mysql> delete from Addressbook where lastname='hg';
Query OK, 1 row affected (0.00 sec)

mysql> select * from AddressBook;
+-----------+----------+---------+--------------+-----------+--------+-------------+------------------------+
| firstname | lastname | address | city         | state     | zip    | phonenumber | email                  |
+-----------+----------+---------+--------------+-----------+--------+-------------+------------------------+
| nagaraj   | Sg       | koppal  | koppal       | karnataka | 583231 |  8660768341 | nagarajasg09@gmail.com |
| bharath   | pg       | hospet  | vijayanagara | karnataka | 583234 |   886359546 | bharathkh88@gmail.com  |
+-----------+----------+---------+--------------+-----------+--------+-------------+------------------------+
2 rows in set (0.00 sec)

-------------------------------------------------------------------------------------------------------------------------------------------------------
// UC6 retrieving the contact by city or state
mysql> select * from Addressbook where city='vijayanagara' or state='karnataka';
+-----------+----------+---------+--------------+-----------+--------+-------------+------------------------+
| firstname | lastname | address | city         | state     | zip    | phonenumber | email                  |
+-----------+----------+---------+--------------+-----------+--------+-------------+------------------------+
| nagaraj   | Sg       | koppal  | koppal       | karnataka | 583231 |  8660768341 | nagarajasg09@gmail.com |
| bharath   | pg       | hospet  | vijayanagara | karnataka | 583234 |   886359546 | bharathkh88@gmail.com  |
+-----------+----------+---------+--------------+-----------+--------+-------------+------------------------+
2 rows in set (0.00 sec)
-----------------------------------------------------------------------------------------------------------------------------------------------------------
// UC7 size of addressbook by city and state
mysql> select count(firstname) from Addressbook where city='vijayanagara';
+------------------+
| count(firstname) |
+------------------+
|                1 |
+------------------+
1 row in set (0.00 sec)
mysql> select count(firstname) from Addressbook where state='karnataka';
+------------------+
| count(firstname) |
+------------------+
|                2 |
+------------------+
1 row in set (0.00 sec)

-----------------------------------------------------------------------------------------------------------------------------------------------------------
// UC8 sorting the name alphbetically for given city

mysql> select firstname,city from Addressbook order by city;
+-----------+--------------+
| firstname | city         |
+-----------+--------------+
| nagaraj   | koppal       |
| bharath   | vijayanagara |
+-----------+--------------+
2 rows in set (0.00 sec)
-----------------------------------------------------------------------------------------------------------------------------------------------------------
// UC9- altering the table with addressbook name and contact type

mysql> alter table Addressbook add bookname varchar(50) not null,add contacttype varchar(50) not null;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc Addressbook;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| firstname   | varchar(50)  | NO   |     | NULL    |       |
| lastname    | varchar(50)  | NO   |     | NULL    |       |
| address     | varchar(100) | NO   |     | NULL    |       |
| city        | varchar(50)  | NO   |     | NULL    |       |
| state       | varchar(50)  | NO   |     | NULL    |       |
| zip         | int          | NO   |     | NULL    |       |
| phonenumber | double       | NO   |     | NULL    |       |
| email       | varchar(100) | NO   |     | NULL    |       |
| bookname    | varchar(50)  | NO   |     | NULL    |       |
| contacttype | varchar(50)  | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
10 rows in set (0.00 sec)
mysql> update Addressbook set bookname ='abcd',contacttype='friend' where lastname='Sg';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from Addressbook;
+-----------+----------+---------+--------------+-----------+--------+-------------+------------------------+----------+-------------+
| firstname | lastname | address | city         | state     | zip    | phonenumber | email                  | bookname | contacttype |
+-----------+----------+---------+--------------+-----------+--------+-------------+------------------------+----------+-------------+
| nagaraj   | Sg       | koppal  | koppal       | karnataka | 583231 |  8660768341 | nagarajasg09@gmail.com | abcd     | friend      |
| bharath   | pg       | hospet  | vijayanagara | karnataka | 583234 |   886359546 | bharathkh88@gmail.com  |          |             |
+-----------+----------+---------+--------------+-----------+--------+-------------+------------------------+----------+-------------+
2 rows in set (0.00 sec)

mysql> select * from Addressbook where contacttype='friend';
+-----------+----------+---------+--------+-----------+--------+-------------+------------------------+----------+-------------+
| firstname | lastname | address | city   | state     | zip    | phonenumber | email                  | bookname | contacttype |
+-----------+----------+---------+--------+-----------+--------+-------------+------------------------+----------+-------------+
| nagaraj   | Sg       | koppal  | koppal | karnataka | 583231 |  8660768341 | nagarajasg09@gmail.com | abcd     | friend      |
+-----------+----------+---------+--------+-----------+--------+-------------+------------------------+----------+-------------+
1 row in set (0.00 sec)
---------------------------------------------------------------------------------------------------------------------------------------------------------
//UC10 ability to get count of contacts by contactty

mysql> select count(firstname) from Addressbook where contacttype='friend';
+------------------+
| count(firstname) |
+------------------+
|                1 |
+------------------+
1 row in set (0.00 sec)


--------------------------------------------------------------------------------------------------------------------------------------------------------
//UC11 ability to add person to friend and family

mysql> update Addressbook set bookname ='abcd',contacttype='family' where lastname='sg';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update Addressbook set bookname ='abcd',contacttype='family' where lastname='pg';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from Addressbook;
+-----------+----------+---------+--------------+-----------+--------+-------------+------------------------+----------+-------------+
| firstname | lastname | address | city         | state     | zip    | phonenumber | email                  | bookname | contacttype |
+-----------+----------+---------+--------------+-----------+--------+-------------+------------------------+----------+-------------+
| nagaraj   | Sg       | koppal  | koppal       | karnataka | 583231 |  8660768341 | nagarajasg09@gmail.com | abcd     | family      |
| bharath   | pg       | hospet  | vijayanagara | karnataka | 583234 |   886359546 | bharathkh88@gmail.com  | abcd     | family      |
+-----------+----------+---------+--------------+-----------+--------+-------------+------------------------+----------+-------------+
2 rows in set (0.00 sec)