-- 1) List the employee number, last name, first name, sex, and salary of each employee.
select emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
from employees emp 
left join salaries sal 
on (emp.emp_no = sal.emp_no);

-- 2) List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where extract(year from hire_date) = 1986;

-- 3) List the manager of each department along with their department number, department name, employee number, last name, and first name.
select dep.dept_no, depn.dept_name, dep.emp_no, emp.last_name, emp.first_name
from dept_manager dep
inner join departments depn
on (dep.dept_no = depn.dept_no)
inner join employees emp
on (dep.emp_no = emp.emp_no);

-- 4) List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select depemp.dept_no, emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
from employees as emp
inner join dept_emp as depemp
on (emp.emp_no = depemp.emp_no)
inner join departments as dep
on (depemp.dept_no = dep.dept_no);

-- 5) List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

-- 6) List each employee in the Sales department, including their employee number, last name, and first name.
select dept.emp_no, emp.last_name, emp.first_name
from dept_emp dept
inner join employees emp
on (dept.emp_no = emp.emp_no)
where dept.dept_no = 'd007'

-- 7) List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select dept.emp_no, emp.last_name, emp.first_name, dept.dept_no
from dept_emp dept
inner join employees emp
on (dept.emp_no = emp.emp_no)
where dept.dept_no = 'd007' or dept.dept_no = 'd005'

-- 8) List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc; 