SELECT
    sk_pedido,
    order_id AS pedido_id,
    order_status AS pedido_status,    
    DATETIME(order_purchase_timestamp) AS pedido_data_hora,
    DATETIME(order_approved_at) AS pedido_aprovado_em,    
    DATETIME(order_delivered_carrier_date) AS entrega_transportadora,
    DATETIME(order_delivered_customer_date) AS entrega_cliente,
    DATETIME(order_estimated_delivery_date) AS entrega_prevista
FROM {{ source('datawarehouse', 'dim_pedido') }}