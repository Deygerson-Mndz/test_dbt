{{ config(materialized='ephemeral') }}

select
    cast(id as integer) as id,
    nombre,
    email,
    length(nombre) as nombre_length
from {{ ref('clientes_seed') }}
