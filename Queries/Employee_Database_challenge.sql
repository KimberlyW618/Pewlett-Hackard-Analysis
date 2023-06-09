-- A Retirement Titles table for employees who are born 
--between January 1, 1952 and December 31, 1955
SELECT e.emp_no,
    e.first_name,
	e.last_name,
	ti.title,
	ti.from_date, 
	ti.to_date
INTO re_title_info
FROM titles as ti
LEFT JOIN employees as e
ON (ti.emp_no = e.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM re_title_info;
-------------------------------

-- Use Dictinct with Orderby to remove duplicate 
--rows and filter out people who no longer work there
SELECT DISTINCT ON (emp_no) 
	emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM re_title_info
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, title DESC;

SELECT * FROM unique_titles;

-- A Retiring Titles table that 
--contains the number of titles 
--filled by employees who are retiring
SELECT COUNT (ut.emp_no), ut.title
INTO retiring_titles 
FROM unique_titles AS ut
GROUP BY title
ORDER BY COUNT(title)DESC;

SELECT * FROM retiring_titles;

------------------------------------
-- A query to create a Mentorship Eligibility table that holds the  
--employees who are eligible to participate in a mentorship program.
SELECT DISTINCT ON(e.emp_no) e.emp_no, 
    e.first_name, 
    e.last_name, 
    e.birth_date,
    de.from_date,
    de.to_date,
    ti.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
	WHERE ti.to_date = ('9999-01-01')
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility;
