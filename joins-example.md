```
CREATE DATABASE school;
use school;

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50)
);

INSERT INTO students ( first_name )  VALUES
     ('rajitha'), ('Rishika'), ('Rishi'), ('lisa'), ('sam');
     
UPDATE students  SET first_name = 'Rajitha' WHERE id = 1;

SELECT * FROM students;
  
CREATE TABLE papers (
    title VARCHAR(50),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id)
        REFERENCES students (id)
);


INSERT INTO papers ( student_id, title, grade ) VALUES
(1, 'My First Book Repoer', 90),
(1, 'Hello Book', 75),
(2, 'Russian second book', 94),
(2, 'The art of the Essay', 98),
(4, 'The books arts and science',89);

SELECT * FROM papers; 

 
 
 
 
 
 
 
SELECT 
    first_name, title, grade
FROM
    students
        JOIN
    papers ON papers.student_id = students.id
ORDER BY grade DESC;
 
 
 
SELECT 
    first_name, title, grade
FROM
    students
        LEFT JOIN
    papers ON papers.student_id = students.id;
 
 
 
SELECT 
    first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0)
FROM
    students
        LEFT JOIN
    papers ON papers.student_id = students.id;
 
 
 
SELECT 
    first_name, IFNULL(AVG(grade), 0) AS average
FROM
    students
        LEFT JOIN
    papers ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;
 
 
 
SELECT 
    first_name,
    IFNULL(AVG(grade), 0) AS average,
    CASE
        WHEN IFNULL(AVG(grade), 0) >= 75 THEN 'passing'
        ELSE 'failing'
    END AS passing_status
FROM
    students
        LEFT JOIN
    papers ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;
```
