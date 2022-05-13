select s.name
from students as s, packages as p, friends as f, packages as p1
where s.id = p.id and s.id = f.id and f.friend_id = p1.id and p.salary < p1.salary
order by p1.salary; 