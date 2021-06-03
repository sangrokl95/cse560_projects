with recursive title_path (src, dst) as (
    select distinct t1.title as src, t2.title as dst from titles as t1
		inner join titles as t2 on t1.emp_no = t2.emp_no
	where t1.to_date = t2.from_date and t1.from_date < t2.from_date
    
    union distinct
    
    select c1.src, tp.dst from
		(select distinct t1.title as src, t2.title as dst from titles as t1
			inner join titles as t2 on t1.emp_no = t2.emp_no
		where t1.to_date = t2.from_date and t1.from_date < t2.from_date) as c1, title_path as tp
	where c1.dst = tp.src
)

select t3.title as src, t4.title as dst from
	(select distinct title from titles) as t3,
	(select distinct title from titles) as t4
where (t3.title, t4.title) not in (select tp.src, tp.dst from title_path as tp)
order by t3.title, t4.title;