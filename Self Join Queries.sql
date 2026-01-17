USE PRACTICE;
DROP TABLE EMPLOYEE;
CREATE table Employee (
    EmployeeID  VARCHAR(10),
    EmployeeName VARCHAR(50),
    ManagerID   VARCHAR(10),
    Department  VARCHAR(50),
    Salary      INT
);
INSERT INTO Employee (EmployeeID, EmployeeName, ManagerID, Department, Salary) VALUES
('E001', 'Alice', 'M001', 'Sales', 7000),
('E002', 'Bob', 'M001', 'HR', 6000),
('E003', 'Charlie', 'M002', 'IT', 9000),
('E004', 'David', 'M003', 'IT', 11000),
('E005', 'Eve', NULL, 'Marketing', 8000),
('E006', 'Frank', 'M001', 'Sales', 5000),
('E007', 'Grace', 'M002', 'HR', 4000),
('E008', 'Helen', 'M003', 'Marketing', 9000),
('E009', 'Varad', 'M003', 'Intern', 7000),
('M001', 'Manager1', NULL, 'Sales', 5000),
('M002', 'Manager2', NULL, 'IT', NULL),
('M003', 'Manager3', NULL, 'Marketing', NULL);
COMMIT;


#Ques_1 :Find the manager of each employee
SELECT E.EMPLOYEEID, E.EMPLOYEENAME, E.MANAGERID, M.EMPLOYEENAME
FROM EMPLOYEE E
JOIN EMPLOYEE M
ON E.MANAGERID=M.EMPLOYEEID;


#Ques_2 : Find employees working in the same department
SELECT DISTINCT E1.DEPARTMENT, E1.EMPLOYEENAME
FROM EMPLOYEE E1, EMPLOYEE E2
WHERE E1.EMPLOYEEID<>E2.EMPLOYEEID
AND E1.DEPARTMENT=E2.DEPARTMENT
ORDER BY E1.DEPARTMENT;

SELECT DEPARTMENT, EMPLOYEENAME
FROM EMPLOYEE
WHERE DEPARTMENT IN(
	SELECT DEPARTMENT
    FROM EMPLOYEE
    GROUP BY DEPARTMENT
    HAVING COUNT(DISTINCT EMPLOYEEID)>1
)
ORDER BY DEPARTMENT;


#Ques_3 : Find pairs of employees who share the same manager
SELECT


#Ques_4 : Find employees with the same salary but working in a different department
 


#Ques_5 : Find employees with no manager

Ques_6 : Find employees working in the same department as a specific employee (emplyee name is Alice)

Ques_7 : Find all employees who work in the same department but have different managers

Ques_8 : Find employees earning more than their manager

Ques_9 : Find employees whose department has the highest average salary

Ques_10 : Find employees who are managed by the same manager and work in different departments: