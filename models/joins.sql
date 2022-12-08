WITH prod AS (
SELECT ct.category_name
      ,sp.company_name AS suppliers
      ,pd.product_name
      ,pd.unit_price
      ,pd.product_id 
    FROM {{source('sources', 'products')}}          pd 
LEFT JOIN {{source('sources', 'suppliers')}}        sp ON sp.supplier_id = pd.supplier_id
LEFT JOIN {{source('sources', 'categories')}}       ct ON ct.category_id = pd.category_id
), orddetail AS (
    SELECT pd.*, od.order_id, od.quantity, od.discount
    FROM  {{ref('orderdetails')}}        od 
LEFT JOIN prod  pd  ON pd.product_id = od.product_id

), orders AS (
    SELECT ord.order_date, ord.order_id, cs.company_name AS customer , em.name AS employee, em.age
         , em.lengthofservice
        FROM  {{source('sources', 'orders')}}           ord
        LEFT JOIN  {{ref('customers')}}                 cs      ON cs.customer_id = ord.customer_id 
        LEFT JOIN  {{ref('employees')}}                 em      ON em.employee_id = ord.employee_id
        LEFT JOIN {{source('sources', 'shippers')}}     sh      ON sh.shipper_id = ord.ship_via

), finaljoin AS (
    SELECT od.*, ord.order_date, ord.customer, ord.employee, ord.age, ord.lengthofservice
    FROM orddetail     od
    JOIN orders ord ON ord.order_id = od.order_id
)
SELECT * FROM finaljoin

