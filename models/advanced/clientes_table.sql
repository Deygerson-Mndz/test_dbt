{{ config(materialized='table') }}

select
    id,
    upper(nombre) as nombre_mayuscula,
    email,
    nombre_length
from {{ ref('clientes_view') }}
