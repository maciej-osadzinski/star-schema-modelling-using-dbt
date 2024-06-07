with source as (

    select * from {{ source('adventure_works_sales', 'SalesOrderHeaderSalesReason') }}

),

renamed as (

    select
        salesorderid,
        salesreasonid,
        modifieddate

    from source

)

select * from renamed