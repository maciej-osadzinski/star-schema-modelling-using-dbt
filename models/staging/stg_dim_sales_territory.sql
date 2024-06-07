with source as (

    select * from {{ source('adventure_works_sales', 'SalesTerritory') }}

),

renamed as (

    select
        territoryid,
        countryregioncode,
        salesytd,
        saleslastyear,
        costytd,
        costlastyear,
        rowguid,
        modifieddate

    from source

)

select * from renamed