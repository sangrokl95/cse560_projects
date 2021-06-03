select d.dept_name, c.emp_no, c.salary from
	(select emp_no, dept_no,
		(select salary from salaries as s where year(to_date) = '9999' and de.emp_no = s.emp_no) as salary
	from dept_emp as de where year(to_date) = '9999') as c
    
	left join
    
		(select distinct c1.emp_no from 
		(select de1.emp_no, de1.dept_no, s1.salary from
			(select emp_no, dept_no from dept_emp where year(to_date) = '9999') as de1,
			(select emp_no, salary from salaries where year(to_date) = '9999') as s1
		where de1.emp_no = s1.emp_no) as c1,
        
		(select de2.dept_no, s2.salary from
			(select emp_no, dept_no from dept_emp where year(to_date) = '9999') as de2,
			(select emp_no, salary from salaries where year(to_date) = '9999') as s2
		where de2.emp_no = s2.emp_no) as c2
		where c1.dept_no = c2.dept_no and c1.salary < c2.salary) as c3
        
	on c.emp_no = c3.emp_no
    
    inner join departments as d on c.dept_no = d.dept_no
    
where c3.emp_no is null
order by d.dept_name;