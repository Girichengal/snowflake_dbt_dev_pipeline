{% macro sales_amt(name,mon) %}

select case 
 when '{{name}}' not in (select salesperson from SALES) or  '{{mon}}' not in (select month from SALES) then '00000'
 when '{{name}}' in (select salesperson from SALES) and  '{{mon}}' in (select month from SALES) then Amount end as amount

from SALES --where salesperson = '{{name}}' and month = '{{mon}}'

{% endmacro %}