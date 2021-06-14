-- STEP 1-5 - RETREIVING INFO
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date 
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t 
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31');

--Checking if Correct
SELECT * FROM unique_titles;

--Returning a value for how many distinct titles
SELECT COUNT(titles)
FROM unique_titles;

--Preping for table of number of distinct titles
SELECT rt.emp_no, rt.first_name, rt.last_name, rt.title
FROM retirement_titles as rt;

--PREP for table made of distinct titles in this group and organized by count #
SELECT DISTINCT ON (rt.emp_no) rt.emp_no, rt.first_name, rt.last_name, rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no, to_date DESC;

--Checking if correct
SELECT * FROM unique_titles;

SELECT DISTINCT ( title ) AS "Distinct Titles"
FROM unique_titles;

--Table made of distinct titles in this group and organized by count #
SELECT title, COUNT(*) AS "count"
INTO retiring_titles
FROM unique_titles 
GROUP BY title
ORDER BY count DESC;

--Checking if correct data returned/saved
SELECT * FROM retiring_titles

--Creating table from 3 original tables, sorted by emp_id, saved as new mentorship_eligibility.csv
SELECT DISTINCT ON (emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibility
From employees as e
	INNER JOIN titles as t
	ON (e.emp_no = t.emp_no)
	INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
	WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
	ORDER BY emp_no; 
