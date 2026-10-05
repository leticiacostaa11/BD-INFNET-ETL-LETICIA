SELECT
    regiao_cliente,
    COUNT(DISTINCT sk_pedido) AS total_pedidos,
    ROUND(SUM(valor_item), 2) AS total_vendas,
    ROUND(SUM(valor_frete), 2) AS total_frete,
    ROUND(SUM(valor_imposto), 2) AS total_imposto,
    ROUND(SUM(valor_total_item), 2) AS receita_total,
    ROUND(SAFE_DIVIDE(SUM(valor_item), COUNT(DISTINCT sk_pedido)), 2) AS ticket_medio,
    ROUND(SAFE_DIVIDE(SUM(valor_frete), SUM(valor_item)) * 100, 1) AS pct_frete
FROM {{ ref('etl_vendas') }}
GROUP BY regiao_cliente