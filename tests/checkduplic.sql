SELECT COUNT(*) COUNT, company_name, contact_name
-- FROM {{ref('customers')}}
FROM {{source('sources', 'customers')}}
GROUP BY company_name, contact_name
HAVING COUNT(*) > 1