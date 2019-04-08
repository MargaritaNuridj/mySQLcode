-- 1)  Drop the table Employees first and then create the Employees table with same number of records.(5)
-- Drop table Project_members;
-- Drop table if exists Projects;

Drop table if exists Project_members;
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
INSERT INTO Employees Values (4, 'Jefry','Smith','606 Campus Drive', 4);
INSERT INTO Employees Values (5, 'Kurt','Miller','50 Mart St', 5);
INSERT INTO Employees Values (6, 'Sandra','Miller','50 Glenoaks', 6);

INSERT INTO Projects Values(1,'Firestone', 1);
INSERT INTO Projects Values(2,'Blue', 2);
INSERT INTO Projects Values(11,'Total', 3);
INSERT INTO Projects Values(12,'Buisness', 4);
INSERT INTO Projects Values(13,'New', 5);
INSERT INTO Projects Values(14,'Heer', 6);

INSERT INTO Project_members Values (1, 1);
INSERT INTO Project_members Values (2, 1);
INSERT INTO Project_members Values (2, 2);
INSERT INTO Project_members Values (12, 4);
INSERT INTO Project_members Values (13, 5);
INSERT INTO Project_members Values (14, 6);
   
-- Use the Employees, Projects and Project-members of Lab 3. 

-- Implement the following queries and upload the sql file on the csns.


-- 2 ) Update the table Employees by adding a new column Salary .(5).
Alter table Employees
Add column Salary INT not null; 

-- 3) Update the column Address with varchar of size 400 and the constraint not null so that address values cannot be null.(5).
Alter table Employees
modify column address VARCHAR(400) not null;


-- 4)Drop the column Salary.(5).
ALTER TABLE Employees
  DROP COLUMN Salary;

-- 5)Update the column project name by adding a constraint unique so that project name is unique(5).
ALTER TABLE Projects
ADD CONSTRAINT ProjectName UNIQUE (Name);
 
-- 6) Update the projects leader id with default values as 1.(5).
ALTER TABLE Projects
alter column Leader_id SET DEFAULT 1;

-- 7) Add a foreign key constraint on Project members employee id using the alter command(5).
ALTER TABLE Project_members
  ADD CONSTRAINT Employ
  FOREIGN KEY (Employees_id) references Employees(id);

-- 8) Delete the record whose supervisor is null.(5)
Delete from Employees where Supervisor_id is null;

    
    
  
  
  
 
 
 
