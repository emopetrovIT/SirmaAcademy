CREATE DATABASE School
USE School
--01.Creating a Database and Table
CREATE TABLE Students (
StudentID INT PRIMARY KEY NOT NULL,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Age INT,
Grade VARCHAR(50)
)

--02.Inserting Data
INSERT INTO Students(StudentID, FirstName, LastName, Age, Grade)
VALUES  (1, 'John', 'Doe', 15, '10th'),
	    (2, 'Kenny', 'Johnson', 51 , '10th'),
		(3, 'Johny', 'Dalson', 15, '7th'),
		(4, 'Emilio', 'Delgado', 30, '10th'),
		(5, 'Sam', 'Smith', 17, '5th')

--03.Querying Data
SELECT * FROM Students
SELECT FirstName AS [First Name], Grade FROM Students

--04.Updating Data
UPDATE Students
SET Grade = '11th'
WHERE StudentID = 2

--05.Deleting Data
DELETE FROM Students
WHERE StudentID = 3

--06.Filtering Rows
SELECT * FROM Students
WHERE Grade = '10th'

SELECT * FROM Students
WHERE Age BETWEEN 14 AND 16

--07.Sorting Results
SELECT * FROM Students
ORDER BY LastName ASC

SELECT * FROM Students
ORDER BY Age DESC

--08.Using Aliases
SELECT CONCAT(FirstName, ' ', LastName) AS [Full Name],
       Grade
FROM Students
