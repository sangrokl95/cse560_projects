select d.dept_name, count(de.emp_no) as noe from dept_emp as de
	inner join departments as d on de.dept_no = d.dept_no
group by de.dept_no
order by d.dept_name;