--lab 1
CREATE DATABASE lab1
USE lab1
CREATE TABLE Student(Student_id varchar(50) primary key, Name varchar(50), Gender varchar(50), DOB Date, Address varchar(50));
INSERT INTO Student VALUES ('S02', 'Nancy', 'Female','1997-5-16','Bukit Jalil');
INSERT INTO Student VALUES ('S03', 'Melvin', 'Male','1998-11-20','');
INSERT INTO Student VALUES ('S01', 'Ali', 'Male','1996-2-2','Kuala Lumpur');
INSERT INTO Student VALUES ('S04', 'Angeline', 'Female','1995-12-30','Sri Petaling');


--Lab 2

CREATE TABLE Publisher(Publisher_ID varchar(50) primary key, Name varchar(50),Address varchar(50));
INSERT INTO Publisher VALUES('P01','Pearson','Bukit Jalil');
INSERT INTO Publisher VALUES('P02','Deitel','Puchong');
INSERT INTO Publisher VALUES('P03','Rainbow','Subang');
DELETE FROM Publisher WHERE Name = 'Rainbow'
SELECT * FROM Publisher;

CREATE TABLE Book(BookID varchar(50) PRIMARY KEY, Name varchar(50), Author varchar(50), Price int,
PublishedDate date, Publisher_ID varchar(50), FOREIGN KEY(Publisher_ID) REFERENCES Publisher(Publisher_ID) ON DELETE SET NULL)
INSERT INTO Book VALUES('B01','Maths','J.Wenton',50,'2016-1-10','P01');
INSERT INTO Book VALUES('B02','Science','S.Hanson',100,'2016-1-12','P01');
INSERT INTO Book VALUES('B03','English','K.Vince',89,'2016-3-9','P02');
INSERT INTO Book VALUES('B04','Biology','K.Vince',150,'2016-4-24','P02');
DELETE FROM Book WHERE BookID = 'B03'
SELECT * FROM Book;

--Lab 3

CREATE TABLE Supplier(Supplier_ID varchar(50) PRIMARY KEY,Name varchar(50), Address varchar(50))
INSERT INTO Supplier VALUES('S01','ABC Company','KL');
INSERT INTO Supplier VALUES('S02','XYZ Company','PJ');
INSERT INTO Supplier VALUES('S03','HJK Company','PJ');
INSERT INTO Supplier VALUES('S04','PQR Company','JB');
SELECT * FROM Supplier

CREATE TABLE Product(Product_ID varchar(50) PRIMARY KEY, Name varchar(50), Price int, Quantity int);
INSERT INTO Product VALUES ('P01','Keyboard', 80, 60);
INSERT INTO Product VALUES ('P02', 'Mouse', 30, 70);
INSERT INTO Product VALUES ('P03', 'Monitor', 200,80);
INSERT INTO Product VALUES ('P04', 'Pendrive', 40,50);
SELECT * FROM Product;


CREATE TABLE Supplies(Supplies_ID varchar(50) PRIMARY KEY, Supplier_ID varchar(50), Product_ID varchar(50), Date Date, Quantity int,
FOREIGN KEY(Supplier_ID) REFERENCES Supplier(Supplier_ID), FOREIGN KEY(Product_ID) REFERENCES Product(Product_ID));
INSERT INTO Supplies VALUES ('001','S01','P01','2017-01-01',100);
INSERT INTO Supplies VALUES ('002', 'S01', 'P02', '2017-02-02',200);
INSERT INTO Supplies VALUES ('003', 'S01', 'P03', '2017-02-02',300);
INSERT INTO Supplies VALUES ('004', 'S02', 'P03', '2017-04-03', 400);
SELECT * FROM Supplies;
ALTER AUTHORIZATION ON DATABASE::lab1 To [sa];

--Lab 4
SELECT * FROM Publisher
SELECT Name,Author FROM Book
SELECT * FROM Book WHERE Author = 'K.Vince'
SELECT * FROM Book WHERE Publisher_ID = 'P01'
SELECT * FROM Book WHERE Price > 100
SELECT * FROM Book WHERE Price <= 100
SELECT * FROM Book WHERE Price BETWEEN 100 AND 200
SELECT * FROM Book WHERE Price NOT BETWEEN 100 AND 200
SELECT * FROM Publisher WHERE Address = 'Puchong' AND Address = 'Subang'
SELECT * FROM Publisher WHERE Address = 'Puchong' OR Address = 'Subang'
SELECT * FROM Publisher ORDER BY Name
SELECT * FROM Book ORDER BY Name DESC

--Lab 5
SELECT * FROM Publisher WHERE Name LIKE 'r%'
SELECT * FROM Publisher WHERE Name LIKE '%n'
SELECT * FROM Book WHERE Name LIKE '%en%'
SELECT * FROM Book WHERE Author LIKE '%ce' ORDER BY Name DESC
SELECT * FROM Publisher WHERE Address IN ('Puchong','Subang')
SELECT * FROM Book WHERE Price IN (50,100)
UPDATE Publisher SET Address = 'Serdang' WHERE Name = 'Pearson'
UPDATE Book SET Price = 99 WHERE Author = 'K.Vince';
ALTER TABLE BOOK ADD Telephone int;
sp_rename 'Book.Telephone','ContactNumber'

ALTER TABLE Book
DROP COLUMN ContactNumber

DELETE FROM Book WHERE Author = 'K.Vince' AND Name = 'Biology'

CREATE TABLE CUSTOMER(customer_id int)
DROP TABLE CUSTOMER

CREATE DATABASE MyDatabase
DROP DATABASE MyDatabase

--Lab6

SELECT TOP 2 * FROM Book WHERE Price <130;

SELECT MIN(Price) AS "LowestPrice" FROM Book;

SELECT MAX(Price) AS "HighestPrice" FROM Book;

SELECT SUM(Price) AS "TotalPrice" FROM Book;

SELECT AVG(Price) AS "AveragePrice" FROM Book;

SELECT Name, Price FROM Book WHERE Price > (SELECT AVG(Price) FROM Book);

SELECT COUNT(Name) AS "TotalBooks"FROM Book;

--ss
SELECT COUNT(Price) AS "BooksCostMoreThanRM60" FROM Book WHERE Price>60;

SELECT COUNT(Price) AS "BooksCostMoreThanAverage" FROM Book
WHERE Price > (SELECT AVG(Price) FROM Book);

SELECT Author,COUNT(Name) AS "TotalBooksByAuthor" FROM Book GROUP BY Author;

SELECT Author,SUM(Price) AS "BookPriceByAuthor" FROM Book GROUP BY Author;


--Lab7

SELECT * FROM Book 
WHERE Publisher_ID = (SELECT Publisher_ID FROM Publisher WHERE Name = 'Deitel');

SELECT * FROM Book
WHERE Author = 'S.Hanson' AND 
Publisher_ID = (SELECT Publisher_ID FROM Publisher WHERE Name = 'Pearson');

SELECT * FROM Book
WHERE Price >80 AND 
Publisher_ID = (SELECT Publisher_ID FROM Publisher WHERE Name = 'Pearson');

SELECT * FROM Book
WHERE Price BETWEEN 30 AND 70 AND
Publisher_ID = (SELECT Publisher_ID FROM Publisher WHERE Name = 'Pearson')
AND Author = 'J.Wenton';

SELECT COUNT(Name) FROM Book
WHERE Publisher_ID = (SELECT Publisher_ID FROM Publisher WHERE Name = 'Rainbow');

SELECT SUM(Price) AS "TotalPrice" FROM Book
WHERE Publisher_ID = (SELECT Publisher_ID FROM Publisher WHERE Name = 'Pearson');

SELECT AVG(Price) AS "AveragePrice" FROM Book
WHERE Publisher_ID = (SELECT Publisher_ID FROM Publisher WHERE Name = 'Pearson');

SELECT * FROM Book
WHERE Publisher_ID = (SELECT Publisher_ID FROM Publisher WHERE Address = 'Bukit Jalil');


--Lab 8

INSERT INTO Publisher VALUES ('P04', 'MacHill', 'Kuala Lumpur');

INSERT INTO Book VALUES ('B05','Computing','J.Denzin',180,'2011-07-15','');

SELECT * FROM Book INNER JOIN Publisher ON Book.Publisher_ID = Publisher.Publisher_ID;


SELECT * FROM Publisher LEFT JOIN Book ON Publisher.Publisher_ID = Book.Publisher_ID;


SELECT * FROM Publisher RIGHT JOIN Book ON Publisher.Publisher_ID = Book.Publisher_ID;


SELECT * FROM Publisher FULL OUTER JOIN Book ON Publisher.Publisher_ID = Book.Publisher_ID;

SELECT Publisher_ID,Name FROM Publisher
UNION
SELECT BookID,Name FROM Book;

SELECT * FROM Book INNER JOIN Publisher ON Book.Publisher_ID = Publisher.Publisher_ID 
WHERE Publisher.Name = 'Deitel';


SELECT * FROM Book INNER JOIN Publisher ON Book.Publisher_ID = Publisher.Publisher_ID 
WHERE Publisher.Name = 'Pearson'AND Book.Author = 'S.Hanson';

SELECT * FROM Book INNER JOIN Publisher ON Book.Publisher_ID = Publisher.Publisher_ID 
WHERE Publisher.Name = 'Pearson'AND Book.Price BETWEEN 30 AND 70 AND Book.Author = 'J.Wenton';

SELECT * FROM Book INNER JOIN Publisher ON Book.Publisher_ID = Publisher.Publisher_ID 
WHERE Publisher.Address = 'Bukit Jalil';


--LAB 9

CREATE TABLE Course(Course_ID varchar(50) PRIMARY KEY, Name varchar(50), EntryQualification varchar(50))
INSERT INTO Course VALUES('C01', 'Diploma', '3 credits in O level');
INSERT INTO Course VALUES('C02', 'Degree', '3 credits in A level');
INSERT INTO Course VALUES('C03', 'Master', 'Degree in any computing field');
INSERT INTO Course VALUES('C04', 'Foundation', '5 credits in O level');
SELECT * FROM Course

CREATE TABLE Students(Student_ID varchar(50) PRIMARY KEY, Name varchar(50), Gender varchar(50), DOB date, Course_ID varchar(50), FOREIGN KEY(Course_ID) REFERENCES Course(Course_ID))
INSERT INTO Students VALUES('ST01','Helen','Female','1999-02-02','C01');
INSERT INTO Students VALUES('ST02','Karen','Female','2000-09-15','C02');
INSERT INTO Students VALUES('ST03','Peter','Male','1999-04-28','C03');
INSERT INTO Students VALUES('ST04','Shaun','Male','1999-06-30','C04');
SELECT * FROM Students

CREATE TABLE Subject(Subject_ID varchar(50) PRIMARY KEY, Name varchar(50), Course_ID varchar(50), FOREIGN KEY(Course_ID) REFERENCES Course(Course_ID));
INSERT INTO Subject VALUES('SU01','SAD','C01');
INSERT INTO Subject VALUES('SU02','IDB','C01');
INSERT INTO Subject VALUES('SU03','ISWE','C02');
INSERT INTO Subject VALUES('SU04','CPP','C02');
INSERT INTO Subject VALUES('SU05','Java','C03');
INSERT INTO Subject VALUES('SU06','NNT','C04');
INSERT INTO Subject VALUES('SU07','DAS','C04');
SELECT * FROM Subject;

SELECT Student_ID, Name, DATEDIFF(YEAR,DOB,GETDATE()) AS AGE FROM Students
SELECT * FROM Students WHERE DATEDIFF(YEAR,DOB,GETDATE()) > 18

SELECT * FROM Students INNER JOIN Subject ON Students.Course_ID = Subject.Course_ID INNER JOIN Course ON Students.Course_ID = Course.Course_ID;

SELECT * FROM Subject,Course WHERE Course.Course_ID = Subject.Course_ID

SELECT * FROM Students,Subject,Course WHERE Course.Course_ID = Subject.Course_ID AND Students.Course_ID = Course.Course_ID

SELECT * FROM Course LEFT JOIN Students ON Course.Course_ID = Students.Course_ID

SELECT * FROM Course RIGHT JOIN Students ON Course.Course_ID = Students.Course_ID 
ORDER BY Students.Name


--LAB 10

SELECT * FROM Students WHERE Gender = 'Female' AND 
Course_ID = (SELECT Course_ID FROM Course WHERE Name = 'Degree') ORDER BY  Name DESC

SELECT * FROM Subject JOIN Course on Subject.Course_ID = Course.Course_ID
WHERE Subject.Course_ID = (SELECT Course_ID FROM Course WHERE EntryQualification = '5 credits in O level')
ORDER BY Subject.Name

SELECT * FROM Subject JOIN Course on Subject.Course_ID = Course.Course_ID
WHERE Subject.Course_ID = (SELECT Course_ID FROM Course WHERE Name = 'Degree') OR
Subject.Course_ID = (SELECT Course_ID FROM Course WHERE Name = 'Master')

SELECT Course_ID, COUNT(Name) AS "NumOfStudents" FROM Students GROUP BY Course_ID

SELECT * FROM Students WHERE DATEDIFF(YEAR,DOB,GETDATE()) > (SELECT AVG(DATEDIFF(YEAR,DOB,GETDATE())) AS "Age" FROM Students)

SELECT * FROM Students ORDER BY DATEDIFF(YEAR,DOB,GETDATE()) DESC



SELECT COUNT(Course_ID)
FROM Students
GROUP BY Student_ID

HAVING COUNT(Course_ID) > 1;

SELECT S.Course_ID,COUNT(S.Course_ID) AS "NumOfSubject"
FROM Subject S JOIN Course C ON S.Course_ID = C.Course_ID
GROUP BY S.Course_ID
HAVING COUNT(S.Subject_ID) = 1;