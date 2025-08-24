select
*
-- from {{ source('demo', 'bike') }}
from {{ ref('my_second_dbt_model') }}

limit 10