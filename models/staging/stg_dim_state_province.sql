with source as (

    select * from {{ source('adventure_works_person', 'StateProvince') }}

),

renamed as (

    select
        stateprovinceid,
        stateprovincecode,
        countryregioncode,
        territoryid,
        rowguid,
        modifieddate

    from source

)

select * from renamed