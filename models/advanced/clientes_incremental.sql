{{ config(materialized='incremental', unique_key='id') }}

with source as (
    select * from {{ ref('clientes_table') }}
)

select
    id,
    nombre_mayuscula as nombre,
    email,
    nombre_length,
    current_timestamp as carga_timestamp
from source
{% if is_incremental() %}
where id > (select max(id) from {{ this }})
{% endif %}
