
with test as (
select *,lag(cumulative_distance,1,cumulative_distance) over(partition by cars order by days asc) c from {{ source('SF_DBT_RAW_LAYAR_TBALES', 'CARS') }} )
select cars,days,cumulative_distance,c, cumulative_distance-c c1 from test 