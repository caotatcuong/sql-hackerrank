/*
Write subquery to get the minimum number of gold galleons needed to buy wand of high power and age
*/
select w.id, wp.age, w.coins_needed, w.power
from wands as w, wands_property as wp
where w.code = wp.code and wp.is_evil = 0 and
w.coins_needed = (select min(w1.coins_needed) 
                  from wands as w1, wands_property as wp1 
                  where w1.code = wp1.code and wp1.age=  wp.age and w1.power = w.power)
order by w.power desc, wp.age desc;
