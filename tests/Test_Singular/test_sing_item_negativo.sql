SELECT *
FROM {{ ref('etl_vendas') }}
WHERE valor_item <= 0