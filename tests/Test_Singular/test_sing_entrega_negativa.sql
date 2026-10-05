SELECT *
FROM {{ ref('etl_vendas') }}
WHERE dias_para_entrega < 0