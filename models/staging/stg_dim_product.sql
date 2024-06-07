with source as (

    select * from {{ source('adventure_works_production', 'Product') }}

),

renamed as (

    select
        productid,
        productnumber,
        color,
        safetystocklevel,
        reorderpoint,
        standardcost,
        listprice,
        size,
        sizeunitmeasurecode,
        weightunitmeasurecode,
        weight,
        daystomanufacture,
        productline,
        class,
        style,
        productsubcategoryid,
        productmodelid,
        sellstartdate,
        sellenddate,
        discontinueddate,
        rowguid,
        modifieddate

    from source

)

select * from renamed