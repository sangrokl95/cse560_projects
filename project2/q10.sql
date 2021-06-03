with
	h as (select e1.emp_no, s1.salary, e1.hire_date from
		(select emp_no, hire_date from employees where year(birth_date) = '1965') as e1,
		(select emp_no, salary from salaries where year(to_date) = '9999') as s1
	where e1.emp_no = s1.emp_no),

	l as (select e2.emp_no, s2.salary, e2.hire_date from
		(select emp_no, hire_date from employees where year(birth_date) = '1965') as e2,
		(select emp_no, salary from salaries where year(to_date) = '9999') as s2
	where e2.emp_no = s2.emp_no)

select h.emp_no as h_empno, h.salary as h_salary, h.hire_date as h_date, l.emp_no as l_empno, l.salary as l_salary, l.hire_date as l_date from h, l
where h.salary > l.salary and h.hire_date > l.hire_date
order by h.emp_no, l.emp_no;