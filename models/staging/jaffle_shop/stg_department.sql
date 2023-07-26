with dept as(
    select dept_id,
    dept_name,
    location 
    from {{ source('jaffle_shop','department') }} 
)
select * from dept