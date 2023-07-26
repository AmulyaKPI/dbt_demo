with emp as(
    select * from {{ ref('stg_employee') }}
)

with dept as(
    select * from {{ ref('stg_department')}}
)

with dim_emp as(
    select emp_id,
    concat(emp_fname,emp_lname) as emp_name,
    hire_date,
    sum(salary) as salary
    from emp group by dept_id
)

with dim_emp_dept as(
    select dim_emp.emp_id,
    dim_emp.emp_name,
    dim_emp.salary,
    dept.dept_name
    from dim_emp join dept on dim_emp.dept_id=dept.dept_id
)
select * from dim_emp_dept