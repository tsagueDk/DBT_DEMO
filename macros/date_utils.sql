{% macro function1(x) %}
   CASE WHEN TO_TIMESTAMP({{x}}) < CURRENT_DATE  THEN 'PAST'
    ELSE 'FUTURE' END
{% endmacro %}

{% macro get_day_type(x) %}
  CASE
      WHEN DAYNAME(TO_TIMESTAMP({{x}}) )in ('sat, sun') then 'WEEKEND'
    ELSE
      'BUSINESS_DAY'

    END
{% endmacro %}