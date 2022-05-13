/*
First, get max socre of each challenge beacuse hacker can submit one challenge many times
Second, The total score of a hacker is the sum of their maximum scores for all of the challenges. 
*/

select hacker_id, name, sum(score)
from 
    (select h.hacker_id, h.name, max(s.score) as score
    from hackers as h, submissions as s
    where h.hacker_id = s.hacker_id
    group by h.hacker_id, h.name, s.challenge_id) as t
group by hacker_id, name
having sum(score)>0
order by SUM(score) desc, hacker_id;