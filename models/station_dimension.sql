WITH BIKE as (

    select 
    *

    from {{ source('demo', 'bike') }} 
)

select * from BIKE