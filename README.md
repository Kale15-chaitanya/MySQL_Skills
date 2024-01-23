# MySQL_Skills
This repository has all my MySQL hands-on done in Coding Inavders internship
Capstone Project 1
A company is in need of a system to manage and store information about its employees. 
The company wants to track employee information such as employee ID, first name, last name, department, salary, hire date and email.
CREATE TABLE Employee_hr_data (
    Employee_ID INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary INT NOT NULL,
    Hire_Date DATE NOT NULL);
INSERT INTO Employee_hr_data (Employee_ID, First_Name, Last_Name, Department, Salary, Hire_Date)
VALUES
  (1, 'Rahul', 'Sharma', 'IT', 50000, '2022-01-01'),
  (2, 'Priya', 'Singh', 'HR', 45000, '2022-02-01'),
  (3, 'Amit', 'Patel', 'Finance', 55000, '2022-03-01'),
  (4, 'Anjali', 'Jain', 'Marketing', 40000, '2022-04-01'),
  (5, 'Sanjay', 'Gupta', 'Marketing', 60000, '2022-05-01');    
