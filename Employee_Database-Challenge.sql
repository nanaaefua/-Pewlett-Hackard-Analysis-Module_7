-- creat a table to show only most recent title for the employees that are employed. The retiring employees information is being used here for the years between 
SELECT 
	e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO ret_titles_to_submit
FROM employees as e
INNER JOIN titles as ti
		ON(e.emp_no = ti.emp_no)
		WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;
SELECT * FROM ret_titles_to_submit;


SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
	INNER JOIN titles as ti
		ON(e.emp_no = ti.emp_no)
ORDER BY e.emp_no;

-- Partition the data to show only most recent title per employee

SELECT DISTINCT ON (rt.emp_no)
			rt.emp_no,
			rt.first_name,
			rt.last_name,
			rt.title
INTO unique_titles_to_submit
FROM ret_titles_to_submit as rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;
SELECT * FROM unique_titles_to_submit;

--- The second part of the question
SELECT COUNT (title), title
INTO retiring_titles_to_submit
FROM unique_titles_to_submit as ur
GROUP BY title
ORDER BY COUNT title, DESC;
SELECT * FROM retiring_titles_to_submit;

--Mentorship data
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship
FROM employees as e
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
	ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;
SELECT * FROM mentorship;




