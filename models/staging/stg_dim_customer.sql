with source as (

    select * from {{ source('adventure_works_sales', 'Customer') }}

),

renamed as (

    select
        customerid,
        personid,
        storeid,
        territoryid,
        accountnumber,
        rowguid,
        modifieddate

    from source

)

select * from renamed