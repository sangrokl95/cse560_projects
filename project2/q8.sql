select d.dept_name, count(dm.emp_no) as cnt from (select * from dept_manager where year(to_date) <> '9999') as dm
	inner join departments as d on dm.dept_no = d.dept_no
group by dm.dept_no
having cnt > 1
order by d.dept_name;