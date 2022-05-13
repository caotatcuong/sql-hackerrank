-- Count num submission of each hacker by day
with sub_count as 
    (select submission_date, hacker_id, count(submission_id) as num_submits
     from submissions
     group by submission_date, hacker_id),

--  Add row_id partition by submission date
sub_count_partition_by_date as 
    (select submission_date, hacker_id, num_submits, 
     row_number() over (partition by submission_date order by num_submits desc, hacker_id) as row_id
     from sub_count),

-- Get distinct submission date 
submision_date_distinct as 
    (select distinct tmp.submission_date, row_number() over (order by submission_date) as row_id 
     from (select distinct submission_date from submissions) as tmp),
     
-- With each date from submision_date_distinct then hacker must have submission from start date to current date
hacker_submit_series_days as 
    (select sub_date.submission_date, sub_date.row_id, sub_count.hacker_id, count(sub_count.submission_date) as num_date_submit
     from submision_date_distinct as sub_date, sub_count 
     where  sub_count.submission_date <= sub_date.submission_date  
     group by sub_date.submission_date, sub_date.row_id, sub_count.hacker_id
     having count(*) = sub_date.row_id)
    
select hs.submission_date, count(hs.hacker_id), h.hacker_id, h.name 
from hacker_submit_series_days as hs, sub_count_partition_by_date s, hackers as h
where hs.submission_date = s.submission_date and s.row_id = 1 and s.hacker_id = h.hacker_id
group by hs.submission_date, h.hacker_id, h.name 
order by hs.submission_date
