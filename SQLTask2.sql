-- Database: student_database

-- DROP DATABASE student_database;

CREATE DATABASE student_database
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Portuguese_Brazil.1252'
       LC_CTYPE = 'Portuguese_Brazil.1252'
       CONNECTION LIMIT = -1;


CREATE TABLE student_table (
    Student_id INTEGER PRIMARY KEY,
    Stu_name TEXT,
    Department TEXT,
    email_id TEXT,
    Phone_no NUMERIC,
    Address TEXT,
    Date_of_birth DATE,
    Gender TEXT,
    Major TEXT,
    GPA NUMERIC,
    Grade TEXT CHECK (Grade IN ('A', 'B', 'C', 'D', 'E', 'F'))
);

INSERT INTO student_table (
	Student_id, 
	Stu_name, 
	Department, 
	email_id, 
	Phone_no, 
	Address, 
	Date_of_birth, 
	Gender, 
	Major, 
	GPA, 
	Grade
)
VALUES 
	(1, 'Student1', 'Department1', 'student1@email.com', '11111111111', 'Address1 - n1, City1', '1991-01-01', 'M', 'Major11', 3.8, 'A'),
	(2, 'Student2', 'Department1', 'student2@email.com', '22222222222', 'Address2 - n2, City2', '1992-02-02', 'F', 'Major12', 3.5, 'B'),
	(3, 'Student3', 'Department1', 'student3@email.com', '33333333333', 'Address3 - n3, City3', '1993-03-03', 'M', 'Major13', 3.2, 'C'),
	(4, 'Student4', 'Department1', 'student4@email.com', '44444444444', 'Address4 - n4, City4', '1994-04-04', 'F', 'Major11', 3.9, 'A'),
	(5, 'Student5', 'Department2', 'student5@email.com', '55555555555', 'Address5 - n5, City5', '1995-05-05', 'M', 'Major21', 3.1, 'B'),
	(6, 'Student6', 'Department2', 'student6@email.com', '66666666666', 'Address6 - n6, City6', '1996-06-06', 'F', 'Major22', 3.6, 'A'),
	(7, 'Student7', 'Department3', 'student7@email.com', '77777777777', 'Address7 - n7, City7', '1997-07-07', 'M', 'Major31', 2.8, 'C'),
	(8, 'Student8', 'Department3', 'student8@email.com', '88888888888', 'Address8 - n8, City8', '1998-08-08', 'F', 'Major32', 3.7, 'B'),
	(9, 'Student9', 'Department2', 'student9@email.com', '99999999999', 'Address9 - n9, City9', '1999-09-09', 'M', 'Major23', 3.3, 'B'),
	(10, 'Student10', 'Department1', 'student10@email.com', '10101010101', 'Address10 - n10, City10', '2000-10-10', 'F', 'Major12', 3.0, 'C')
;

--3.Student Information Retrieval
--a) retrieving all students' information from the "student_table" and sort them in
--   descending order by their grade
SELECT * FROM student_table ORDER BY gpa DESC;

--4.Query for Male Students:
--a) retrieving information about all male students from the "student_table"
SELECT * FROM student_table WHERE gender = 'M';


--5.Query for Students with GPA less than 2.5
--a) fetching the details of students who have a GPA less than 2.5 from the "student_table"
SELECT * FROM student_table WHERE gpa < 2.5;

--6.Update Student Email and Grade
--a) updating statement to modify the email and grade of a student with a specific ID in the "student_table".
UPDATE student_table
SET email_id = 'new@email.com', gpa = 1.2
WHERE Student_id = 1
SELECT * FROM student_table WHERE Student_id = 1
;

--7.Query for Students with Grade “B”
--a) retrieving the names and ages of all students who have a grade of "B" from the "student_table"
SELECT
	stu_name,
	date_of_birth,
	grade
FROM
	student_table
WHERE
	grade = 'B'
;

--8.Grouping and Calculation
--a) grouping the “student_table” by the “Department” and “Gender” columns and
--   calculate the average GPA for each combination.
SELECT 
	department, 
	gender, 
	AVG(GPA)
FROM 
	student_table
GROUP BY 
	department, 
	gender
ORDER BY
	department
;

--9.Table Renaming
-- a) renaming the "student_table" to "student_info" using the appropriate SQL statement
ALTER TABLE student_table RENAME TO student_info;

--10.Retrieve Student with Highest GPA
--a) retrieving the name of the student with the highest GPA from the "student_info" table
SELECT 
	stu_name,
	gpa 
FROM 
	student_info 
WHERE 
	gpa = (SELECT MAX(gpa) FROM student_info)
;