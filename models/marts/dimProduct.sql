select
    {{ tsql_utils.sqlserver__generate_surrogate_key(['pr.productid']) }} as product_key,
    pr.productid,
    pr.name as product_name,
    pr.productnumber,
    pr.color,
    pr.daystomanufacture,
    pr.safetystocklevel,
    pr_sc.name as product_subcategory_name,
    pr_c.name as product_category_name,
    pr.sellstartdate,
    pr.sellenddate
from {{ ref('stg_dim_product')}} as pr
left join {{ ref('stg_dim_product_subcategory')}} as pr_sc on
    pr.productsubcategoryid = pr_sc.productsubcategoryid
left join {{ ref('stg_dim_product_category')}} as pr_c on  
    pr_sc.productcategoryid = pr_c.productcategoryid
