with source as (

    select * from {{ source('adventure_works_person', 'EmailAddress') }}

),

renamed as (

    select
        businessentityid,
        emailaddressid,
        emailaddress,
        rowguid,
        modifieddate

    from source

)

select * from renamed