SELECT
    review_id as avaliacao_id,
    order_id as pedido_id,
    review_score as avaliacao_nota,
    NULLIF(TRIM(review_comment_title), '') as avaliacao_titulo,
    NULLIF(TRIM(review_comment_message), '') AS avaliacao_comentario,
    DATETIME(review_creation_date) as avaliacao_data,
    DATETIME(review_answer_timestamp) as resposta_data
FROM {{source('base','olist_order_reviews_dataset')}}