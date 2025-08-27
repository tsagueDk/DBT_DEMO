WITH correlation as (
    select t.*, w.*
    from {{ ref('trip_fact') }} t
    left join {{ ref('daily_weather') }} w
    on t.trip_date_agg = daily_weather
)

select * from correlation