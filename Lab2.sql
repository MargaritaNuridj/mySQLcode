-- droping existing table
drop table if exists Student;
drop table if exists Department;

-- creating new table user
create table Student(
CIN integer primary key,
firstName varchar(255),
lastName varchar(255),
DepartmentId Integer,
GPA float,
noOfCoursesTaken Integer

);

create table Department(
DepartmentId Integer primary key,
DepartmentName varchar(255)

);
-- Insert student names into Student
Insert Into Student(CIN, firstName, lastName,DepartmentId,GPA, noOfCoursesTaken) Values(3050,'Andy','Bob', 4, 3.0, 5);
Insert Into Student(CIN, firstName, lastName,DepartmentId, GPA, noOfCoursesTaken) Values(4020,'Still','Frank',5, 2.8, 7);
Insert Into Student(CIN, firstName, lastName,DepartmentId, GPA, noOfCoursesTaken) Values(5030,'Ramirez','Monica',4, 3.8, 10);
Insert Into Student(CIN, firstName, lastName,DepartmentId, GPA, noOfCoursesTaken) Values(2010,'Anthony','Anne',3,4.0, 15);
Insert Into Student(CIN, firstName, lastName,DepartmentId, GPA, noOfCoursesTaken) Values(1002,'Ramon','Star',2, 4.0, 1);

-- Insert Into Department
Insert Into Department(DepartmentId, DepartmentName) Values(4, 'CS');
Insert Into Department(DepartmentId, DepartmentName) Values(3, 'Psychology');


select * from Student;
-- calculate the max, min, and avg GPA
select * from Student;
select    max(GPA) from Student;
select    min(GPA) from Student;
select    avg(GPA) from Student;

-- display avg GPA of students whose first name starts with A
select    avg(GPA) from Student where firstname like 'A%';

-- display count of students in department CS
select count(*) from Student where DepartmentId = all(select DepartmentId from Department where DepartmentName = 'CS');

-- display count of students in department CS with GPA's greater than 3.5
select count(*) from Student where DepartmentId = all(select DepartmentId from Department where DepartmentName = 'CS') and GPA >3.5;
