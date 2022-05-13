/*
Get 2 table:
+ Start_date not in end_date column
+ End_date not in start_date column
Print 2 table side by side
*/

select start_date, end_date
from 
    (select row_number() over (order by start_date) row_id, start_date
    from projects
    where start_date not in (select end_date from projects)) as tmp1,
    (select row_number() over (order by end_date) row_id, end_date
    from projects
    where end_date not in (select start_date from projects)) as tmp2
where tmp1.row_id = tmp2.row_id
order by datediff(day,tmp1.start_date,tmp2.end_date), tmp1.start_date;