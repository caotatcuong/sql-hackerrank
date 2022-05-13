/*
count(f1.X)>=2 requires there to be at least two records when f1.X = f1.Y
f1.X<f1.Y to remove duplicate in final output
*/

select f1.X, f1.Y
from functions as f1, functions as f2
where f1.X=f2.Y and f1.Y=f2.X
group by f1.X, f1.Y
having count(f1.X)>=2 or f1.X<f1.Y
order by f1.X;