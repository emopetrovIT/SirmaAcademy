--01.Specification

--Employee--
--ID
--Job Title
--Email

--Project--
--[Name]
--[Description]
--Deadline

--Department--
--[Name]
--ID
--Manager

--02.Identifying Entities and Relationships
--Many to many relation between Employee and Projects
--One to many relation between Departments and Employees

--03.Designing Tables with Primary and Foreign Keys
--CREATE DATABASE WorkInfoManagementSystem

CREATE TABLE Employees (
EmployeeId INT PRIMARY KEY,
JobTitle VARCHAR(50),
Email VARCHAR(50) NOT NULL
)

CREATE TABLE Projects (
ProjectId INT PRIMARY KEY,
[Name] VARCHAR(50),
[Description] VARCHAR(100),
Deadline DATETIME2
)

CREATE TABLE Departments (
DepartmentId INT PRIMARY KEY,
[Name] VARCHAR(50),
Manager VARCHAR(50),
--CONSTRAINT FK_Departments_Employees
--FOREIGN KEY (EmployeeId)
--REFERENCES Employees(EmployeeId)
)

--4.Implementing One-to-Many Relationships
ALTER TABLE Departments 
ADD 
CONSTRAINT FK_Departments_Employees
FOREIGN KEY (EmployeeId)
REFERENCES Employees(EmployeeId)

--5.Implementing Many-to-Many Relationships
CREATE TABLE EmployeesProjects(
EmployeeId INT,
ProjectId INT,
PRIMARY KEY (EmployeeId, ProjectId),
CONSTRAINT FK_EmployeesProjects_Employees
FOREIGN KEY (EmployeeId)
REFERENCES Employees(EmployeeId),
CONSTRAINT FK_EmployeesProjects_Projects
FOREIGN KEY (ProjectId)
REFERENCES Projects(ProjectId)
)
--6. Cascade Delete
ALTER TABLE Departments 
DROP CONSTRAINT FK_Departments_Employees

ALTER TABLE Departments
ADD 
CONSTRAINT FK_Departments_Employees
FOREIGN KEY (EmployeeId)
REFERENCES Employees(EmployeeId)
ON DELETE CASCADE
--7. Cascade Update
ALTER TABLE Departments 
DROP CONSTRAINT FK_Departments_Employees

ALTER TABLE Departments
ADD 
CONSTRAINT FK_Departments_Employees
FOREIGN KEY (EmployeeId)
REFERENCES Employees(EmployeeId)
ON UPDATE CASCADE
ON DELETE CASCADE
--8. Writing JOIN Queries
SELECT * 
FROM Employees AS e
JOIN EmployeesProjects AS ep ON (e.EmployeeId = ep.EmployeeId)
JOIN Projects AS p ON (ep.ProjectId = p.ProjectId)

--9. Database Normalization
CREATE TABLE Employees (
EmployeeId INT PRIMARY KEY,
[Name] VARCHAR(50)
)

CREATE TABLE Projects (
ProjectId INT PRIMARY KEY,
[Name] VARCHAR(50)
)

CREATE TABLE EmployeesProjects(
EmployeeId INT,
ProjectId INT,
PRIMARY KEY (EmployeeId, ProjectId),
CONSTRAINT FK_EmployeesProjects_Employees
FOREIGN KEY (EmployeeId)
REFERENCES Employees(EmployeeId),
CONSTRAINT FK_EmployeesProjects_Projects
FOREIGN KEY (ProjectId)
REFERENCES Projects(ProjectId)
)

--10. Visualizing Relationships 
--11. QUERIES
--Highest Paid Employee
SELECT TOP(1) * FROM Employees AS e
ORDER BY e.Salary DESC

SELECT * FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees)

--Average Salary by Department
SELECT d.DepartmentName AS [Department Name],
       AVG(e.Salary) AS [Average Salary]
FROM Employees AS e
JOIN Departments AS d ON (e.EmployeeID = d.DepartmentId)
GROUP BY d.DepartmentName

--Employees Without a Manager
SELECT * FROM Employees
WHERE JobTitle NOT LIKE '%Manager%'

--Departments and Their Managers
SELECT d.DepartmentName AS [Department Name],
       CONCAT(e.FirstName,' ', e.LastName) AS [Full Name]      
FROM Employees AS e
JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
WHERE JobTitle  LIKE '%Manager%'
ORDER BY d.DepartmentName

--Employees in a Specific Country
SELECT * FROM Employees AS e
JOIN OfficeLocations AS ol ON e.LocationId = ol.LocationId
JOIN Countries AS c ON ol.CountryId = c.CountryId
WHERE c.CountryName = 'Bulgaria'

--Total Salaries by Country
SELECT c.CountryName AS [Country Name],
       SUM(e.Salary) AS Salaries
FROM Employees AS e
JOIN OfficeLocations AS ol ON e.LocationId = ol.LocationId
JOIN Countries AS c ON ol.CountryId = c.CountryId
GROUP BY c.CountryName

--Employees Earning Above Average Salary
SELECT * FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees)