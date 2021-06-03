select t.emp_no, count(*) as cnt from titles as t
	left join salaries as s on t.emp_no = s.emp_no and t.from_date = s.from_date
where s.emp_no is null
group by t.emp_no
order by t.emp_no