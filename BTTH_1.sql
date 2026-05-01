DROP DATABASE IF EXISTS BTTH1;
CREATE DATABASE BTTH1;
USE BTTH1;

CREATE TABLE teachers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2) NOT NULL CHECK (salary >= 0)
);

CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    teacher_id INT,
    credits INT NOT NULL CHECK (credits > 0),
    tuition_fee DECIMAL(10,2) NOT NULL CHECK (tuition_fee >= 0),
    FOREIGN KEY (teacher_id) REFERENCES teachers(id)
);

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL
);

CREATE TABLE enrollments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    date DATE NOT NULL,
    score DECIMAL(4,2) NULL,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

INSERT INTO teachers (full_name, salary) 
VALUES
	('Nguyen Van A', 1000),
	('Tran Thi B', 1200),
	('Le Van C', 1100);

INSERT INTO courses (course_name, teacher_id, credits, tuition_fee) 
VALUES
	('IT Basic', 1, 3, 500),
	('Advanced IT', 1, 4, 700),
	('Database Systems', 2, 3, 600),
	('Web Development', 2, 3, 650),
	('English Communication', 3, 2, 400),
	('Soft Skills', NULL, 2, 300);

INSERT INTO students (full_name, date_of_birth, gender) 
VALUES
	('Student 1', '2003-01-01', 'Male'),
	('Student 2', '2003-02-02', 'Female'),
	('Student 3', '2003-03-03', 'Male'),
	('Student 4', '2003-04-04', 'Female'),
	('Student 5', '2003-05-05', 'Male'),
	('Student 6', '2003-06-06', 'Female'),
	('Student 7', '2003-07-07', 'Male'),
	('Student 8', '2003-08-08', 'Female'),
	('Student 9', '2003-09-09', 'Male'),
	('Student 10', '2003-10-10', 'Female');

INSERT INTO enrollments (student_id, course_id, date, score) 
VALUES
	(1, 1, '2024-01-01', 8.5),	
	(2, 1, '2024-01-02', 7.0),
	(3, 2, '2024-01-03', 9.0),
	(4, 2, '2024-01-04', NULL),
	(5, 3, '2024-01-05', 6.5),
	(6, 3, '2024-01-06', 7.5),
	(7, 4, '2024-01-07', 8.0),
	(8, 4, '2024-01-08', NULL),
	(9, 5, '2024-01-09', 7.8),
	(10, 5, '2024-01-10', 8.2),
	(1, 6, '2024-01-11', 6.0),
	(2, 6, '2024-01-12', 7.2),
	(3, 3, '2024-01-13', 8.8),
	(4, 1, '2024-01-14', 7.9),
	(5, 2, '2024-01-15', 9.1);
 
UPDATE teachers
SET salary = salary * 1.10
WHERE id IN (
    SELECT DISTINCT teacher_id
    FROM courses
    WHERE course_name LIKE '%IT%'
);

SELECT *
FROM teachers;