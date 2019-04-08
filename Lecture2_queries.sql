-- droping existing table
drop table if exists user;
drop table if exists sell;
drop table if exists items;
drop table if exists purchase;

-- creating new table user
create table user(
id integer primary key auto_increment,
username varchar(255),
role varchar(255),
department varchar(255)
);

-- creating new table sell
create table sell(
id integer primary key,
name varchar(255),
amount int,
date_sold date
);
 -- creating new table items
create table items(
id integer primary key,
name varchar(255),
instock bool
);

create table purchase(
id int primary key auto_increment,
name varchar(255),
purchase_date date,
quantity int
);

-- different ways of inserting values into the table
insert into user (id,username,role,department) VALUES (1,'vivek','employee','finance');
insert into user  VALUES (3,'vivek','employee','finance');
insert into user  VALUES (5,'viv','employee','finance');
insert into user(username,role,department) VALUES ('harry','supervisor','finance');

insert into purchase values(1,'item1','1-1-18',10);
insert into purchase values(2,'item2','19-1-18',20);
insert into purchase values(3,'item1','11-1-18',15);
insert into purchase values(4,'item3','21-1-18',20);
insert into purchase values(5,'item2','18-1-18',5);


-- basic selection queries
select * from user;

-- select particular column from table
select username from user;
select username,role from user;

-- removing duplicate values from table
SELECT DISTINCT username FROM user;

-- select queries  where condition
select * from user where username= 'vivek';

select DISTINCT role from user where username = 'vivek';

 -- insert into sell table 
insert into sell (id,name,amount,date_sold) VALUES (1,'item1',100,'17-1-18');
insert into sell (id,name,amount,date_sold) VALUES (2,'item2',100,'9-2-18');
insert into sell (id,name,amount,date_sold) VALUES (3,'item1',200,'10-1-18');
insert into sell (id,name,amount,date_sold) VALUES (4,'item1',150,'13-1-18');
insert into sell values(5,'item1',125,'17-1-18');
insert into sell values(7,'item4',50,'13-2-18');

select * from sell;
select name,amount/10 from sell;

-- relational operators
select * from sell where amount >100;
select * from sell where amount >=100;
select * from sell where amount <=100;
select * from sell where amount <200;
select * from sell where amount =100;
select * from sell where amount !=100;
select * from sell where amount <200 and amount >100;

-- insert into items table
insert into items (id,name,instock) values (1,'item1',true);

select * from items;
select * from items where instock = true;

-- alias names are used for making colums names shorter in selection queries
select username as u from user;

-- wild card entries
select * from user where username like '%v';
select * from user where username like 'v%';
select * from user where username like 'v%v';
select * from user where username like 'v__v';

-- between
select * from sell where amount between 100 and 200;
select * from sell where  amount >=100 and amount <=200;

-- not
select * from user where not (username = 'viv');
select * from user where department  IS NOT NULL;

-- in
select * from user where username not IN ('vivek','harry');