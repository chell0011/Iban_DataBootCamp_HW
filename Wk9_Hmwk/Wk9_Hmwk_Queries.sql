-------- ####### ---------
-------- QUERIES ---------
-------- ####### ---------

/*Data Analysis 1 - List the following details of each employee: 
employee number, last name, first name, gender, and salary
Tables - employees and salary */
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e 
LEFT JOIN salaries s
  ON e.emp_no = s.emp_no
ORDER BY emp_no;


/*Data Analysis 2 - List employees who were hired in 1986. 
Table - employees */
SELECT * FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;


/*Data Analysis 3 - List the manager of each department with 
the following information: department number, department name, 
the manager's employee number, last name, first name, and start 
and end employment dates. 
Tables - departments, dept_manager, dept_empl, and employees */ 
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, e.hire_date, de.to_date
FROM dept_manager dm
LEFT JOIN departments d
  ON dm.dept_no = d.dept_no
LEFT JOIN employees e 
  ON dm.emp_no = e.emp_no
LEFT JOIN dept_emp de 
  ON dm.emp_no = de.emp_no
ORDER BY dept_no;


/*Data Analysis 4 - List the department 
of each employee with the following information: 
employee number, last name, first name, and department name.
Tables employees, dept_emp, departments */
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
LEFT JOIN employees e 
  ON de.emp_no = e.emp_no
LEFT JOIN departments d
  ON de.dept_no = d.dept_no
ORDER BY de.emp_no;


/*Data Analysis 5 - List all employees whose 
first name is "Hercules" and last names begin with "B."
Table - employees */
SELECT * FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%'
ORDER BY emp_no;


/*Data Analysis 6 - List all employees in the Sales department, 
including their employee number, last name, first name, 
and department name.
Tables - dept_emp, employees, departments */
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
LEFT JOIN employees e 
  ON de.emp_no = e.emp_no
LEFT JOIN departments d
  ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales'
ORDER BY emp_no;


/*Data Analysis 7 - List all employees in the Sales 
and Development departments, including their employee number, 
last name, first name, and department name.
Tables - dept_emp, employees, departments */
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
LEFT JOIN employees e 
  ON de.emp_no = e.emp_no
LEFT JOIN departments d
  ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'
ORDER BY emp_no;


/*Data Analysis 8 - In descending order, list the frequency 
count of employee last names, i.e., how many employees share 
each last name.
Table - employees */
SELECT last_name, COUNT(*) 
FROM employees 
GROUP BY last_name
ORDER BY COUNT DESC;

