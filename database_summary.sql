SELECT 'Customers' AS table_name, 
                  (SELECT COUNT(*)  FROM pragma_table_info('customers')) AS number_of_attributes,
                  COUNT(*) AS number_of_rows FROM customers
	  
UNION ALL
	   
SELECT 'Products' AS table_name, 
                  (SELECT COUNT(*)  FROM pragma_table_info('products')) AS number_of_attributes,
                  COUNT(*) AS number_of_rows FROM products
	  
UNION ALL

SELECT 'ProductLines' AS table_name, 
                  (SELECT COUNT(*)  FROM pragma_table_info('productlines')) AS number_of_attributes,
                  COUNT(*) AS number_of_rows FROM productlines
	  
UNION ALL

SELECT 'Orders' AS table_name, 
                  (SELECT COUNT(*)  FROM pragma_table_info('orders')) AS number_of_attributes,
                  COUNT(*) AS number_of_rows FROM orders
	  
UNION ALL

SELECT 'OrderDetails' AS table_name, 
                  (SELECT COUNT(*)  FROM pragma_table_info('orderdetails')) AS number_of_attributes,
                  COUNT(*) AS number_of_rows FROM orderdetails
	  
UNION ALL

SELECT 'Payments' AS table_name, 
                  (SELECT COUNT(*)  FROM pragma_table_info('payments')) AS number_of_attributes,
                  COUNT(*) AS number_of_rows FROM payments
	  
UNION ALL

SELECT 'Employees' AS table_name, 
                  (SELECT COUNT(*)  FROM pragma_table_info('employees')) AS number_of_attributes,
                  COUNT(*) AS number_of_rows FROM employees
	  
UNION ALL

SELECT 'Offices' AS table_name, 
                  (SELECT COUNT(*)  FROM pragma_table_info('offices')) AS number_of_attributes,
                  COUNT(*) AS number_of_rows FROM offices   