select
    {{ tsql_utils.sqlserver__generate_surrogate_key(['sod.salesorderid', 'sod.salesorderdetailid']) }} as sales_key,
    {{ tsql_utils.sqlserver__generate_surrogate_key(['productid']) }} as product_key,
    {{ tsql_utils.sqlserver__generate_surrogate_key(['customerid']) }} as customer_key,
    {{ tsql_utils.sqlserver__generate_surrogate_key(['creditcardid']) }} as credit_card_key,
    {{ tsql_utils.sqlserver__generate_surrogate_key(['shiptoaddressid']) }} as ship_address_key,
    {{ tsql_utils.sqlserver__generate_surrogate_key(['status']) }} as order_status_key,
    {{ tsql_utils.sqlserver__generate_surrogate_key(['orderdate']) }} as order_date_key,
    {{ tsql_utils.sqlserver__generate_surrogate_key(['shipdate']) }} as ship_date_key,
    {{ tsql_utils.sqlserver__generate_surrogate_key(['duedate']) }} as due_date_key,
    {{ tsql_utils.sqlserver__generate_surrogate_key(['territoryid']) }} as territory_key,
    sod.salesorderid,
    sod.salesorderdetailid,
    sod.unitprice,
    sod.orderqty,
    sod.unitpricediscount,
    sod.linetotal,
    soh.taxamt,
    soh.orderdate,
    soh.salesordernumber,
    soh.onlineorderflag,
    case
        when sod.unitpricediscount > 0
        then (sod.linetotal ) * sod.unitpricediscount
        else sod.linetotal
        end as net_revenue
from {{ ref( 'stg_dim_sales_order_detail' )}} as sod
left join {{ ref( 'stg_dim_sales_order_header' )}} as soh 
    on sod.salesorderid = soh.salesorderid
