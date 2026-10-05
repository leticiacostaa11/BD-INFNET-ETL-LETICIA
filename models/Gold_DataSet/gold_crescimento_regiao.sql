SELECT
    DATE_TRUNC(DATE(pedido_data_hora), MONTH) AS mes_referencia,
    EXTRACT(YEAR FROM pedido_data_hora) AS ano,
    EXTRACT(MONTH FROM pedido_data_hora) AS mes,
    regiao_cliente,
    categoria,
    COUNT(sk_item_pedido) AS quantidade_vendida,
    ROUND(SUM(valor_item), 2) AS total_vendas
FROM {{ ref('etl_vendas') }}
GROUP BY
    mes_referencia,
    ano,
    mes,
    regiao_cliente,
    categoria