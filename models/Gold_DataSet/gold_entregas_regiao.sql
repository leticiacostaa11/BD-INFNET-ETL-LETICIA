SELECT
    regiao_vendedor,
    regiao_cliente,
    situacao_entrega,
    COUNT(DISTINCT sk_pedido) AS total_pedidos
FROM {{ ref('etl_vendas') }}
GROUP BY
    regiao_cliente,
    regiao_vendedor,
    situacao_entrega