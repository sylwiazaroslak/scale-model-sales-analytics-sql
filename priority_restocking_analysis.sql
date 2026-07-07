WITH 
lowStockProducts AS (
			 SELECT productCode,
			                   ROUND(SUM(quantityOrdered) * 1.0/(SELECT quantityInStock
                                                                                                                FROM products p
                                                                                                            WHERE od.productCode = p.productCode), 2) AS lowStock
	    	     FROM orderdetails AS od
			   GROUP BY productCode
			   ORDER BY lowStock DESC
			   LIMIT 10
),
productsToRestock AS (
			 SELECT od.productCode,
			                  SUM(quantityOrdered * priceEach) AS performance
				FROM orderdetails AS od
		    WHERE productCode IN (SELECT productCode
                                                                  FROM lowStockProducts)
			  GROUP BY productCode
			  ORDER BY performance  DESC
			          LIMIT 10
)


 SELECT p.productName, p.productLine
    FROM products AS p
WHERE p.productCode IN (SELECT productCode
													      FROM productsToRestock)
   LIMIT 10