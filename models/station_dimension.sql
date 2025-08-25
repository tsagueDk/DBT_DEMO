WITH BIKE as (

    select 
    *

    from {{ source('demo', 'bike') }} 
    where Ride_id != 'Ride_id'
)

select * from BIKE