-- check for employees that were born between '52-'55 for retirement 
SELECT first_name, last_name, birth_date
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name, birth_date
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT first_name, last_name, birth_date
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT first_name, last_name, birth_date
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT first_name, last_name, birth_date
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name, birth_date
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- create new table with retirement peps 
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

-- now you can export the csv 

-- we need to add the emp_no to this, drop then recreate and resave it. 
DROP TABLE retirement_info;

SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
retirement_info.last_name,
    dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;

SELECT * FROM retirement_info;

SELECT ri.emp_no,
    ri.first_name,
	ri.last_name,
    de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

SELECT * FROM current_emp;

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO dept_re_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

SELECT * FROM dept_re_no;

-- Employee Information: A list of employees containing their unique employee number, 
-- ----- their last name, first name, gender, and salary

SELECT * FROM salaries
ORDER BY to_date DESC;

SELECT emp_no, first_name, last_name, gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM emp_info;

SELECT e.emp_no,
    e.first_name,
	e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '9999-01-01');
-- this list is 33,119 emplyees long 

-- Management: A list of managers for each department, including the department number, 
-- ----- name, and the manager's employee number, last name, first name, and the 
-- ----- starting and ending employment dates

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);


-- Department Retirees: An updated current_emp list that includes everything it 
-- ----- currently has, but also the employee's departments
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

-- list of Sales team from retirment_info
SELECT  ri.emp_no,
        ri.first_name,
        ri.last_name,
        d.dept_name
--INTO sales_info
FROM retirement_info AS ri
    INNER JOIN dept_emp AS de
        ON (ri.emp_no = de.emp_no)
	INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
WHERE d.dept_name = ('Sales');

-- list of Sales and development teams from retirment_info
SELECT  ri.emp_no,
        ri.first_name,
        ri.last_name,
        d.dept_name
--INTO sal&dev_info
FROM retirement_info AS ri
    INNER JOIN dept_emp AS de
        ON (ri.emp_no = de.emp_no)
	INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development');

