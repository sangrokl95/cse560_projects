select d.dept_name, (count(*) / c1.num_emp) * 100 as above_avg_pect from 
	(select de.emp_no, de.dept_no, s.salary from (select * from dept_emp where year(to_date) = '9999') as de
		left join (select * from salaries where year(to_date) = '9999') as s on de.emp_no = s.emp_no) as c
	
    left join
    
		(select de1.dept_no, count(de1.emp_no) as num_emp, avg(s1.salary) as avg_sal from (select * from dept_emp where year(to_date) = '9999') as de1
			left join (select * from salaries where year(to_date) = '9999') as s1 on de1.emp_no = s1.emp_no
		group by de1.dept_no) as c1
    
    on c.dept_no = c1.dept_no
    
    left join departments as d on c.dept_no = d.dept_no
    
where c.salary > c1.avg_sal
group by c.dept_no
order by d.dept_name;