select iif(grade > 7, name, null), grade, marks
from students, grades
where marks <= max_mark and marks >= min_mark
order by grade desc, name;