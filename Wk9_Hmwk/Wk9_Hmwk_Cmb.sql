-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

/* Drop tables if error and re-create
DROP TABLE departments
DROP TABLE dept_emp
DROP TABLE dept_manager
DROP TABLE employees
DROP TABLE salaries
DROP TABLE titles
*/

--Create tables
CREATE TABLE "departments" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "dept_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "de_id" SERIAL   NOT NULL,
    "emp_no" VARCHAR(10)   NOT NULL,
    "dept_no" VARCHAR(10)   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "de_id"
     )
);

CREATE TABLE "dept_manager" (
    "dm_id" SERIAL   NOT NULL,
    "dept_no" VARCHAR(10)   NOT NULL,
    "emp_no" VARCHAR(10)   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dm_id"
     )
);

CREATE TABLE "employees" (
    "emp_no" VARCHAR(10)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "gender" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "sal_id" SERIAL   NOT NULL,
    "emp_no" VARCHAR(10)   NOT NULL,
    "salary" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "sal_id"
     )
);

CREATE TABLE "titles" (
    "title_id" SERIAL   NOT NULL,
    "emp_no" VARCHAR(10)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

--Assign FK
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

--Import data
--6 csv files in data folder (departments and employees first; then other tables due to fk) 

--Verify data imported 
SELECT * FROM departments
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM employees
SELECT * FROM salaries
SELECT * FROM titles

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

