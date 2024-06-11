select 
    {{ tsql_utils.sqlserver__generate_surrogate_key(['cus.customerid']) }} as customer_key,
    cus.customerid,
    cus.accountnumber,
    per.persontype,
    per.title,
    per.firstname,
    per.middlename,
    per.lastname,
    per.namestyle,
    per.suffix,
    per.emailpromotion
from {{ ref('stg_dim_customer')}} as cus
left join {{ ref('stg_dim_person')}} as per 
    on cus.personid = per.businessentityid
where persontype = 'IN'

