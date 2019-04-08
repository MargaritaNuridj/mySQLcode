show tables;

drop table if exists AudioFiles;

describe items;

-- entity relation

-- Aggregation (sum, Avg,Count, Min, Max)

select * from sell;
select * from user;
select sum(amount) from sell where amount =100;

select avg(amount) from sell;
select avg(amount) as average from sell;

select count(*) from user;

select min(amount) from sell;
select min(role) from user;

select max(role) from user;

-- group by 
select count(*),name from sell group by name;

select count(*),name from sell where date_sold >='1-1-18' and date_sold <='10-1-18' group by name ;
select count(*),name from sell where date_sold >='1-1-18' and date_sold <='18-1-18' group by name ;


-- HAVING clause

-- HAVING clause is like WHERE but with a few differences:
-- WHERE restricts results prior to aggregate calculations based on individual row values
-- HAVING restricts results based on aggregated values
-- HAVING always uses an aggregate function as its test
-- drop table if exists sell;

select * from sell;
select count(name),name,sum(amount) as a from sell group by name having a> 100;
select count(*),name from purchase group by name;

-- insert into items values(2,'item2',true);
-- insert into items values(3,'item3',true);
-- insert into items values(4,'item4',true);
-- insert into items values(5,'item5',true);

-- subquries
 -- getting second highest amount from sell table
select max(amount) from sell where amount != (select max(amount) from sell) ;

-- The ANY operator returns true if any of the subquery values meet the condition.

-- The ALL operator returns true if all of the subquery values meet the condition.
select amount from sell where amount >10;

select * from sell where amount > any (select min(amount) from sell );
 
select * from sell where amount < all (select amount from sell where amount >100);

SELECT *from Tracks;

SELECT TitleID, AVG(LengthSeconds) AS AvgLength
FROM Tracks
GROUP BY TitleID;

SELECT TitleID, AVG(LengthSeconds) AS AvgLength
FROM Tracks
GROUP BY TitleID;

/*
TitleID     AvgLength   
----------- -----------
1           279
3           212
4           221
5           231
6           532
7           309
*/

SELECT TitleID, AVG(LengthSeconds) AS AvgLength
FROM Tracks
GROUP BY TitleID
HAVING AVG(LengthSeconds) > 240;

/*
TitleID     AvgLength   
----------- -----------
1           279
6           532
7           309
*/

SELECT TitleID, AVG(LengthSeconds) AS AvgLength
FROM Tracks
WHERE LengthSeconds > 240
GROUP BY TitleID;
-- calculates avg before aggregation takes place ex. avg of just track one is 327 in where
-- while in having calulates only avg of those with condition

/*
TitleID     AvgLength   
----------- -----------
1           327
3           294
4           352
5           282
6           532
7           325
*/


  SELECT Birthday
  FROM Members
  WHERE Region='GA';
  
# List the name, region, and birthday of every member who is older than all
# of the members in Gerorgia (GA)
SELECT LastName, FirstName, Region, Birthday
FROM Members
WHERE Birthday < ALL(
  SELECT Birthday
  FROM Members
  WHERE Region='GA'
-- 1963-08-04
-- 1959-06-22
-- 1964-03-15
-- insert order by birthday for ascending results

)
ORDER BY Birthday;

-- so picks all older than so less than 1959


# List the name, region, and birthday of every member who is
# older than any of the members in Georgia(GA)
SELECT LastName, FirstName, Region, Birthday
FROM Members
WHERE Birthday < ANY(
  SELECT Birthday
  FROM Members
  WHERE Region='GA'
);
-- will pick less than 1964



-- SELECT * FROM Artists GROUP BY Artist_name;

-- SELECT TitleID, COUNT(*) FROM Tracks;


# create AudioFiles
create table AudioFiles (
	TitleID int,
	TrackNum int,
	AudioFormat varchar(50)
);
# Populate the AudioFile table with all the MP3s from the Tracks table.
INSERT INTO AudioFiles
(TitleID, TrackNum, AudioFormat)
SELECT TitleID, TrackNum, 'mp3'
FROM Tracks
WHERE MP3 = 1;




