select de.emp_no, d.dept_name, de.from_date from dept_emp as de
	inner join departments as d on de.dept_no = d.dept_no
where year(de.to_date) = '9999'
order by de.emp_no;