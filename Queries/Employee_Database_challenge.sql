SELECT * FROM employees

--Retrieve the employee number, first name and last name from Employees table
SELECT emp_no, first_name, last_name
FROM employees;

--Retrieve title, from date and to date from titles
SELECT title, from_date, to_date
FROM titles;

SELECT * FROM titles
--Create a new table using the INTO clause
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e 
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date between '1952-01-01' and '1955-12-31')
ORDER BY e.emp_no

SELECT * FROM retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles

--Get number of employees by unique titles
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count desc

--Deliverable 2
--Retrieve emp_no, first_name, last_name and birth_date columns from the employees table
SELECT emp_no, first_name, last_name, birth_date
FROM employees;

--Retrieve from_date and to_date from Dept Employees table
SELECT from_date, to_date
FROM dept_emp

--Retrieve title from Titles table
SELECT title
FROM titles

--Use distinct on to get first occurrence of employee numbers
SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date, 
de.from_date, 
de.to_date, 
t.title
INTO mentorship_eligibility
FROM employees as e 
LEFT OUTER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
LEFT OUTER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date between '1965-01-01' and '1965-12-31' 
	   AND de.to_date = '9999-01-01')
ORDER BY e.emp_no

SELECT * FROM mentorship_eligibility
