-- STEP 1-5 - RETREIVING INFO
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date 
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t 
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31');

-- CHECKING IF CORRECT
SELECT * FROM retirement_titles;

--SETUP FOR 8
SELECT rt.emp_no, rt.first_name, rt.last_name, rt.title
FROM retirement_titles as rt

--8- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no, rt.first_name, rt.last_name, rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no, to_date DESC;
--SAVED THE unique_titles.CSV IN DATA--

--16--# OF UNIQUE TITLES
SELECT COUNT ( DISTINCT title ) AS "Distinct Titles"
FROM unique_titles;
--RETURNED-- VALUE: 7

--17-- LIST of the Distinct titles
SELECT DISTINCT ( title ) AS "Distinct Titles"
FROM unique_titles;

--17-21- RETIRING TITLES WITH COUNTS - NEW CSV-
SELECT title, COUNT(*) AS "count"
INTO retiring_titles
FROM unique_titles 
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles



