{% macro get_saison(x) %}
    CASE
      WHEN MONTH (TO_TIMESTAMP({{x}})) in (12,1,2) then 'WINTER'
      WHEN MONTH (TO_TIMESTAMP({{x}})) in (3,4,5) then 'SPRING'
      WHEN MONTH (TO_TIMESTAMP({{x}})) in (6,7,8) then 'SUMMER'
    ELSE 'AUTUMN'
    END
{% endmacro %}

{% macro day_type(x) %}
    CASE 
        WHEN DAYNAME({{x}}) IN ('Sat', 'Sun') THEN 'WEEKEND'
        ELSE 'BUSINESSDAY' 
    END
{% endmacro %}