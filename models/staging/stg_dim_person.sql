with source as (

    select * from {{ source('adventure_works_person', 'Person') }}

),

renamed as (

    select
        businessentityid,
        persontype,
        title,
        suffix,
        emailpromotion,
        rowguid,
        modifieddate

    from source

)

select * from renamed