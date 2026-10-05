SELECT *
FROM {{ ref('etl_vendas') }}
WHERE valor_frete < 0