-- CTE Command table expression
with CTE AS (

    select
    TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
    DATE (TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
    HOUR (TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
    
    {{get_day_type('STARTED_AT')}} AS DAY_TYPE,

    {{get_saison('STARTED_AT')}} AS SAISION_TYPE,

    {{function1('STARTED_AT')}} AS _func_state

     

    from {{ source('demo', 'bike') }}
    where STARTED_AT not like 'started_at'

)

select * from CTE