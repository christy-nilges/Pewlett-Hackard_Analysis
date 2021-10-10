--Eligible employees for mentorship by dept
SELECT DISTINCT ON (me.emp_no)
Count(me.emp_no)
,d.dept_name

FROM mentorship_eligibility me
INNER JOIN  dept_emp de on me.emp_no = de.emp_no
INNER JOIN departments d on de.dept_no = d.dept_no 

GROUP by d.dept_name;


--Eligible employees for retirment by dept
SELECT DISTINCT ON (ut.emp_no)
Count(ut.emp_no)
,d.dept_name

FROM unique_titles ut
INNER JOIN  dept_emp de on ut.emp_no = de.emp_no
INNER JOIN departments d on de.dept_no = d.dept_no


GROUP by 
d.dept_name
,ut.emp_no;
