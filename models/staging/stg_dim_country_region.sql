with source as (

    select * from {{ source('adventure_works_person', 'CountryRegion') }}

),

renamed as (

    select
        countryregioncode,
        modifieddate

    from source

)

select * from renamed