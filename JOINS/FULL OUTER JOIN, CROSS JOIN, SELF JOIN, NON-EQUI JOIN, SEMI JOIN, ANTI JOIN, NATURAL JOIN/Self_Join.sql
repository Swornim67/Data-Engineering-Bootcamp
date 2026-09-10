-- Self Join

-- > A table which joins by itself.

-- REMEMBER THIS = JUST REPLACE THE ALIAS NAMING IN THE QUERY.


select * from employees;


-- Find the employee and their manager name 
select 
e.employee_id,
e.employee_name as Employee_name,
m.employee_name as Manager_name
from employees e 
left join employees m 
on e.manager_id=m.employee_id;



-- Find people with no manager.
select 
e.employee_id,e.employee_name
from employees e 
left join employees m
on e.manager_id=m.employee_id
where e.manager_id is null;

-- Find Employee reporting to anurag. 

select 
e.employee_id,
e.employee_name,
m.employee_name as `Manager`
from employees e 
left join employees m 
on e.manager_id=m.employee_id
WHERE m.employee_name = 'Anurag'



