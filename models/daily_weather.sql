With daily_weather as (
    
    select 
    date(time) as daily_weather,
    weather,
    pressure,
    humidity,
    clouds


    from {{ source('demo', 'weather') }}
),

daily_weather_agg as (
    select daily_weather,
    weather,
    count(weather),

    ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) desc ) AS row_number


    from daily_weather

    group by daily_weather, weather
    qualify ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) desc ) = 1

),

daily_by_year as (
    select *,
    YEAR(daily_weather) as weather_year
    from daily_weather_agg

    order by daily_weather

    
)

select * from daily_by_year