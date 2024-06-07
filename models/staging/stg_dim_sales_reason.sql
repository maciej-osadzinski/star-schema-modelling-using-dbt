with source as (

    select * from {{ source('adventure_works_sales', 'SalesReason') }}

),

renamed as (

    select
        salesreasonid,
        modifieddate

    from source

)

select * from renamed