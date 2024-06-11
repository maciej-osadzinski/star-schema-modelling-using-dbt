select 
    {{ tsql_utils.sqlserver__generate_surrogate_key(['adr.addressid']) }} as address_key,
    adr.addressid,
    adr.city, 
    adr.postalcode,
    adr.spatiallocation,
    adr.addressline1 + ' ' + coalesce(adr.addressline2, '') as address_line,
    pro.name as state_province_name,
    pro.stateprovincecode,
    pro.countryregioncode,
    pro.isonlystateprovinceflag,
    cou.name as country_region_name
from {{ ref('stg_dim_address')}} as adr
left join {{ ref('stg_dim_state_province')}} as pro on
    adr.stateprovinceid = pro.stateprovinceid
left join {{ ref('stg_dim_country_region')}} as cou on
    pro.countryregioncode = cou.countryregioncode

