\\1 create and drop
mysql> CREATE DATABASE library;
Query OK, 1 row affected (0.00 sec)



mysql> drop database library;
Query OK, 0 rows affected (0.07 sec)
output

mysql> show databases;
+--------------------+
| Database           |
+--------------------+     
| library            |
| movie              |
| mysql              |
| performance_schema |
| record             |
| std                |
| student            |
| students           |
| sys                |
+--------------------+
25 rows in set (0.00 sec)

mysql> use library;
Database changed
\\2 create table
quries

mysql> CREATE TABLE book (book_id int(10),title varchar(20), language_id int(10), mrp bigint(10), published_id int(10), published_date date, volume int(10), status varchar(10),PRIMARY KEY (book_id));
Query OK, 0 rows affected (0.28 sec)


mysql> CREATE TABLE author (author_id int(10) primary key,name varchar(20),email varchar(20),phono int(20),status varchar(20)); 
Query OK, 0 rows affected (0.29 sec)

mysql> CREATE TABLE book_author (book_id int(10),author_id int(10),CONSTRAINT COMP_NAME PRIMARY KEY (book_id,author_id));
Query OK, 0 rows affected (0.27 sec)

mysql> CREATE TABLE publisher (publisher_id int(10) primary key,name varchar(20),address varchar(10));
Query OK, 0 rows affected (0.29 sec)


mysql> CREATE TABLE member(member_id int(10) primary key,name varchar(20),branch_code int(10),roll_no int(10),email varchar(20),date_of_join date,status varchar(20));
Query OK, 0 rows affected (0.27 sec)

mysql> CREATE TABLE book_issue (issue_id int(10) primary key,date_of_join date,book_id int(20),member_id int(20),expected_date_of_return date);
Query OK, 0 rows affected (0.28 sec)

mysql> CREATE TABLE book_return (issue_id int(10) primary key,actual_date_of_return date ,tae_days date,late_fee int(10));
Query OK, 0 rows affected (0.28 sec)

mysql>  CREATE TABLE language (lang_id int(10) primary key,name varchar(20));
Query OK, 0 rows affected (0.27 sec)

mysql>  CREATE TABLE late_fee_rule (from_days int(10),to_days int,amount int(10),CONSTRAINT COMP1_NAME PRIMARY KEY (from_days,to_days,amount));
Query OK, 0 rows affected (0.29 sec)

mysql> ALTER TABLE book ADD CONSTRAINT c1 FOREIGN KEY(published_id) REFERENCES publisher(publisher_id);
Query OK, 0 rows affected (0.80 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE book ADD CONSTRAINT c2 FOREIGN KEY(language_id) REFERENCES language(lang_id); 
Query OK, 0 rows affected (0.89 sec)
Records: 0  Duplicates: 0  Warnings: 0

output
mysql> desc book
    -> ;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| book_id        | int(10)     | NO   | PRI | NULL    |       |
| title          | varchar(20) | YES  |     | NULL    |       |
| language_id    | int(10)     | YES  | MUL | NULL    |       |
| mrp            | bigint(10)  | YES  |     | NULL    |       |
| published_id   | int(10)     | YES  | MUL | NULL    |       |
| published_date | date        | YES  |     | NULL    |       |
| volume         | int(10)     | YES  |     | NULL    |       |
| status         | varchar(10) | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> desc author;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| author_id | int(10)     | NO   | PRI | NULL    |       |
| name      | varchar(20) | YES  |     | NULL    |       |
| email     | varchar(20) | YES  |     | NULL    |       |
| phono     | int(20)     | YES  |     | NULL    |       |
| status    | varchar(20) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> desc book_author;
+-----------+---------+------+-----+---------+-------+
| Field     | Type    | Null | Key | Default | Extra |
+-----------+---------+------+-----+---------+-------+
| book_id   | int(10) | NO   | PRI | NULL    |       |
| author_id | int(10) | NO   | PRI | NULL    |       |
+-----------+---------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> desc publisher;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| publisher_id | int(10)     | NO   | PRI | NULL    |       |
| name         | varchar(20) | YES  |     | NULL    |       |
| address      | varchar(10) | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> desc member;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| member_id    | int(10)     | NO   | PRI | NULL    |       |
| name         | varchar(20) | YES  |     | NULL    |       |
| branch_code  | int(10)     | YES  |     | NULL    |       |
| roll_no      | int(10)     | YES  |     | NULL    |       |
| email        | varchar(20) | YES  |     | NULL    |       |
| date_of_join | date        | YES  |     | NULL    |       |
| status       | varchar(20) | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> desc book_issue
    -> ;
+-------------------------+---------+------+-----+---------+-------+
| Field                   | Type    | Null | Key | Default | Extra |
+-------------------------+---------+------+-----+---------+-------+
| issue_id                | int(10) | NO   | PRI | NULL    |       |
| date_of_join            | date    | YES  |     | NULL    |       |
| book_id                 | int(20) | YES  | MUL | NULL    |       |
| member_id               | int(20) | YES  | MUL | NULL    |       |
| expected_date_of_return | date    | YES  |     | NULL    |       |
+-------------------------+---------+------+-----+---------+-------+
5 rows in set (0.00 sec)
mysql> desc book_issue
    -> ;
+-------------------------+---------+------+-----+---------+-------+
| Field                   | Type    | Null | Key | Default | Extra |
+-------------------------+---------+------+-----+---------+-------+
| issue_id                | int(10) | NO   | PRI | NULL    |       |
| date_of_join            | date    | YES  |     | NULL    |       |
| book_id                 | int(20) | YES  | MUL | NULL    |       |
| member_id               | int(20) | YES  | MUL | NULL    |       |
| expected_date_of_return | date    | YES  |     | NULL    |       |
+-------------------------+---------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> desc book_issue
    -> ;
+-------------------------+---------+------+-----+---------+-------+
| Field                   | Type    | Null | Key | Default | Extra |
+-------------------------+---------+------+-----+---------+-------+
| issue_id                | int(10) | NO   | PRI | NULL    |       |
| date_of_join            | date    | YES  |     | NULL    |       |
| book_id                 | int(20) | YES  | MUL | NULL    |       |
| member_id               | int(20) | YES  | MUL | NULL    |       |
| expected_date_of_return | date    | YES  |     | NULL    |       |
+-------------------------+---------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> desc late_fee_rule;
+-----------+---------+------+-----+---------+-------+
| Field     | Type    | Null | Key | Default | Extra |
+-----------+---------+------+-----+---------+-------+
| from_days | int(10) | NO   | PRI | NULL    |       |
| to_days   | int(11) | NO   | PRI | NULL    |       |
| amount    | int(10) | NO   | PRI | NULL    |       |
+-----------+---------+------+-----+---------+-------+
3 rows in set (0.00 sec)






//3 droping table with foregin key
queris
mysql> DROP TABLE language;
ERROR 1217 (23000): Cannot delete or update a parent row: a foreign key constraint fails

//3 droping table without foregin key
mysql> DROP table book;                                                                                           
Query OK, 0 rows affected (0.16 sec)



//4 alter command without data
mysql> ALTER TABLE book ADD pageno int(20);
Query OK, 0 rows affected (0.58 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc book;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| book_id        | int(10)     | NO   | PRI | NULL    |       |
| title          | varchar(20) | YES  |     | NULL    |       |
| language_id    | int(10)     | YES  | MUL | NULL    |       |
| mrp            | bigint(10)  | YES  |     | NULL    |       |
| published_id   | int(10)     | YES  | MUL | NULL    |       |
| published_date | date        | YES  |     | NULL    |       |
| volume         | int(10)     | YES  |     | NULL    |       |
| status         | varchar(10) | YES  |     | NULL    |       |
| pageno         | int(20)     | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
9 rows in set (0.00 sec)

mysql> ALTER TABLE book drop column pageno;
Query OK, 0 rows affected (0.61 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc book;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| book_id        | int(10)     | NO   | PRI | NULL    |       |
| title          | varchar(20) | YES  |     | NULL    |       |
| language_id    | int(10)     | YES  | MUL | NULL    |       |
| mrp            | bigint(10)  | YES  |     | NULL    |       |
| published_id   | int(10)     | YES  | MUL | NULL    |       |
| published_date | date        | YES  |     | NULL    |       |
| volume         | int(10)     | YES  |     | NULL    |       |
| status         | varchar(10) | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)


\\4 alter command with data

mysql> ALTER TABLE language ADD pageno int(20);
Query OK, 0 rows affected (0.72 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> desc language;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| lang_id | int(10)     | NO   | PRI | NULL    |       |
| name    | varchar(20) | YES  |     | NULL    |       |
| pageno  | int(20)     | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> select * from language
    -> ;
+---------+--------+--------+
| lang_id | name   | pageno |
+---------+--------+--------+
|       1 | nibin  |   NULL |
|       2 | ashwin |   NULL |
+---------+--------+--------+
2 rows in set (0.00 sec)

mysql> insert into language values(3,'bibin',22);
Query OK, 1 row affected (0.04 sec)

mysql> select * from language
    -> ;
+---------+--------+--------+
| lang_id | name   | pageno |
+---------+--------+--------+
|       1 | nibin  |   NULL |
|       2 | ashwin |   NULL |
|       3 | bibin  |     22 |
+---------+--------+--------+
3 rows in set (0.00 sec)

mysql> ALTER TABLE language drop column pageno;
Query OK, 0 rows affected (0.66 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from language
    -> ;
+--------4 alter command without data-+--------+
| lang_id | name   |
+---------+--------+
|       1 | nibin  |
|       2 | ashwin |
|       3 | bibin  |
+---------+--------+
3 rows in set (0.00 sec)

mysql> 

\\5 create and exec index
query
mysql> CREATE INDEX inbook ON  book_issue(member_id,book_id);
Query OK, 0 rows affected (0.34 sec)
Records: 0  Duplicates: 0  Warnings: 0
output
mysql> show index from book_issue
    -> ;
+------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table      | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| book_issue |          0 | PRIMARY  |            1 | issue_id    | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| book_issue |          1 | c5       |            1 | book_id     | A         |           0 |     NULL | NULL   | YES  | BTREE      |         |               |
| book_issue |          1 | inbook   |            1 | member_id   | A         |           0 |     NULL | NULL   | YES  | BTREE      |         |               |
| book_issue |          1 | inbook   |            2 | book_id     | A         |           0 |     NULL | NULL   | YES  | BTREE      |         |               |
+------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
4 rows in set (0.00 sec)

\\6 grant and revoke on table

mysql> GRANT SELECT, INSERT, UPDATE, DELETE ON publisher TO 'nibin'@'localhost';
Query OK, 0 rows affected (0.06 sec)
mysql>REVOKE^CNSERT ON *.* FROM 'nibin'@'localhost';

mysql> grant all on *.* to nibin@localhost with grant option;
Query OK, 0 rows affected (0.09 sec)

OUTPUT:

ERROR 1142 (42000): INSERT command denied to user 'nibin'@'localhost' for table 'book'


\\7 insert data into all tables

mysql> insert into publisher values(3,'nibin','tvl');
Query OK, 1 row affected (0.05 sec)

mysql> insert into member values(1,'m1',1,1,"nibin@gamil.com","2022-05-28","valid");
Query OK, 1 row affected (0.06 sec)

mysql> insert into language values(1,'lang1');
Query OK, 1 row affected (0.07 sec)

mysql> insert into late_fee_rule values(11,15,100);
Query OK, 1 row affected (0.09 sec)

mysql> insert into book_return values(1,"2022-10-28","2022-11-28",150);
Query OK, 1 row affected (0.08 sec)

mysql> insert into book_author values(1,1);
Query OK, 1 row affected (0.05 sec)

mysql> insert into book_issue values(1,"2022-01-23",1,1,"2022-05-24");
Query OK, 1 row affected (0.06 sec)

mysql> insert into author values(1,'nibin','nibin@gmail.com',7999,'avil');
Query OK, 1 row affected (0.06 sec)

mysql> insert into book values(1,'java',1,2999,1,"2022-02-01",1,'avil');
Query OK, 1 row affected (0.09 sec)

output

mysql> SELECT * FROM book;
+---------+-------+-------------+------+--------------+----------------+--------+--------+
| book_id | title | language_id | mrp  | published_id | published_date | volume | status |
+---------+-------+-------------+------+--------------+----------------+--------+--------+
|       1 | java  |           1 | 2999 |            1 | 2022-02-01     |      1 | avil   |
+---------+-------+-------------+------+--------------+----------------+--------+--------+
1 row in set (0.00 sec)

mysql> SELECT * FROM author;
+-----------+-------+-----------------+-------+--------+
| author_id | name  | email           | phono | status |
+-----------+-------+-----------------+-------+--------+
|         1 | nibin | nibin@gmail.com |  7999 | avil   |
+-----------+-------+-----------------+-------+--------+
1 row in set (0.00 sec)

mysql> SELECT * FROM book_author;
+---------+-----------+
| book_id | author_id |
+---------+-----------+
|       1 |         1 |
+---------+-----------+
1 row in set (0.00 sec)

mysql> SELECT * FROM publisher;
+--------------+-------+---------+
| publisher_id | name  | address |
+--------------+-------+---------+
|            1 | nibin | tvl     |
|            2 | nibin | tvl     |
|            3 | nibin | tvl     |
+--------------+-------+---------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM member;
+-----------+------+-------------+---------+-----------------+--------------+--------+
| member_id | name | branch_code | roll_no | email           | date_of_join | status |
+-----------+------+-------------+---------+-----------------+--------------+--------+
|         1 | m1   |           1 |       1 | nibin@gamil.com | 2022-05-28   | valid  |
+-----------+------+-------------+---------+-----------------+--------------+--------+
1 row in set (0.00 sec)

mysql> SELECT * FROM book_issue;
+----------+--------------+---------+-----------+-------------------------+
| issue_id | date_of_join | book_id | member_id | expected_date_of_return |
+----------+--------------+---------+-----------+-------------------------+
|        1 | 2022-01-23   |       1 |         1 | 2022-05-24              |
+----------+--------------+---------+-----------+-------------------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM language;
+---------+-------+
| lang_id | name  |
+---------+-------+
|       1 | lang1 |
+---------+-------+
1 row in set (0.00 sec)

mysql> SELECT * FROM late_fee_rule;
+-----------+---------+--------+
| from_days | to_days | amount |
+-----------+---------+--------+
|        11 |      15 |    100 |
+-----------+---------+--------+
1 row in set (0.00 sec)

\\8 bluk import of data from csv 25 RECORDS

Empty set (0.00 sec)

mysql> LOAD DATA INFILE '///var/lib/mysql-files/book.csv' INTO TABLE book FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;
Query OK, 25 rows affected (0.07 sec)
Records: 25  Deleted: 0  Skipped: 0  Warnings: 0

mysql> SELECT * FROM book;
+---------+--------+-------------+------+--------------+----------------+--------+--------+
| book_id | title  | language_id | mrp  | published_id | published_date | volume | status |
+---------+--------+-------------+------+--------------+----------------+--------+--------+
|       1 | java   |           1 | 2330 |            1 | 2022-06-06     |      1 | avail  |
|       2 | C      |           2 | 2330 |            2 | 2022-06-06     |      2 | avail  |
|       3 | C++    |           3 | 2330 |            3 | 2022-06-06     |      3 | avail  |
|       4 | java   |           4 | 2330 |            4 | 2022-06-06     |      4 | avail  |
|       5 | java   |           5 | 2330 |            5 | 2022-06-06     |      5 | avail  |
|       6 | java   |           6 | 2330 |            6 | 2022-06-06     |      6 | avail  |
|       7 | java   |           7 | 2330 |            7 | 2022-06-06     |      7 | avail  |
|       8 | C      |           8 | 2330 |            8 | 2022-06-06     |      8 | avail  |
|       9 | C      |           9 | 2330 |            9 | 2022-06-06     |      9 | avail  |
|      10 | C      |          10 | 2330 |           10 | 2022-06-06     |     10 | avail  |
|      11 | C      |          11 | 2330 |           11 | 2022-06-06     |     11 | avail  |
|      12 | PYTHON |          12 | 2330 |           12 | 2022-06-06     |     12 | avail  |
|      13 | PYTHON |          13 | 2330 |           13 | 2022-06-06     |     13 | avail  |
|      14 | PYTHON |          14 | 2330 |           14 | 2022-06-06     |     14 | avail  |
|      15 | PYTHON |          15 | 2330 |           15 | 2022-06-06     |     15 | avail  |
|      16 | PYTHON |          16 | 2330 |           16 | 2022-06-06     |     16 | avail  |
|      17 | PYTHON |          17 | 2330 |           17 | 2022-06-06     |     17 | avail  |
|      18 | C++    |          18 | 2330 |           18 | 2022-06-06     |     18 | avail  |
|      19 | C++    |          19 | 2330 |           19 | 2022-06-06     |     19 | avail  |
|      20 | C++    |          20 | 2330 |           20 | 2022-06-06     |     20 | avail  |
|      21 | C++    |          21 | 2330 |           21 | 2022-06-06     |     21 | avail  |
|      22 | OS     |          22 | 2330 |           22 | 2022-06-06     |     22 | avail  |
|      23 | OS     |          23 | 2330 |           23 | 2022-06-06     |     23 | avail  |
|      24 | OS     |          24 | 2330 |           24 | 2022-06-06     |     24 | avail  |
|      25 | OS     |          25 | 2330 |           25 | 2022-06-06     |     25 | avail  |
+---------+--------+-------------+------+--------------+----------------+--------+--------+
25 rows in set (0.00 sec)

\\9 A) BULK UPADTE OR DELETE

mysql> update book  set status = (CASE book_id WHEN 1 THEN 'not_avil'  when 2 THEN 'not_avil' when 3 THEN 'not_avil' when 4 THEN 'not_avil'when 5 THEN 'not_avil'    END)  Where book_id IN(1,2,3,4,5);
Query OK, 5 rows affected (0.12 sec)
Rows matched: 5  Changed: 5  Warnings: 0

mysql> SELECT * FROM book;
+---------+--------+-------------+------+--------------+----------------+--------+----------+
| book_id | title  | language_id | mrp  | published_id | published_date | volume | status   |
+---------+--------+-------------+------+--------------+----------------+--------+----------+
|       1 | java   |           1 | 2330 |            1 | 2022-06-06     |      1 | not_avil |
|       2 | C      |           2 | 2330 |            2 | 2022-06-06     |      2 | not_avil |
|       3 | C++    |           3 | 2330 |            3 | 2022-06-06     |      3 | not_avil |
|       4 | java   |           4 | 2330 |            4 | 2022-06-06     |      4 | not_avil |
|       5 | java   |           5 | 2330 |            5 | 2022-06-06     |      5 | not_avil |
|       6 | java   |           6 | 2330 |            6 | 2022-06-06     |      6 | avail    |
|       7 | java   |           7 | 2330 |            7 | 2022-06-06     |      7 | avail    |
|       8 | C      |           8 | 2330 |            8 | 2022-06-06     |      8 | avail    |
|       9 | C      |           9 | 2330 |            9 | 2022-06-06     |      9 | avail    |
|      10 | C      |          10 | 2330 |           10 | 2022-06-06     |     10 | avail    |
|      11 | C      |          11 | 2330 |           11 | 2022-06-06     |     11 | avail    |
|      12 | PYTHON |          12 | 2330 |           12 | 2022-06-06     |     12 | avail    |
|      13 | PYTHON |          13 | 2330 |           13 | 2022-06-06     |     13 | avail    |
|      14 | PYTHON |          14 | 2330 |           14 | 2022-06-06     |     14 | avail    |
|      15 | PYTHON |          15 | 2330 |           15 | 2022-06-06     |     15 | avail    |
|      16 | PYTHON |          16 | 2330 |           16 | 2022-06-06     |     16 | avail    |
|      17 | PYTHON |          17 | 2330 |           17 | 2022-06-06     |     17 | avail    |
|      18 | C++    |          18 | 2330 |           18 | 2022-06-06     |     18 | avail    |
|      19 | C++    |          19 | 2330 |           19 | 2022-06-06     |     19 | avail    |
|      20 | C++    |          20 | 2330 |           20 | 2022-06-06     |     20 | avail    |
|      21 | C++    |          21 | 2330 |           21 | 2022-06-06     |     21 | avail    |
|      22 | OS     |          22 | 2330 |           22 | 2022-06-06     |     22 | avail    |
|      23 | OS     |          23 | 2330 |           23 | 2022-06-06     |     23 | avail    |
|      24 | OS     |          24 | 2330 |           24 | 2022-06-06     |     24 | avail    |
|      25 | OS     |          25 | 2330 |           25 | 2022-06-06     |     25 | avail    |
+---------+--------+-------------+------+--------------+----------------+--------+----------+
25 rows in set (0.00 sec)

mysql> DELETE  FROM book WHERE status = 'not_avil';
Query OK, 5 rows affected (0.07 sec)

mysql> SELECT * FROM book;
+---------+--------+-------------+------+--------------+----------------+--------+--------+
| book_id | title  | language_id | mrp  | published_id | published_date | volume | status |
+---------+--------+-------------+------+--------------+----------------+--------+--------+
|       6 | java   |           6 | 2330 |            6 | 2022-06-06     |      6 | avail  |
|       7 | java   |           7 | 2330 |            7 | 2022-06-06     |      7 | avail  |
|       8 | C      |           8 | 2330 |            8 | 2022-06-06     |      8 | avail  |
|       9 | C      |           9 | 2330 |            9 | 2022-06-06     |      9 | avail  |
|      10 | C      |          10 | 2330 |           10 | 2022-06-06     |     10 | avail  |
|      11 | C      |          11 | 2330 |           11 | 2022-06-06     |     11 | avail  |
|      12 | PYTHON |          12 | 2330 |           12 | 2022-06-06     |     12 | avail  |
|      13 | PYTHON |          13 | 2330 |           13 | 2022-06-06     |     13 | avail  |
|      14 | PYTHON |          14 | 2330 |           14 | 2022-06-06     |     14 | avail  |
|      15 | PYTHON |          15 | 2330 |           15 | 2022-06-06     |     15 | avail  |
|      16 | PYTHON |          16 | 2330 |           16 | 2022-06-06     |     16 | avail  |
|      17 | PYTHON |          17 | 2330 |           17 | 2022-06-06     |     17 | avail  |
|      18 | C++    |          18 | 2330 |           18 | 2022-06-06     |     18 | avail  |
|      19 | C++    |          19 | 2330 |           19 | 2022-06-06     |     19 | avail  |
|      20 | C++    |          20 | 2330 |           20 | 2022-06-06     |     20 | avail  |
|      21 | C++    |          21 | 2330 |           21 | 2022-06-06     |     21 | avail  |
|      22 | OS     |          22 | 2330 |           22 | 2022-06-06     |     22 | avail  |
|      23 | OS     |          23 | 2330 |           23 | 2022-06-06     |     23 | avail  |
|      24 | OS     |          24 | 2330 |           24 | 2022-06-06     |     24 | avail  |
|      25 | OS     |          25 | 2330 |           25 | 2022-06-06     |     25 | avail  |
+---------+--------+-------------+------+--------------+----------------+--------+--------+
20 rows in set (0.00 sec)


\\9 b) update and delete on tables with pk and fk (not complete)

 mysql> UPDATE book SET book_id= 99 where book_id=1;
Query OK, 1 row affected (0.07 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE book SET book_id= 98 where book_id=2;
Query OK, 1 row affected (0.09 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE book SET book_id= 97 where book_id=3;
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE book SET language_id = 97 where language_id=3;
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`library`.`book`, CONSTRAINT `c2` FOREIGN KEY (`language_id`) REFERENCES `language` (`lang_id`))

mysql> SELECT * FROM book;
+---------+--------+-------------+------+--------------+----------------+--------+--------+
| book_id | title  | language_id | mrp  | published_id | published_date | volume | status |
+---------+--------+-------------+------+--------------+----------------+--------+--------+
|      97 | python |           3 | 2999 |            3 | 2022-02-01     |      3 | avil   |
|      98 | c      |           2 | 2999 |            2 | 2022-02-01     |      2 | avil   |
|      99 | java   |           1 | 2999 |            1 | 2022-02-01     |      1 | avil   |
+---------+--------+-------------+------+--------------+----------------+--------+--------+
3 rows in set (0.00 sec)
