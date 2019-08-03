--List the following details of each employee: employee number, last name,
--first name, gender, and salary.
--Question 1
select
e.emp_no,
e.first_name,
e.last_name,
e.gender,
s.salary
from Employees e
join Salaries s on e.emp_no = s.emp_no;


--List employees who were hired in 1986.
--Question 2
select
first_name,
last_name,
hire_date
from
Employees
where
hire_date between '1986-01-01' and '1986-12-31';

select
first_name,
last_name,
hire_date
from
Employees
where
date_part('year',hire_date) = '1986';

--List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name,first name, and start and end employment dates.
--Question 3
select dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, e.hire_date, dm.to_date
  from Employees e, Dept_Manager dm, Department d
  where dm.dept_no = d.dept_no
  	and	dm.emp_no = e.emp_no;
	

--List the department of each employee with the following information: employee number,
--last name, first name, and department name.
--Question 4
select e.emp_no, e.first_name, e.last_name, d.dept_name
 from Employees e, Department d, Dept_emp de
 where e.emp_no = de.emp_no
  and d.dept_no = de.dept_no
 order by e.emp_no;
 
--List all employees whose first name is "Hercules" and last names begin with "B."
--Question 5
select  first_name, last_name
from Employees
where first_name = 'Hercules'
AND last_name like 'B%';

--List all employees in the Sales department, including their employee number,
--last name, first name, and department name.
--Question 6
select d.dept_name, e.emp_no, e.last_name, e.first_name
  from Department d, Employees e, Dept_emp de 
  where d.dept_name in
 (
      select d.dept_name
      from Department
      where d.dept_name = 'Sales'
)
   and e.emp_no = de.emp_no
   and de.dept_no = d.dept_no;
   
 


--List all employees in the Sales and Development departments,
--their employee number, last name, first name, and department name.
--Question 7

select d.dept_name, e.emp_no, e.last_name, e.first_name
  from Department d, Employees e, Dept_emp de 
  where d.dept_name in
 (
      select d.dept_name
      from Department
      where d.dept_name in ('Sales', 'Development')
)

   and e.emp_no = de.emp_no
   and de.dept_no = d.dept_no;
    
   
--In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.
--Question 8

SELECT last_name, COUNT(last_name) AS "Employees count"
FROM Employees
GROUP BY last_name
ORDER BY "Employees count" DESC;



