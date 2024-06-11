with source as (

    select * from {{ source('adventure_works_person', 'Person') }}

),

renamed as (

    select
        businessentityid,
        persontype,
        title,
        firstname,
        middlename,
        lastname,
        namestyle,
        suffix,
        emailpromotion,
        rowguid,
        modifieddate

    from source

)

select * from renamed