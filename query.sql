/* 3. Orders Query
Company X has a record of its customers and their orders. Find the customer(s) with the highest order price for orders placed within 10 years of the first order (earliest order_date) in the database. 
Print the customer name and order price. If multiple records are returned, they can be in any order. */

SELECT
  C.NAME,
  O.PRICE
FROM
  CUSTOMERS C
INNER JOIN
  ORDERS O ON C.ORDER_ID = O.ID
WHERE
  O.ORDER_DATE <= (SELECT DATE_ADD(MIN(ORDER_DATE), INTERVAL 10 YEAR) FROM ORDERS)
ORDER BY
  O.PRICE DESC
LIMIT 1;
