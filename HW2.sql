DROP TABLES IF EXISTS Authors,Publishers,Titles,Title_Authors,Royalties;

CREATE TABLE Authors
  (
  au_id    CHAR(3)     NOT NULL,
  au_fname VARCHAR(15) NOT NULL,
  au_lname VARCHAR(15) NOT NULL,
  phone    VARCHAR(12)         ,
  address  VARCHAR(20)         ,
  city     VARCHAR(15)         ,
  state    CHAR(2)             ,
  zip      CHAR(5)             ,
  CONSTRAINT pk_Authors PRIMARY KEY (au_id)
  );

CREATE TABLE Publishers
  (
  pub_id   CHAR(3)     NOT NULL,
  pub_name VARCHAR(20) NOT NULL,
  city     VARCHAR(15) NOT NULL,
  state    CHAR(2)             ,
  country  VARCHAR(15) NOT NULL,
  CONSTRAINT pk_Publishers PRIMARY KEY (pub_id)
  );

CREATE TABLE Titles
  (
  title_id   CHAR(3)      NOT NULL,
  title_name VARCHAR(40)  NOT NULL,
  type       VARCHAR(10)          ,
  pub_id     CHAR(3)       NOT NULL,
  pages      INTEGER              ,
  price      DECIMAL(5,2)         ,
  sales      INTEGER              ,
  pubdate    DATE                 ,
  contract   SMALLINT     NOT NULL,
  CONSTRAINT pk_Titles PRIMARY KEY (title_id)
  );

CREATE TABLE Title_Authors
  (
  title_id      CHAR(3)      NOT NULL,
  au_id         CHAR(3)      NOT NULL,
  au_order      SMALLINT     NOT NULL,
  royalty_share DECIMAL(5,2) NOT NULL,
  CONSTRAINT pk_Title_Authors PRIMARY KEY (title_id, au_id)
  );

CREATE TABLE Royalties
  (
  title_id     CHAR(3)      NOT NULL,
  advance      DECIMAL(9,2)         ,
  royalty_rate DECIMAL(5,2)         ,
  CONSTRAINT pk_Royalties PRIMARY KEY (title_id)
  );

INSERT INTO Authors VALUES('A01','Sarah','Buchman','718-496-7223',
  '75 West 205 St','Bronx','NY','10468');
INSERT INTO Authors VALUES('A02','Wendy','Heydemark','303-986-7020',
  '2922 Baseline Rd','Boulder','CO','80303');
INSERT INTO Authors VALUES('A03','Hallie','Hull','415-549-4278',
  '3800 Waldo Ave, #14F','San Francisco','CA','94123');
INSERT INTO Authors VALUES('A04','Klee','Hull','415-549-4278',
  '3800 Waldo Ave, #14F','San Francisco','CA','94123');
INSERT INTO Authors VALUES('A05','Christian','Kells','212-771-4680',
  '114 Horatio St','New York','NY','10014');
INSERT INTO Authors VALUES('A06','','Kellsey','650-836-7128',
  '390 Serra Mall','Palo Alto','CA','94305');
INSERT INTO Authors VALUES('A07','Paddy','O''Furniture','941-925-0752',
  '1442 Main St','Sarasota','FL','34236');


INSERT INTO Publishers VALUES('P01','Abatis Publishers','New York','NY','USA');
INSERT INTO Publishers VALUES('P02','Core Dump Books','San Francisco','CA','USA');
INSERT INTO Publishers VALUES('P03','Schadenfreude Press','Hamburg',NULL,'Germany');
INSERT INTO Publishers VALUES('P04','Tenterhooks Press','Berkeley','CA','USA');
INSERT INTO Publishers VALUES('P05','PTR Press','Los Angeles','CA','USA');



INSERT INTO Titles VALUES('T01','1977!','history','P01',
  107,21.99,566,'2000-08-01',1);
-- INSERT INTO Titles VALUES('T02','200 Years of German Humor','computer','P03',
-- 14,50.95,9566,'1998-04-01',1);

INSERT INTO Titles VALUES('T02','200 Years of German Humor','history','P03',
 14,19.95,9566,'1998-04-01',1);
INSERT INTO Titles VALUES('T03','Ask Your System Administrator','computer','P02',
  1226,39.95,25667,'2000-09-01',1);
INSERT INTO Titles VALUES('T04','But I Did It Unconsciously','psychology','P04',
  510,12.99,13001,'1999-05-31',1);
INSERT INTO Titles VALUES('T05','Exchange of Platitudes','psychology','P04',
  201,6.95,201440,'2001-01-01',1);
INSERT INTO Titles VALUES('T06','How About Never?','biography','P01',
  473,19.95,11320,'2000-07-31',1);
INSERT INTO Titles VALUES('T07','I Blame My Mother','biography','P03',
  333,23.95,1500200,'1999-10-01',1);
INSERT INTO Titles VALUES('T08','Just Wait Until After School','children','P04',
  86,10.00,4095,'2001-06-01',1);
INSERT INTO Titles VALUES('T09','Kiss My Boo-Boo','children','P04',
  22,13.95,5000,'2002-05-31',1);
INSERT INTO Titles VALUES('T10','Not Without My Faberge Egg','biography','P01',
  NULL,NULL,NULL,NULL,0);
INSERT INTO Titles VALUES('T11','Perhaps It''s a Glandular Problem','psychology','P04',
  826,7.99,94123,'2000-11-30',1);
INSERT INTO Titles VALUES('T12','Spontaneous, Not Annoying','biography','P01',
  507,12.99,100001,'2000-08-31',1);
INSERT INTO Titles VALUES('T13','What Are The Civilian Applications?','history','P03',
  802,29.99,10467,'1999-05-31',1);


INSERT INTO Title_Authors VALUES('T01','A01',1,1.0);
INSERT INTO Title_Authors VALUES('T02','A01',1,1.0);
INSERT INTO Title_Authors VALUES('T03','A05',1,1.0);
INSERT INTO Title_Authors VALUES('T04','A03',1,0.6);
INSERT INTO Title_Authors VALUES('T04','A04',2,0.4);
INSERT INTO Title_Authors VALUES('T05','A04',1,1.0);
INSERT INTO Title_Authors VALUES('T06','A02',1,1.0);
INSERT INTO Title_Authors VALUES('T07','A02',1,0.5);
INSERT INTO Title_Authors VALUES('T07','A04',2,0.5);
INSERT INTO Title_Authors VALUES('T08','A06',1,1.0);
INSERT INTO Title_Authors VALUES('T09','A06',1,1.0);
INSERT INTO Title_Authors VALUES('T10','A02',1,1.0);
INSERT INTO Title_Authors VALUES('T11','A03',2,0.3);
INSERT INTO Title_Authors VALUES('T11','A04',3,0.3);
INSERT INTO Title_Authors VALUES('T11','A06',1,0.4);
INSERT INTO Title_Authors VALUES('T12','A02',1,1.0);
INSERT INTO Title_Authors VALUES('T13','A01',1,1.0);

INSERT INTO Royalties VALUES('T01',10000,0.05);
INSERT INTO Royalties VALUES('T02',1000,0.06);
INSERT INTO Royalties VALUES('T03',15000,0.07);
INSERT INTO Royalties VALUES('T04',20000,0.08);
INSERT INTO Royalties VALUES('T05',100000,0.09);
INSERT INTO Royalties VALUES('T06',20000,0.08);
INSERT INTO Royalties VALUES('T07',1000000,0.11);
INSERT INTO Royalties VALUES('T08',0,0.04);
INSERT INTO Royalties VALUES('T09',0,0.05);
INSERT INTO Royalties VALUES('T10',NULL,NULL);
INSERT INTO Royalties VALUES('T11',100000,0.07);
INSERT INTO Royalties VALUES('T12',50000,0.09);
INSERT INTO Royalties VALUES('T13',20000,0.06);



show tables;

-- After creating the table as above you have to execute the following queries for homework 2.
-- 1)	List the title_name and book type of the books that are published earlier than all biography books
select   title_name, type from Titles where pubdate < (select min(pubdate) from Titles where type = 'biography');

-- 2)	List the title_name and book type of the books published by 'Abatis Publishers'
select   title_name, type from Titles where pub_id = (select pub_id from Publishers where pub_name = 'Abatis Publishers' );

-- 3)	Find the name(s) of the publisher(s) that have not published any book
select pub_name from Publishers where pub_id != all (select pub_id  from Titles);

-- 4)	Find the name(s) of the publisher(s) who have published the computer book.
select pub_name from Publishers where pub_id = (select pub_id from Titles where type
= (select type from Titles where type = 'computer'));

-- 5)	Find the name(s) of the author(s) that have authored more than one books.
select distinct concat(au_fname, ' ', au_lname) from Authors 
left join Title_Authors on Authors.au_id = Title_Authors.au_id where Title_Authors.au_order > 1; 

-- 6)	Find the name(s) of the publisher(s) who published the least expensive book.
select pub_name from Publishers where pub_id = (select pub_id from Titles where price = (select min(price) from Titles) );

-- 7)	Find the name(s) of the author(s) who wrote the book with the greatest number of pages.
-- select  au_fname,   au_lname from Authors where
select  Authors.au_fname,   Authors.au_lname
from Authors where Authors.au_id= (select au_id from Title_Authors
where title_id = (select title_id from Titles where pages = (select max(pages) from Titles)));

-- 8)	Report the names of all authors and the title_name of the books (if any) they have authored.
select  Authors.au_fname,   Authors.au_lname, Titles.title_name
from Title_Authors right join Authors on Title_Authors .au_id  = Authors.au_id
left join Titles on Titles.title_id  =  Title_Authors.title_id;

-- 9)	Find the name of the publishers who have not published any book. (use outer join)
select Publishers.pub_name from Titles
 right outer join Publishers on Titles.pub_id  =  Publishers.pub_id where Titles.pub_id is null;

-- 10)	For each book title, list the title_name, the publisher's name and the author's name
select  Authors.au_fname,   Authors.au_lname, Titles.title_name, Publishers.pub_name
from Title_Authors right join Authors on Title_Authors .au_id  = Authors.au_id
left join Titles on Titles.title_id  =  Title_Authors.title_id
left join Publishers on Titles.pub_id  =  Publishers.pub_id where title_name IS NOT null;

-- 11)	Find the name of publisher that published the book with the greatest royalty rate
select pub_name from Publishers where pub_id = 
(select pub_id from Titles where title_id =(select title_id from Royalties where royalty_rate =
(select max(royalty_rate) from Royalties) ));

-- 12)	Find the title name of the most expensive computer book, the name of its author and the publisher's name.
select title_name, pub_name, concat(au_fname, ' ', au_lname) 
from Titles left join Title_Authors on Titles.title_id = Title_Authors.title_id 
left join Authors on Title_Authors.au_id = Authors.au_id 
left join Publishers on Titles.pub_id = Publishers.pub_id where price = 
(select max(price) from Titles where type = all(select type from Titles where type = 'computer') );

-- 13)	List the books published in the last 16 years. Note that your query should remain correct in the future, 
-- which means the number 2000 AND 2016 should not appear anywhere in the query.
SELECT  title_name
FROM    Titles
WHERE   pubdate BETWEEN NOW() - INTERVAL 16 YEAR AND NOW();

-- 14)	List the author names in the form {first initial}{period}{space}{last name}, e.g. K. Hull.
--  Order the results first by last name, then by first name. Only list those authors who have both a first name and a last name in the database.
select  concat(SUBSTRING(au_fname, 1, 1), '. ' , au_lname) from Authors where au_fname != ' ' and au_lname != ' ';

-- 15)	List the following information of all authors: the first name, the position of the first occurrence of 'e' within the first name, the last name, the position of the first occurrence of 'ma' within the last name. Use proper column names.
select au_fname AS 'Authors First Name', LOCATE('e', au_fname) AS 'First e in first name', 
au_lname AS 'Authors Last Name', LOCATE('ma', au_lname) As 'First ma in Last Name' from Authors;

-- 16)	List the name(s) of the publisher(s) that published the book with the shortest title name.
select pub_name from Publishers where pub_id
= (select pub_id from Titles where length(title_name) = 
( select min(length(title_name)) from Titles )); 


-- 17)	For each author, list the author id, area code, and the phone number without the area code.
select  au_id As 'Author Id', SUBSTRING(phone, 1, 4) AS 'Area Code', SUBSTRING(phone, 5, 8) As 'Remaing phone number' from Authors;

