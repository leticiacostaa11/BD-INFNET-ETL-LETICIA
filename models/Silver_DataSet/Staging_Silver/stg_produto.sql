SELECT
    sk_produto,
    product_id as produto_id,
    UPPER(
        REPLACE(product_category_name, '_', ' ')
    ) AS categoria,
    UPPER(
        REPLACE(product_category_name_english, '_', ' ')
    ) AS categoria_ingles,
    SAFE_CAST(product_name_lenght AS INT64) AS caracteres_nome,
    SAFE_CAST(product_description_lenght AS INT64) AS caracteres_descricao,
    COALESCE(
        SAFE_CAST(product_photos_qty AS INT64),
        0
    ) AS quantidade_fotos,
    SAFE_CAST(product_weight_g AS NUMERIC) AS peso_produto_g,
    SAFE_CAST(product_length_cm AS NUMERIC) AS comprimento_produto_cm,
    SAFE_CAST(product_height_cm AS NUMERIC) AS altura_produto_cm,
    SAFE_CAST(product_width_cm AS NUMERIC) AS largura_produto_cm
FROM {{source('datawarehouse','dim_produto')}}


    