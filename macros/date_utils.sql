{% macro function1(x) %}
   CASE WHEN TO_TIMESTAMP({{x}}) < CURRENT_DATE  THEN 'PAST'
    ELSE 'FUTURE' END
{% endmacro %}

{% macro get_day_type(x) %}
    CASE 
        WHEN DAYNAME({{x}}) IN ('Sat', 'Sun') THEN 'WEEKEND'
        ELSE 'BUSINESSDAY' 
    END
{% endmacro %}
