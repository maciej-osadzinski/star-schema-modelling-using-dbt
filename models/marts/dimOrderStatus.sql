select
    {{ tsql_utils.sqlserver__generate_surrogate_key(['soh.status']) }} as order_status_key,
    soh.status as order_status,
    case
        when soh.status = 1 then 'in process'
        when soh.status = 2 then 'approved'
        when soh.status = 3 then 'backordered'
        when soh.status = 4 then 'rejected'
        when soh.status = 5 then 'shipped'
        when soh.status = 6 then 'cancelled'
        else 'no status'
    end as order_status_name
from {{ ref('stg_dim_sales_order_header')}} as soh 
