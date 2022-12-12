/*

SELECT se.shipper_email, sh.company_name
    FROM {{source('sources', 'shippers')}} sh
    LEFT JOIN {{ref('shippers_emails')}} se ON se.shipper_id = sh.shipper_id
    
    */
    -- dbt seed  -- VERIFICAR ESTE
select * from {{ ref("shippers_emails") }} 
