Drop table if exists Authors;
Drop table if exists Publishers;
Drop table if exists Titles;
Drop table if exists Tile;
Drop table if exists Authors;
Drop table if exists Royalties;
Drop table if exists title_authors;

Create table Authors (
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
	  pub_id     CHAR(3)      NOT NULL,
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
   
   -- 1.
   -- i List all the information in the table.
 select * from Publishers ;
 -- ii List the name of all the publishers in the table.
  select pub_name from Publishers;
  -- iii List the all the information of publishers that are in California.
 select * from Publishers where state = 'CA';
 -- 2.
 -- i List all the titles whose type is history.
  select * from Titles where type = 'history';
  -- ii List the title name, sales and publication date of all the titles whose pub_id is 'P01'.
    select   title_name, sales, pubdate from Titles where pub_id = 'P01';
    
        
    -- 3.
    -- i List the title id and title name of all books whose type are psychology and are at least 300 pages long.
     select title_id, title_name, pages from Titles where type = 'psychology' and pages >= 300;
    -- ii List the title name of all books with 'my' anywhere in the title name.
    select  title_name from Titles where title_name like '%my%';
    -- iii List the name of all history books that are published in 1999
         select  title_name from Titles where type = 'history' and pubdate like '1999%';
         -- iv List the first name, last name and zip code of all authors whose second leftmost digit of zip code is '4'.
         select au_fname, au_lname, zip from Authors where zip like '_4%';
         
         -- 4
         -- a List the number of books, the minimum price, maximum price and    the average sales of history books
          select count(*) as 'Number', min(price) as 'Min Price', max(price) as 'Max Price', avg(sales) as 'Average Sale'  from Titles where type = 'history' ;
         -- b List the number of books and the average number of pages published by pub_id P01
         select count(*), avg(pages) from Titles where pub_id = 'P01';
         -- c List the number of books and the total sales of the books with price greater than $15
               select count(*), sum(sales) from Titles where price > 15;
         
         
     

    
    
  
  
  
 
 
 
