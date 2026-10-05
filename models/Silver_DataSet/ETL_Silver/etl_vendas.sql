SELECT
    ip.sk_item_pedido,
    ip.sk_pedido,
    p.pedido_status,
    ip.sk_produto,
    prod.categoria,
    ip.sk_cliente,
    c.cliente_cidade,
    c.cliente_estado,
    {{ regiao('c.cliente_estado') }} AS regiao_cliente,
    ip.sk_vendedor,
    v.vendedor_cidade,
    v.vendedor_estado,
    {{ regiao('v.vendedor_estado') }} AS regiao_vendedor,
    ip.valor_item,
    ip.valor_frete,
    ROUND(ip.valor_item * {{ var('taxa_imposto') }}, 2) AS valor_imposto,
    ROUND(ip.valor_item * (1 + {{ var('taxa_imposto') }}) + ip.valor_frete, 2) AS valor_total_item,
    p.pedido_data_hora,
    p.entrega_cliente,
    DATE_DIFF(DATE(p.entrega_cliente), DATE(p.pedido_data_hora), DAY) AS dias_para_entrega,
    DATE_DIFF(DATE(p.entrega_cliente), DATE(p.entrega_prevista), DAY) AS dias_atraso,
    CASE
        WHEN p.entrega_cliente IS NULL THEN 'Não entregue'
        WHEN p.entrega_cliente <= p.entrega_prevista THEN 'No prazo'
        ELSE 'Atrasado'
    END AS situacao_entrega
FROM {{ ref('stg_itens_pedido') }} AS ip
LEFT JOIN {{ ref('stg_pedido') }} AS p ON ip.sk_pedido = p.sk_pedido
LEFT JOIN {{ ref('stg_produto') }} AS prod ON ip.sk_produto = prod.sk_produto
LEFT JOIN {{ ref('stg_cliente') }} AS c ON ip.sk_cliente = c.sk_cliente
LEFT JOIN {{ ref('stg_vendedor') }} AS v ON ip.sk_vendedor = v.sk_vendedor