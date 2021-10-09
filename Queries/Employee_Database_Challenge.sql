 -- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) 
 emp_no
,first_name
,last_name
,title

INTO unique_titles

FROM title_info

ORDER BY emp_no
, to_date DESC;


-- Number of employees by their most recent job title who are about to retire
SELECT
count(title)
,title
INTO retiring_titles

FROM unique_titles

Group by title
ORDER by count DESC;


-- Create Mentorship Eligibility table
SELECT DISTINCT ON (emp_no)
e.emp_no
,e.first_name
,e.last_name
,e.birth_date
,d.from_date
,d.to_date
,ti.title

INTO mentorship_eligibility

FROM employees e
INNER JOIN  dept_emp d on e.emp_no = d.emp_no
INNER JOIN titles ti on e.emp_no = ti.emp_no 

WHERE
(d.to_date = '9999-01-01')
AND  (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')

ORDER by emp_no;