/*
First, Count num challenges of each hacker
Second, Get hacker who have max num challenges or not same num challenges
*/

with tmp as
(select h.hacker_id, h.name, count(*) as num_challenges
from hackers as h, challenges as c
where h.hacker_id = c.hacker_id
group by h.hacker_id, h.name)

select hacker_id, name, num_challenges
from tmp
where num_challenges = (select max(num_challenges) from tmp)
or num_challenges in (select num_challenges 
                      from tmp
                      group by num_challenges
                      having count(*)=1)
ORDER BY num_challenges desc, hacker_id;       