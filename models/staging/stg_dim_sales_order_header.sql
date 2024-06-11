with source as (

    select * from {{ source('adventure_works_sales', 'SalesOrderHeader') }}

),

renamed as (

    select
        salesorderid,
        revisionnumber,
        orderdate,
        duedate,
        shipdate,
        status,
        salesordernumber,
        customerid,
        salespersonid,
        territoryid,
        billtoaddressid,
        shiptoaddressid,
        shipmethodid,
        creditcardid,
        creditcardapprovalcode,
        currencyrateid,
        subtotal,
        taxamt,
        freight,
        totaldue,
        comment,
        rowguid,
        modifieddate,
        onlineorderflag

    from source

)

select * from renamed