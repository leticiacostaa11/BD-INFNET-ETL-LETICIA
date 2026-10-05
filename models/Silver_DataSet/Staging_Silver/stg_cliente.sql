SELECT
sk_cliente,
customer_id as cliente_id,
customer_unique_id as cliente_identificador,
 LPAD(CAST(customer_zip_code_prefix AS STRING), 5, '0') as cliente_prefixo,
 UPPER(
        TRIM(
            REGEXP_REPLACE(customer_city, r'\s*/.*$', '')
        )
    ) AS cliente_cidade,
UPPER(TRIM(customer_state)) as cliente_estado
FROM {{source('datawarehouse','dim_cliente')}}