with source as (

    select * from {{ source('adventure_works_sales', 'SalesOrderDetail') }}

),

renamed as (

    select
        salesorderid,
        salesorderdetailid,
        carriertrackingnumber,
        orderqty,
        productid,
        specialofferid,
        unitprice,
        unitpricediscount,
        linetotal,
        rowguid,
        modifieddate

    from source

)

select * from renamed