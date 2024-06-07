with source_data as (

    select * from {{ source('adventure_works_production', 'ProductCategory')}}
)

select 
    ProductCategoryID,
    Name
from source_data