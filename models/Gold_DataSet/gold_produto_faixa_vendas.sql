SELECT
    categoria,
    COUNT(DISTINCT sk_produto) AS total_produto,
    COUNT(*) AS quantidade_vendida,
    ROUND(SUM(valor_item), 2) AS valor_vendas,
    CASE
        WHEN SUM(valor_item) >= 190000 THEN 'Alto'
        WHEN SUM(valor_item) >= 45000 THEN 'Médio'
        ELSE 'Baixo'
    END AS faixa_vendas
FROM {{ ref('etl_vendas') }}
GROUP BY categoria