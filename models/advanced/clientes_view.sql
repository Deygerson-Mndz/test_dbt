{{ config(materialized='view') }}

select
    id,
    nombre,
    email,
    nombre_length
from {{ ref('clientes_ephemeral') }}
