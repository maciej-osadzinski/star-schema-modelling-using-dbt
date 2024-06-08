with stg_date as (
    select * from {{ref('stg_dim_date')}}
)

select 
    {{ tsql_utils.sqlserver__generate_surrogate_key(['date_value']) }} as date_key,
    *
from stg_date
        