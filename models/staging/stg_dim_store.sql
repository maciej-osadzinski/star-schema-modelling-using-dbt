with source as (

    select * from {{ source('adventure_works_sales', 'Store') }}

),

renamed as (

    select
        businessentityid,
        salespersonid,
        rowguid,
        modifieddate

    from source

)

select * from renamed