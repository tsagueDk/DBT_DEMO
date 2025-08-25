With daily_weather as (
    
    select 
    date(time) as daily_weather,
    weather_main as weather,
    pressure,
    humidity,
    clouds


    from {{ source('demo', 'weather') }}
    limit 100
),

daily_weather_agg as (
    select daily_weather,
    weather,
    round(avg(pressure),2) as avg_pressure,
    round(avg(humidity),2) as avg_humidity,
    round(avg(clouds),2) as avg_clouds

    from daily_weather


    group by daily_weather, weather

)

select * from daily_weather_agg