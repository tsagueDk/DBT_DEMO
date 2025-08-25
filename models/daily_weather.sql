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
    count(weather),

    ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) desc ) AS row_number


    from daily_weather

    group by daily_weather, weather
    qualify ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) desc ) = 1

)

select * from daily_weather_agg