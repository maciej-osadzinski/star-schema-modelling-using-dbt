with source as (

    select * from {{ source('adventure_works_production', 'ProductSubcategory') }}

),

renamed as (

    select
        productsubcategoryid,
        productcategoryid,
        rowguid,
        modifieddate,
        name

    from source

)

select * from renamed