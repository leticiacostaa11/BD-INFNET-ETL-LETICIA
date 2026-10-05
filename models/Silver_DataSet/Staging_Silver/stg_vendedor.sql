SELECT
    sk_vendedor,
    seller_id as vendedor_id,
    LPAD(CAST(seller_zip_code_prefix AS STRING), 5, '0') as vendedor_prefixo,
    UPPER(
        TRIM(
            REGEXP_REPLACE(seller_city, r'\s*/.*$', ''))) as vendedor_cidade,
    UPPER(TRIM(seller_state)) as vendedor_estado
FROM {{source('datawarehouse','dim_vendedor')}}