There are 1 unused configuration paths:
- models.large_project_simulation

[0m17:00:07  

with source as (

    select * from {{ source('medicare_sample_data', 'medicare_samples__2008_beneficiary_summary_file_sample') }}

),

renamed as (

    select

    from source

)

select * from renamed

