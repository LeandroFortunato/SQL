-- Description of the task below the query
----------------------------------------------

SELECT p.name                               AS product_name, 
       EXTRACT(YEAR  FROM s.date)           AS year, 
       EXTRACT(MONTH FROM s.date)           AS month, 
       EXTRACT(DAY   FROM s.date)           AS day,
       SUM(p.price*sd.count)                AS total
      
FROM products p INNER JOIN 
              sales_details sd ON p.id = sd.product_id INNER JOIN
              sales s ON s.id = sd.sale_id

GROUP BY
  GROUPING SETS
                (  (p.name,
                    EXTRACT(YEAR  FROM s.date),
                    EXTRACT(MONTH FROM s.date),
                    EXTRACT(DAY   FROM s.date)),
                   (p.name,
                    EXTRACT(YEAR  FROM s.date),
                    EXTRACT(MONTH FROM s.date)),
                   (p.name,
                    EXTRACT(YEAR  FROM s.date)),
                    p.name) 

ORDER BY product_name,
         year,
         month,
         day


-----------------------------------------------------------------------------------------------------------------
Task
Given the information about sales in a store, calculate the total revenue for each day, month, year, and product.

Notes
The sales table stores only the dates for which any data has been recorded - the information about individual sales (what was sold, and when) is stored in the sales_details table instead
The sales_details table stores totals per product per date
Order the result by the product_name, year, month, day columns
We're interested only in the product-specific data, so you shouldn't return the total revenue from all sales
Input tables
----------------------------------------
|    Table      |   Column   |  Type   |
|---------------+------------+---------|
| products      | id         | int     |
|               | name       | text    |
|               | price      | numeric |
|---------------+------------+---------|
| sales         | id         | int     |
|               | date       | date    |
|---------------+------------+---------|
| sales_details | id         | int     |
|               | sale_id    | int     |
|               | product_id | int     |
|               | count      | int     |
-----------------------------------------
Output table
--------------------------
|    Column    |  Type   |
|--------------+---------|
| product_name | text    |
| year         | int     |
| month        | int     |
| day          | int     |
| total        | numeric |
--------------------------
Example output
product_name | year | month | day | total
-------------+------+-------+-----+------
 milk        | 2019 | 01    | 01  | 200
 milk        | 2019 | 01    | 02  | 190
 milk        | 2019 | 01    |     | 390
 milk        | 2019 | 02    | 01  | 240
 milk        | 2019 | 02    |     | 240
 milk        | 2019 |       |     | 630
 milk        |      |       |     | 630


Source: https://www.codewars.com/kata/5dac87a0abe9f1001f39e36d