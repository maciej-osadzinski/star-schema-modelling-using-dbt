with source as (

    select * from {{ source('adventure_works_person', 'Address') }}

),

renamed as (

    select
        addressid,
        addressline1,
        addressline2,
        city,
        stateprovinceid,
        postalcode,
        spatiallocation,
        rowguid,
        modifieddate

    from source

)

select * from renamed