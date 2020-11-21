--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.empID, lastname, firstname, gender, salary 
FROM employee e
JOIN salary s ON e.empID = s.empID;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT firstname, lastname, hiredate
FROM employee
WHERE hiredate >= '1986-01-01' and hiredate < '1987-01-01';

--List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.
with dept_info as (
	SELECT m.deptID, empID, name
	FROM dept_manager m
	INNER JOIN department d on m.deptID = d.deptID
)
SELECT i.deptID, name, e.empID, firstname, lastname
FROM dept_info i
LEFT JOIN employee e on i.empID = e.empID;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
with dept_info as (
	SELECT e.deptID, empID, name
	FROM dept_employee e
	INNER JOIN department d on e.deptID = d.deptID
)
SELECT name, e.empID, lastname, firstname
FROM dept_info i
LEFT JOIN employee e on i.empID = e.empID;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT firstname, lastname, gender
FROM employee
WHERE firstname = 'Hercules' and lastname like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
with dept_info as (
	SELECT empID, name
	FROM dept_employee e
	INNER JOIN department d on e.deptID = d.deptID
)
SELECT i.empID, lastname, firstname, name
FROM dept_info i
LEFT JOIN employee e on i.empID = e.empID
WHERE name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
with dept_info as (
	SELECT empID, name
	FROM dept_employee e
	INNER JOIN department d on e.deptID = d.deptID
	WHERE name = 'Sales' or name = 'Development'
)
SELECT i.empID, lastname, firstname, name
FROM dept_info i
LEFT JOIN employee e on i.empID = e.empID;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT lastname, COUNT(*)
FROM employee
GROUP BY lastname
ORDER BY count desc, lastname asc
