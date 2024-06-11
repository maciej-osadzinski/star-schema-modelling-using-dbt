select
    {{ tsql_utils.sqlserver__generate_surrogate_key(['territoryid']) }} as sales_territory_key,
    territoryid,
    name,
    countryregioncode,
    costytd,
    salesytd,
    costlastyear,
    saleslastyear    
from {{ ref('stg_dim_sales_territory')}}