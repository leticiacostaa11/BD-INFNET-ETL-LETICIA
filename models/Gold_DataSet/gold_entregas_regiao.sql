SELECT
    regiao_vendedor,
    regiao_cliente,
    situacao_entrega,
    COUNT(sk_pedido) AS total_pedidos,
FROM {{ ref('etl_vendas') }}
GROUP BY
    regiao_cliente,
    situacao_entrega,
    regiao_vendedor