with source as (

    select * from {{ source('adventure_works_person', 'CountryRegion') }}

),

renamed as (

    select
        countryregioncode,
        modifieddate,
        name

    from source

)

select * from renamed