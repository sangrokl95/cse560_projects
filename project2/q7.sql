select dm.emp_no, d.dept_name from (select * from dept_manager where year(to_date) <> '9999') as dm
	left join
		(select dm2.emp_no, dm2.dept_no from
			(select * from dept_manager where year(to_date) <> '9999') as dm1,
			(select * from dept_manager where year(to_date) <> '9999') as dm2
		where dm1.dept_no = dm2.dept_no
			and datediff(dm1.to_date, dm1.from_date) > datediff(dm2.to_date, dm2.from_date)) as c1
	on dm.emp_no = c1.emp_no
	inner join departments as d on dm.dept_no = d.dept_no
where c1.emp_no is null
order by dm.emp_no;