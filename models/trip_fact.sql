WITH TRIPS as (

    select 
    Ride_id,
    Rideable_type,
    TO_TIMESTAMP(STARTED_AT) as TRIP_DATE,
    DATE(TRIP_DATE) as trip_date_agg,
    start_statio_id as start_station_id,
    END_statio_ID as END_station_ID,
    MEMBER_CSUAL as MEMBER_CASUAL,
    TIMESTAMPDIFF (SECOND, TO_TIMESTAMP(STARTED_AT) , TO_TIMESTAMP(ENDED_AT)) as trip_date_diff,


    from {{ source('demo', 'bike') }} 
    where Ride_id != 'Ride_id'

    limit 10
)

select * from TRIPS