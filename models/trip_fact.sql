WITH TRIPS as (

    select 
    Ride_id,
    TO_TIMESTAMP(STARTED_AT) as TRIP_DATE,
    DATE(TRIP_DATE) as trip_date_agg,
    start_station_id,
    END_station_ID,
    MEMBER_CASUAL,
    TIMESTAMPDIFF (SECOND, TO_TIMESTAMP(STARTED_AT) , TO_TIMESTAMP(ENDED_AT)) as trip_date_diff,


    from {{ source('demo', 'bike') }} 

    limit 10
)

select * from TRIPS