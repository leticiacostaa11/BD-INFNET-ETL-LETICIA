-- dim_categoria.sql
SELECT DISTINCT categoria
FROM {{ ref('etl_vendas') }}