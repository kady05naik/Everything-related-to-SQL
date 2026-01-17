use practice;

CREATE TABLE Orders (
    OrderID INT,
    CustomerID VARCHAR(10),
    OrderAmount INT
);
INSERT INTO Orders (OrderID, CustomerID, OrderAmount) VALUES
(1, 'C101', 500),
(2, 'C102', 700),
(3, 'C101', 300),
(4, 'C103', 1500),
(5, 'C104', 200),
(6, 'C102', 400),
(7, 'C105', 800),
(8, 'C103', 600),
(9, 'C106', 1200),
(10, 'C107', 100),
(11, 'C106', 500),
(12, 'C105', 300);
COMMIT;


#Write a query to find the top 5 customers with the highest total order amounts.
SELECT CUSTOMERID,SUM(ORDERAMOUNT) AS TOTALAMT
FROM  ORDERS
GROUP BY CUSTOMERID
ORDER BY TOTALAMT DESC
LIMIT 5;

----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE table Customer (
    CustomerID VARCHAR(10),
    CustomerName VARCHAR(50),
    OrderID VARCHAR(10),
    OrderAmount INT
);
INSERT INTO Customer (CustomerID, CustomerName, OrderID, OrderAmount) VALUES
('C1098', 'PRADEEP', 'O3006', 20000),
('C1098', 'PRADEEP', 'O3010', 5000),
('C1098', 'PRADEEP', 'O3016', 600),
('C1100', 'KIRAN', 'O3068', 1000),
('C1100', 'KIRAN', 'O3075', 200),
('C1195', 'PRANAV', 'O3072', 6000),
('C1195', 'PRANAV', 'O3045', 80000),
('C2026', 'BUTCHI RAJU', 'O3056', 100000),
('C2026', 'BUTCHI RAJU', 'O3058', 20000);
COMMIT;


#SQL Query to Find the Highest Purchase Amount of a Customer 
SELECT CUSTOMERID, MAX(ORDERAMOUNT)
FROM CUSTOMER
GROUP BY CUSTOMERID;

----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE table Employee (
    EmployeeID VARCHAR(10),
    EmployeeName VARCHAR(50),
    ManagerID VARCHAR(10)
);
INSERT INTO Employee (EmployeeID, EmployeeName, ManagerID) VALUES
('E001', 'Alice', 'M001'),
('E002', 'Bob', 'M001'),
('E003', 'Charlie', 'M002'),
('E004', 'David', 'M003'),
('E005', 'Eve', NULL),
('E006', 'Frank', 'M002'),
('M001', 'Manager1', NULL),
('M002', 'Manager2', NULL),
('M003', 'Manager3', NULL);
COMMIT;


#Write a query to find the manager for each employee in a company, even if the employee does not have a manager assigned.
SELECT A.EMPLOYEEID, B.EMPLOYEENAME
FROM EMPLOYEE A LEFT JOIN EMPLOYEE B
ON A.MANAGERID=B.EMPLOYEEID
WHERE A.EMPLOYEEID LIKE 'E%';

----------------------------------------------------------------------------------------------------------------------------------------------------

drop table Employee;
CREATE TABLE Employee (EmployeeID VARCHAR(10),EmployeeName VARCHAR(100),ManagerID VARCHAR(10) );
INSERT INTO Employee (EmployeeID, EmployeeName, ManagerID) VALUES
('E001', 'Alice', 'M001'),
('E002', 'Bob', 'M001'),
('E003', 'Charlie', 'M002'),
('E004', 'David', 'M003'),
('E005', 'Eve', ''),
('E006', 'Frank', 'M002'),
('M001', 'Manager1', ''),
('M002', 'Manager2', ''),
('M003', 'Manager3', '');
COMMIT;


#Find out the name of the employee who are not manager by using sub query
SELECT EMPLOYEENAME
FROM EMPLOYEE
WHERE EMPLOYEEID NOT IN(
SELECT EMPLOYEEID 
FROM EMPLOYEE 
WHERE EMPLOYEEID LIKE 'M%');

----------------------------------------------------------------------------------------------------------------------------------------------------

drop table Employee;
CREATE table Employee (
    EmployeeID VARCHAR(10),
    EmployeeName VARCHAR(50),
    Department VARCHAR(50)
);
INSERT INTO Employee (EmployeeID, EmployeeName, Department) VALUES
('E001', 'Alice', 'Sales'),
('E002', 'Bob', 'HR'),
('E003', 'Charlie', 'IT'),
('E004', 'David', 'Finance'),
('E005', 'Eve', 'Marketing');
drop table Orders;
CREATE TABLE Orders (
    OrderID VARCHAR(10),
    CustomerID VARCHAR(10),
    OrderAmount INT
);
INSERT INTO Orders (OrderID, CustomerID, OrderAmount) VALUES
('O3001', 'E001', 1000),
('O3002', 'E003', 2000),
('O3003', 'E004', 1500);
COMMIT;

#Write a query to find employees who have never placed an order.
SELECT E.*
FROM EMPLOYEE E
LEFT JOIN ORDERS O 
ON E.EMPLOYEEID=O.CUSTOMERID
WHERE ORDERID IS NULL;

SELECT *
FROM EMPLOYEE
WHERE EMPLOYEEID NOT IN(SELECT CUSTOMERID FROM ORDERS);

----------------------------------------------------------------------------------------------------------------------------------------------------

drop table Employee;
CREATE table Employee (
    EmployeeID VARCHAR(10) NOT NULL,
    EmployeeName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary INT NOT NULL
);
INSERT INTO Employee (EmployeeID, EmployeeName, Department, Salary) VALUES
('E001', 'Alice', 'Sales', 7000),
('E002', 'Bob', 'HR', 6000),
('E003', 'Charlie', 'IT', 9000),
('E004', 'David', 'IT', 11000),
('E005', 'Eve', 'Marketing', 8000),
('E006', 'Frank', 'Sales', 5000),
('E007', 'Grace', 'HR', 4000),
('E008', 'Helen', 'Marketing', 9000);
COMMIT;


#Query to find employees earning more than average salary in their department.
SELECT EMPLOYEENAME,DEPARTMENT
FROM (
SELECT EMPLOYEENAME, DEPARTMENT, SALARY, AVG(SALARY) OVER (PARTITION BY DEPARTMENT) AS AVGSAL
FROM EMPLOYEE)T
WHERE SALARY > AVGSAL;

WITH RESULT AS(
	SELECT EMPLOYEENAME,DEPARTMENT, SALARY, AVG(SALARY) OVER (PARTITION BY DEPARTMENT) AS AVGSAL
    FROM EMPLOYEE
)
SELECT EMPLOYEENAME, DEPARTMENT
FROM RESULT
WHERE SALARY>AVGSAL;

----------------------------------------------------------------------------------------------------------------------------------------------------

drop table Employee;
CREATE table Employee (
    employee_id INT,
    ename VARCHAR(50),
    salary DECIMAL(10, 2),
    join_date DATE,
    manager_id INT,
    job_title VARCHAR(50)
);
INSERT INTO Employee (employee_id, ename, salary, join_date, manager_id, job_title) VALUES
(1, 'Alice', 75000, '2019-03-15', NULL, 'Manager'),
(2, 'Bob', 65000, '2018-05-20', 1, 'Developer'),
(3, 'Charlie', 85000, '2020-07-10', 1, 'Developer'),
(4, 'Diana', 72000, '2021-02-05', 3, 'Analyst'),
(5, 'Eva', 68000, '2017-12-12', NULL, 'Developer'),
(6, 'Frank', 62000, '2019-06-01', 5, 'Tester'),
(7, 'Grace', 90000, '2022-08-18', 1, 'Manager'),
(8, 'Henry', 77000, '2019-11-10', 7, 'Analyst'),
(9, 'Ian', 61000, '2020-01-20', NULL, 'Intern');
COMMIT;


#Find out the name of the employee who is having the max salary
SELECT ENAME 
FROM EMPLOYEE  
WHERE SALARY=(
SELECT MAX(SALARY) 
FROM EMPLOYEE);


#Find employees who have a lower salary than their manager--->imp 
SELECT E.ENAME
FROM EMPLOYEE E 
JOIN EMPLOYEE M
ON E.MANAGER_ID=M.EMPLOYEE_ID
WHERE E.SALARY<M.SALARY;


#Find employees who have a MORE salary than their manager--->imp 
SELECT E.ENAME
FROM EMPLOYEE E 
JOIN EMPLOYEE M
ON E.MANAGER_ID=M.EMPLOYEE_ID
WHERE E.SALARY>M.SALARY;

----------------------------------------------------------------------------------------------------------------------------------------------------

drop table Employee;
CREATE table Employee (
    EmployeeID VARCHAR(10),
    EmployeeName VARCHAR(50),
    ManagerID VARCHAR(10),
    Department VARCHAR(50),
    Salary INT
);
INSERT INTO Employee (EmployeeID, EmployeeName, ManagerID, Department, Salary) VALUES
('E001', 'Alice', 'M001', 'Sales', 5000),
('E002', 'Bob', 'M001', 'HR', 6000),
('E003', 'Charlie', 'M002', 'IT', 9000),
('E004', 'David', 'M003', 'IT', 11000),
('E005', 'Eve', NULL, 'Marketing', 8000),
('E006', 'Frank', 'M001', 'Sales', 5000),
('E007', 'Grace', 'M002', 'HR', 4000),
('E008', 'Helen', 'M003', 'Marketing', 9000),
('E009', 'Alice', 'M001', 'Sales', 5000),
('E010', 'Bob', 'M001', 'HR', 6000),
('E011', 'Charlie', 'M002', 'IT', 9000),
('E012', 'David', 'M003', 'IT', 11000);
COMMIT;


#How to find duplicate records except EmployeeID
SELECT EMPLOYEENAME, MANAGERID, DEPARTMENT, SALARY
FROM EMPLOYEE
GROUP BY 1,2,3,4
HAVING COUNT(*)>1;

SELECT *
FROM (
    SELECT *,
           COUNT(*) OVER (
               PARTITION BY EmployeeName, ManagerID, Department, Salary
           ) AS cnt
    FROM Employee
) t
WHERE cnt > 1;

#count the duplcate record except EmployeeID
SELECT EMPLOYEENAME, MANAGERID, DEPARTMENT, SALARY, COUNT(*) AS CNT
FROM EMPLOYEE 
GROUP BY 1,2,3,4
HAVING CNT>1;

#find only the uniqure recrod except EmployeeID
SELECT EMPLOYEENAME, MANAGERID, DEPARTMENT, SALARY, COUNT(*) AS CNT
FROM EMPLOYEE 
GROUP BY 1,2,3,4
HAVING CNT=1;

#remove duplicate records from table
DELETE FROM EMPLOYEE
 WHERE EMPLOYEEID IN(
SELECT EMPLOYEEID
FROM(
SELECT *, ROW_NUMBER() OVER (PARTITION BY EMPLOYEENAME, MANAGERID, DEPARTMENT, SALARY ORDER BY EMPLOYEEID) AS CNT
FROM EMPLOYEE)T
WHERE CNT>1);

WITH CNTD AS(
SELECT *, ROW_NUMBER() OVER (PARTITION BY EMPLOYEENAME,MANAGERID,DEPARTMENT,SALARY ORDER BY EMPLOYEEID) AS ROWN
FROM EMPLOYEE
)
DELETE FROM CNTD
WHERE ROWN>1; #WORKS IN SQL/POSTGRES

SELECT * FROM EMPLOYEE;

#Ques_5 : find bottom 2 salary employee details
WITH BSAL AS
(
SELECT *, DENSE_RANK() OVER(ORDER BY SALARY) AS RNK
FROM EMPLOYEE
)
SELECT EMPLOYEEID, EMPLOYEENAME,MANAGERID,DEPARTMENT,SALARY
FROM BSAL
WHERE RNK<3;

SELECT EMPLOYEEID,EMPLOYEENAME,MANAGERID,DEPARTMENT,SALARY
FROM (
SELECT *,DENSE_RANK() OVER(ORDER BY SALARY) AS RNK
FROM EMPLOYEE
) T
WHERE RNK<=2;

#Ques_6 : find top 2 salary employee details
WITH TOPSAL AS
(
SELECT *, DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RNK
FROM EMPLOYEE
)
SELECT EMPLOYEEID, EMPLOYEENAME,MANAGERID,DEPARTMENT,SALARY
FROM TOPSAL
WHERE RNK<=2;

SELECT EMPLOYEEID, EMPLOYEENAME, MANAGERID, DEPARTMENT, SALARY
FROM (
	SELECT *, DENSE_RANK() OVER (ORDER BY SALARY DESC) AS RNK
    FROM EMPLOYEE
)T
WHERE RNK<=2;

#Ques_7 : find lowest salary employee in each department
SELECT DEPARTMENT,MIN(SALARY)
FROM EMPLOYEE
GROUP BY DEPARTMENT;

#Ques_8 : find the second highest salary department wise
WITH SEC_MAX_SAL AS
(
SELECT *, DENSE_RANK() OVER (PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS SEC_MAX
FROM EMPLOYEE
)
SELECT DEPARTMENT, SALARY 
FROM SEC_MAX_SAL
WHERE  SEC_MAX=2
GROUP BY DEPARTMENT;

#Ques_9 : find the sum of  the salary department wise
SELECT DEPARTMENT, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPARTMENT;
