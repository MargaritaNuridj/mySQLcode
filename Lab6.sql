Drop table if exists Project_members ;
Drop table if exists Projects;
Drop table if exists Employees;

Create table Employees (
      id int primary key auto_increment,
	  first_name VARCHAR(15) NOT NULL,
	  last_name VARCHAR(15) NOT NULL,
	  address  VARCHAR(20) ,
      Supervisor_id  int 
	  );
      
      
Create table Projects (
	id int primary key auto_increment,
     Name VARCHAR(15) NOT NULL,
      Leader_id int
	  );
      
      Create table Project_members (
	  Project_id  int,
      Employees_id int,
      foreign key (Employees_id) references Employees(id),
            foreign key (Project_id) references Projects(id),
 primary key (Employees_id, Project_id)
 
	  );

INSERT INTO Employees Values (1, 'Jane','Doe','Street #2115', null);
INSERT INTO Employees Values (2, 'John','Doe','Street #561', 1);
INSERT INTO Employees Values (3, 'Chris','Dave','Street ABC', 2);
INSERT INTO Employees Values (4, 'Frank','Miller','606 Campus Drive', 4);
INSERT INTO Employees Values (5, 'Frank','Miller','606 Campus Drive', 5);
INSERT INTO Employees Values (6, 'Frank','Miller','606 Campus Drive', 6);

INSERT INTO Projects Values(1,'Firestone', 1);
INSERT INTO Projects Values(2,'Blue', 2);
INSERT INTO Projects Values(11,'Heather', 3);
INSERT INTO Projects Values(12,'Heather', 2);
INSERT INTO Projects Values(13,'Heather', 5);
INSERT INTO Projects Values(14,'Heather', 6);

INSERT INTO Project_members Values (1, 1);
INSERT INTO Project_members Values (2, 1);
INSERT INTO Project_members Values (2, 2);
INSERT INTO Project_members Values (12, 4);
INSERT INTO Project_members Values (13, 5);
INSERT INTO Project_members Values (14, 6);

#select* from Employees;
#select* from Project_members;

-- a) List the first and last name of employees whose id’s are less than 10.(5pts)
select first_name, last_name from Employees where id <10;

-- b) Find the id of Jane Doe.(5pts)
select Employees.id as 'Jane Doe''s id' from Employees where first_name like 'Jane' and last_name like  'Doe';

-- c) Find the name of emloyees who does not have a supervisor(concantenate first and last name)(5pts)
SELECT CONCAT(first_name, last_name) AS employee_details FROM Employees where Supervisor_id is NULL;
 
 -- d) Find the name of the employee who leads the project Firestone(5pts)
 select CONCAT(first_name, last_name) as 'Firestone Employee' from Employees inner join Projects on 
 Projects.Leader_id = Employees.id where Projects.Name like 'Firestone'; 
 
-- e) List the name of employees who work on the project with id= 1(5pts)
select concat(Employees.first_name, Employees.last_name) as 'Project 1 Employees' from Employees
inner join PRoject_members on Employees.id = Employees_id and Project_id = 1;

-- f) List the employee who work on project Blue(5ts)
 select concat(Employees.first_name, Employees.last_name) as 'Blue Employees' from Employees inner join
 Project_members on Employees.id = Employees_id
 inner join Projects on Project_id = Projects.id and name = 'Blue';

-- g)Find the name of Jane Doe supervisor.(5pts)
select  e1.first_name from Employees e1,Employees e2 where e1.id = e2.Supervisor_id and e2.first_name like 'Jane' and e2.last_name like 'Doe';

-- h) Find the number of projects led by John Doe(5pts)
select count(*) as '# of projects led by John Doe' from Employees inner join Projects on Leader_id = Employees.id and Leader_id = 1;

-- i)List the number of members of each project(5pts)
select Projects.Name, count(*) as '# of members' from Projects inner join Project_members on Projects.id = Project_id group by Projects.Name;
    
  
  
  
 
 
 
