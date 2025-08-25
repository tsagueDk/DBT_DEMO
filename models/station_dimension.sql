WITH BIKE as (

    select 
    start_statio_id as station_id,
    start_station_name,
    start_lat,
    start_lng

    from {{ source('demo', 'bike') }} 
    where Ride_id != 'Ride_id'
)

select * from BIKE