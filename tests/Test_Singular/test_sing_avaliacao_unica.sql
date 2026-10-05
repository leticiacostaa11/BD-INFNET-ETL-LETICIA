SELECT
    avaliacao_id,
    pedido_id,
    COUNT(*) AS qtd
FROM {{ ref('stg_avaliacao') }}
GROUP BY avaliacao_id, pedido_id
HAVING COUNT(*) > 1

-- EXEMPLO
SELECT *
FROM {{ ref('stg_avaliacao') }}
WHERE avaliacao_id = 'ef5a41c50217f8e2b9296db3ba78f11e'
