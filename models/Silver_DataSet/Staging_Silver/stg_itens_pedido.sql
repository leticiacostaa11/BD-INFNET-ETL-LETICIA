SELECT
    sk_item_pedido,
    sk_pedido,
    order_item_id as item_pedido_id,
    sk_produto,
    sk_vendedor,
    sk_cliente,
    DATETIME(shipping_limit_date) as data_limite_envio,
    CAST (price AS NUMERIC) as valor_item,
    CAST (freight_value AS NUMERIC) as valor_frete
FROM {{source('datawarehouse','fato_itens_pedido')}}