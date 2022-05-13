/*
Join all table then group by hacker_id, name and filtering hackers who achived more than one challenge
*/

select h.hacker_id, h.name
from hackers as h, difficulty as d, challenges as c, submissions as s 
where s.hacker_id = h.hacker_id and s.challenge_id = c.challenge_id and
      c.difficulty_level = d.difficulty_level and s.score = d.score
group by h.hacker_id, h.name
having count(distinct(c.challenge_id))>=2
order by count(c.challenge_id) desc, h.hacker_id;