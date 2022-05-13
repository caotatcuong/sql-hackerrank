/*
First, We have employee table have all columns we need, so just join company tabel to get name founder
Second, After joining, group by company_code to count total number of lead managers, senior managers, managers, and employees.
*/

select c.company_code, c.founder, count(distinct(lead_manager_code)), count(distinct(senior_manager_code)),
       count(distinct(manager_code)), count(distinct(employee_code))
from company as c, employee e 
where c.company_code = e.company_code 
group by c.company_code, c.founder
order by c.company_code;