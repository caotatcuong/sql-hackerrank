/*
Because name is just identify by occupation so when pivot then each occupation just have 1 name (max(name))
Therefore, add row id -> name is identify by occupations and Row ID -> when pivot, we have all name corresponding Occupation.
*/

select [Doctor], [Professor], [Singer], [Actor]
from (select row_number() over (partition by OCCUPATION order by name) row_id, * from occupations) as tmp 
PIVOT (max(name) 
       FOR occupation in ([Doctor],[Professor],[Singer],[Actor])) AS pvt;