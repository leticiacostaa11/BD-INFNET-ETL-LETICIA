{% macro regiao (estado) %}
    CASE
        WHEN {{ estado }} IN ('AC', 'AP', 'AM', 'PA', 'RO', 'RR', 'TO') THEN 'NORTE'
        WHEN {{ estado }} IN ('AL', 'BA', 'CE', 'MA', 'PB', 'PE', 'PI', 'RN', 'SE') THEN 'NORDESTE'
        WHEN {{ estado }} IN ('DF', 'GO', 'MT', 'MS') THEN 'CENTRO-OESTE'
        WHEN {{ estado }} IN ('ES', 'MG', 'RJ', 'SP') THEN 'SUDESTE'
        WHEN {{ estado }} IN ('PR', 'RS', 'SC') THEN 'SUL'
        ELSE 'Não identificado'
    END
{% endmacro %}