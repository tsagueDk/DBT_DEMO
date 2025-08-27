With crime_in_newyork as(
    select 
    *

    from {{ source('crime', 'URBAN_CRIME_INCIDENT_LOG') }}
    where OFFENSE_CATEGORY in ('Theft','Driving Under The Influence') and  city like ('New York')
   
)

    select 
    OFFENSE_CATEGORY,
    {{get_saison('DATE')}} AS season,
    {{get_day_type('DATE')}} AS DAY_TYPE,
    COUNT(OFFENSE_CATEGORY) as NUMBER_OF_OCCURRENCES

    from crime_in_newyork
    group by OFFENSE_CATEGORY,season,DAY_TYPE
    ORDER by NUMBER_OF_OCCURRENCES desc