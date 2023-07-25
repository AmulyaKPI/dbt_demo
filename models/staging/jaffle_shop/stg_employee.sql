with emp as(
    select emp_id,
    emp_fname,
    emp_lname,
    hiredate,
    salary,
    dept_id from {{ source('jaffle_shop','employee') }}
)
select * from emp