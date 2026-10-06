SELECT regiao_cliente AS regiao
FROM {{ ref('etl_vendas') }}
UNION DISTINCT
SELECT regiao_vendedor AS regiao
FROM {{ ref('etl_vendas') }}