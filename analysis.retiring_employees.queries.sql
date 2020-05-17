-- To get the latest retiring employee title 
-- for the query, I replaced the inner join with 
-- the title table with an inner query using the
-- title table the generated a derived row number
-- field that listed an retiring employee's titles
-- by row number with the employee's current title
-- always having the row number = 1

SELECT  e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		t.from_date AS title_from_date,
		s.Salary
INTO 	retiring_employees
FROM 	employees e
INNER JOIN (
	SELECT	emp_no,
			title,
			from_date,
			ROW_NUMBER() OVER (PARTITION BY (emp_no) ORDER BY to_date DESC) rn
	FROM   	title
) t
ON 		e.emp_no = t.emp_no
INNER JOIN 
		salaries s
ON 		e.emp_no = s.emp_no
WHERE 	e.birth_date BETWEEN '1/1/1952' AND '12/31/1955'
AND	  	t.rn = 1
ORDER BY emp_no;


-- To get the count of retiring employees by
-- title, used the retiring_employees table
-- generated about and group by title. 
SELECT title,
	   COUNT(*) AS retiring_title_count
INTO   retiring_employees_count_by_title
FROM   retiring_employees
GROUP BY title
ORDER BY COUNT(*);retiring_employees_count_by_title

-- The title field of the 
-- retiring_employees_count_by_title tabe
-- contains the unique list of the current 
-- titles of the retiring employees.
SELECT title
INTO   retiring_employees_titles
FROM   retiring_employees_count_by_title
ORDER BY title;

-- The requirement for the employee mentorship cadidate
-- query was not well defined. It stated that the query
-- required TWO inner joins.
--
--  "You’ll need to use two inner joins to 
--   create this new table."
--
-- If the query used the from_date and to_date fields 
-- from the titles table, then the query would only have ONE 
-- inner join. It did not specify what additional table 
-- should be used and if the from_date or the to_date
-- field from the table to use in the second inner join
-- should be used as fields in the SELECT statement. 
--
-- I raised this issue with a TA and she stated that the
-- second inner join should be wiht the dept_emp table and
-- that the to_date and from_date in that table should be
-- used as fields in the SELECT statement.

SELECT  e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		de.from_date AS dept_from_date,
		de.to_date As dept_to_date
INTO 	employee_mentorship_candidates
FROM 	employees e
INNER JOIN
		dept_emp de
ON		e.emp_no = de.emp_no
INNER JOIN
		title t
ON 		e.emp_no = t.emp_no
WHERE 	e.birth_date BETWEEN '1/1/1965' AND '12/31/1965'
-- to_date for the current employee department assignment
AND 	de.to_date = '9999-01-01'
-- to_date for the current employee title
AND	  	t.to_date  = '9999-01-01'
ORDER BY emp_no;