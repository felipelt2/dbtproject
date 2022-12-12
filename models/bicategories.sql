-- Exemplo usando MACRO
SELECT {{retorna_campos()}} 
FROM {{ref('joins')}}
WHERE category_name = '{{var('category')}}'
--dbt run --select bicategories --vars('category:Condiments')