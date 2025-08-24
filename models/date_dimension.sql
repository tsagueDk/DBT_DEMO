-- CTE Command table expression
with CTE AS (

    select
    TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
    DATE (TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
    HOUR (TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
    CASE
      WHEN DAYNAME(TO_TIMESTAMP(STARTED_AT)) in ('sat, sun') then 'WEEKEND'
    ELSE
      'BUSINESS_DAY'

    END AS DAY_TYPE,

    CASE
      WHEN MONTH (TO_TIMESTAMP(STARTED_AT)) in (12,1,2) then 'WINTER'
      WHEN MONTH (TO_TIMESTAMP(STARTED_AT)) in (3,4,5) then 'SPRING'
      WHEN MONTH (TO_TIMESTAMP(STARTED_AT)) in (6,7,8) then 'SUMMER'
    ELSE 'AUTUMN'

    END AS SAISON

     

    from {{ source('demo', 'bike') }}
    where STARTED_AT not like 'started_at'

)

select * from CTE