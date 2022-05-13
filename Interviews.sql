/*
First, Sum individually each table VIEW_STATS and SUBMISSION_STATS
Second, Join all table to get necessary output
note: Not necessary that all CHALLENGE_ID have a value in VIEW_STATS and/or SUBMISSION_STATS -> LEFT JOIN
*/

with sum_view_stats as (
select challenge_id, sum(total_views) as total_views, sum(total_unique_views) as total_unique_views
from view_stats 
group by challenge_id
),
sum_submission_stats as (
select challenge_id ,sum(total_submissions) as total_submissions, sum(total_accepted_submissions) as total_accepted_submissions
from submission_stats 
group by challenge_id
)

select ct.contest_id, ct.hacker_id, ct.name, sum(s.total_submissions), sum(s.total_accepted_submissions), sum(v.total_views), sum(v.total_unique_views  )
from contests as ct inner join colleges as cl on ct.contest_id = cl.contest_id
     inner join challenges as ch on cl.college_id = ch.college_id
     left join sum_view_stats as v on ch.challenge_id = v.challenge_id
     left join sum_submission_stats as s on ch.challenge_id  = s.challenge_id 
group by ct.contest_id, ct.hacker_id, ct.name
order by ct.contest_id;