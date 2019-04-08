drop table if exists student;

CREATE TABLE student (
	CIN integer primary key, 
	Name varchar(255),
    Department varchar(255),
	UnderGrad bool,
    GPA float
);

Insert Into student(CIN, Name, Department, UnderGrad, GPA) Values(3050,'Bob', null, true,3.0);
Insert Into student(CIN, Name, Department, UnderGrad, GPA) Values(4020,'Frank','CS', false, 2.8);
Insert Into student(CIN, Name, Department, UnderGrad, GPA) Values(5030,'Monica','ME', false, 3.5);
Insert Into student(CIN, Name, Department, UnderGrad, GPA) Values(2010,'Anne','Psyc',true, 4.0);
Insert Into student(CIN, Name, Department, UnderGrad, GPA) Values(1002,'Star','Art', true, 4.0);

select * from student;

select * from student;
select * from student where Department is null;
select * from student where GPA > 3.0;
select * from student where GPA >= 3.0;
select * from student where GPA between 3.5 and 3.8;
select * from student where Name like 'A%';










