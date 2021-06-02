with recursive title_path (src, dst, years) as (
    select c1.src, c1.dst, c1.avg_years from
		(select distinct t1.title as src, t2.title as dst, avg(year(t1.to_date) - year(t1.from_date) + 1) as avg_years from titles as t1
			inner join titles as t2 on t1.emp_no = t2.emp_no
		where t1.to_date = t2.from_date and t1.from_date < t2.from_date
        group by t1.title, t2.title) as c1
    
    union distinct
    
    select c1.src, tp.dst, (c1.avg_years + tp.years) from
		(select distinct t1.title as src, t2.title as dst, avg(year(t1.to_date) - year(t1.from_date) + 1) as avg_years from titles as t1
			inner join titles as t2 on t1.emp_no = t2.emp_no
		where t1.to_date = t2.from_date and t1.from_date < t2.from_date
        group by t1.title, t2.title) as c1, title_path as tp
	where c1.dst = tp.src and tp.years < 30
)

select src, dst, min(years) as years from title_path as tp
group by src, dst
order by src, dst;