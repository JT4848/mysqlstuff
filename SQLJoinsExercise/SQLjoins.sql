/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT p.name AS product, c.name AS category
 FROM products AS p
 JOIN categories AS c ON c.CategoryID = p.CategoryID
 WHERE c.name = 'computers';
 
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.name, p.price, r.rating
 FROM products AS p
 JOIN reviews AS r ON r.ProductID = p.ProductID
 WHERE r.rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.name AS department, c.name AS category
FROM departments AS d
JOIN categories AS c ON c.DepartmentID = d.DepartmentID
WHERE c.name = 'appliances' OR c.name = 'games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.name, Sum(s.Quanity) as "Total Units Sold",
Sum(s.quanity *s.PricePerUnit) as "Total Price"
FROM products as p
INNER JOIN sales AS s
ON s.ProductID = p.ProductID
WHERE p.ProductID = 97;
-- verification:
SELECT * FROM sales WHERE ProductID = 97;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.name, r.reviewer, r.rating, r.comment
FROM products AS p
INNER JOIN reviews AS r
ON r.productID = p.ProductID
WHERE p.ProductID = 857 AND r.rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.employee, e.firstname, e.lastname, p.NAME AS 'Product Name',
Sum(s.quanity) AS 'Total Sold'
FROM sales AS s
INNER JOIN employees AS e ON e.EmployeeID = s.EmployeeID
INNER JOIN prodcuts AS p ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID
ORDER BY e.FirstName;