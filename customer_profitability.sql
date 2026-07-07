WITH line_item_profit AS (
    SELECT 
        orderNumber,
        productCode,
        quantityOrdered * (priceEach - (
            SELECT buyPrice 
                FROM products 
            WHERE products.productCode = od.productCode))   AS line_profit
      FROM orderdetails AS od
),

order_profit AS (
    SELECT 
        orderNumber, 
        SUM(line_profit) AS total_order_profit
      FROM line_item_profit
     GROUP BY orderNumber
)

SELECT 
    o.customerNumber, c.customerName, c.contactLastName, c.contactFirstName, c.city, c.country,
    ROUND(SUM(op.total_order_profit), 2) AS total_customer_profit
  FROM orders AS o
    JOIN order_profit AS op 
         ON o.orderNumber = op.orderNumber
    JOIN customers AS c
	     ON c.customerNumber = o.customerNumber
GROUP BY o.customerNumber
ORDER BY total_customer_profit DESC;