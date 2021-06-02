select c1.emp_no as e1, c2.emp_no as e2 from
	(select de1.emp_no from (select emp_no from dept_emp where year(to_date) = '9999' and dept_no = "d001") as de1
		inner join (select emp_no from employees where year(birth_date) = '1955') as e1 on de1.emp_no = e1.emp_no) as c1

		inner join (select de2.emp_no from (select emp_no from dept_emp where year(to_date) = '9999' and dept_no = "d001") as de2
			inner join (select emp_no from employees where year(birth_date) = '1955') as e2 on de2.emp_no = e2.emp_no) as c2 on c1.emp_no < c2.emp_no
order by c1.emp_no, c2.emp_no;