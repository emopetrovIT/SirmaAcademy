-- Create the Sirma database
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'SirmaAcademy')
BEGIN
    CREATE DATABASE SirmaAcademy;
END;

-- Switch to the Sirma database
USE SirmaAcademy;

-- Table: Countries
CREATE TABLE Countries (
    CountryID INT PRIMARY KEY IDENTITY(1, 1),
    CountryName VARCHAR(100) NOT NULL
);

-- Table: Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1, 1),
    DepartmentName VARCHAR(100) NOT NULL,
    ManagerID INT
);

-- Table: OfficeLocations
CREATE TABLE OfficeLocations (
    LocationID INT PRIMARY KEY IDENTITY(1, 1),
    LocationName VARCHAR(100) NOT NULL,
    Address VARCHAR(200) NOT NULL,
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
);

-- Table: Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1, 1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    JobTitle VARCHAR(100),
    DepartmentID INT,
    LocationID INT,
    Salary DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (LocationID) REFERENCES OfficeLocations(LocationID)
);

-- Insert data into Countries
INSERT INTO Countries (CountryName) VALUES
('Bulgaria'),
('United States'),
('Germany'),
('United Kingdom'),
('France'),
('Canada'),
('Australia'),
('India'),
('Japan'),
('Brazil'),
('South Africa');

-- Insert data into OfficeLocations
INSERT INTO OfficeLocations (LocationName, Address, CountryID) VALUES
('Headquarters', '123 Sirma Blvd, Sofia, Bulgaria', 1),
('Tech Hub', '456 Innovation Road, Plovdiv, Bulgaria', 1),
('Remote Office', '789 Cloud St, Varna, Bulgaria', 1),
('US Office', '111 Silicon Ave, California, USA', 2),
('German Branch', '234 Tech Strasse, Berlin, Germany', 3),
('UK Branch', '333 Innovation Way, London, UK', 4),
('French Branch', '444 Rue de Paris, Paris, France', 5),
('Canadian Branch', '555 Maple Road, Toronto, Canada', 6),
('Australian Branch', '678 Koala Lane, Sydney, Australia', 7),
('Indian Office', '777 Mumbai Tech Park, Mumbai, India', 8),
('Japanese Branch', '888 Sakura St, Tokyo, Japan', 9),
('Brazilian Office', '999 Copacabana Ave, Rio, Brazil', 10),
('South African Branch', '1010 Nelson Mandela Blvd, Johannesburg, South Africa', 11);

-- Insert data into Departments
INSERT INTO Departments (DepartmentName, ManagerID) VALUES
('IT', NULL),
('Human Resources', NULL),
('Sales', NULL);

-- Insert data into Employees
INSERT INTO Employees (FirstName, LastName, Email, JobTitle, DepartmentID, LocationID, Salary) VALUES
('Alice', 'Brown', 'alice.brown@sirma.com', 'Software Engineer', 1, 1, 80000.00),
('Bob', 'Smith', 'bob.smith@sirma.com', 'HR Specialist', 2, 1, 50000.00),
('Charlie', 'Davis', 'charlie.davis@sirma.com', 'Sales Manager', 3, 2, 90000.00),
('Dana', 'White', 'dana.white@sirma.com', 'DevOps Engineer', 1, 2, 85000.00),
('Eve', 'Black', 'eve.black@sirma.com', 'Intern', 2, 3, 30000.00),
('Frank', 'Green', 'frank.green@sirma.com', 'Product Manager', 1, 4, 95000.00),
('Grace', 'Hall', 'grace.hall@sirma.com', 'Data Analyst', 1, 5, 70000.00),
('Hank', 'Jones', 'hank.jones@sirma.com', 'Marketing Specialist', 3, 6, 65000.00),
('Ivy', 'King', 'ivy.king@sirma.com', 'Software Developer', 1, 7, 75000.00),
('Jack', 'Lewis', 'jack.lewis@sirma.com', 'System Administrator', 1, 8, 72000.00),
('Kara', 'Moore', 'kara.moore@sirma.com', 'HR Manager', 2, 9, 60000.00),
('Liam', 'Nelson', 'liam.nelson@sirma.com', 'Sales Executive', 3, 10, 58000.00),
('Mia', 'Owens', 'mia.owens@sirma.com', 'Network Engineer', 1, 11, 77000.00),
('Noah', 'Parker', 'noah.parker@sirma.com', 'UX Designer', 1, 4, 68000.00),
('Olivia', 'Quinn', 'olivia.quinn@sirma.com', 'Project Manager', 1, 5, 92000.00);

-- Update Departments to set ManagerID
UPDATE Departments SET ManagerID = 1 WHERE DepartmentID = 1; -- Alice is the manager of IT
UPDATE Departments SET ManagerID = 2 WHERE DepartmentID = 2; -- Bob is the manager of HR
UPDATE Departments SET ManagerID = 3 WHERE DepartmentID = 3; -- Charlie is the manager of Sales;

-- Verify the setup with SELECT queries
-- Select all employees
SELECT * FROM Employees;

-- Select all departments
SELECT * FROM Departments;

-- Select all office locations
SELECT * FROM OfficeLocations;

-- Select all countries
SELECT * FROM Countries;
