```
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE,
    ManagerID INT
);


INSERT INTO Employees (FirstName, LastName, Department, Salary, HireDate, ManagerID)
VALUES
('John', 'Doe', 'Engineering', 70000.00, '2020-01-15', 3),
('Jane', 'Smith', 'Marketing', 60000.00, '2019-03-22', 2),
('Alice', 'Johnson', 'Engineering', 75000.00, '2021-06-01', 3),
('Robert', 'Brown', 'HR', 50000.00, '2018-11-10', NULL),
('Michael', 'Davis', 'Engineering', 85000.00, '2017-09-05', NULL),
('Emily', 'Wilson', 'Marketing', 62000.00, '2022-01-12', 2);


CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    ManagerID INT
);


INSERT INTO Departments (DepartmentName, ManagerID)
VALUES
('Engineering', 3),
('Marketing', 2),
('HR', NULL);


SELECT * FROM Employees;

SELECT * FROM Employees WHERE Department = 'Engineering';

SELECT Department, AVG(Salary) AS AvgSalary FROM Employees GROUP BY Department;

SELECT e.FirstName, e.LastName, d.DepartmentName 
FROM Employees e
JOIN Departments d ON e.Department = d.DepartmentName;

INSERT INTO Employees (FirstName, LastName, Department, Salary, HireDate, ManagerID)
VALUES ('Sara', 'Lee', 'HR', 52000.00, '2023-03-14', NULL);


UPDATE Employees SET Salary = Salary * 1.05 WHERE Department = 'Marketing';


DELETE FROM Employees WHERE EmployeeID = 5;
use pet_shop

SELECT e.name AS employee_name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;


DESCRIBE employees;

SHOW DATABASES;



```
