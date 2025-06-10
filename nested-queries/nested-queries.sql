use northwind;
-- 1. What is the product name(s) of the most expensive products? HINT: Find
-- the max price in a subquery and then use that value to find products whose
-- price equals that value.
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice IN (SELECT MAX(UnitPrice)
					FROM Products);

-- 2. What is the order id, shipping name and shipping address of all orders
-- shipped via "Federal Shipping"? HINT: Find the shipper id of "Federal
-- Shipping" in a subquery and then use that value to find the orders that
-- used that shipper.
SELECT OrderID, ShipName, ShipAddress
FROM Orders
WHERE ShipVia IN (SELECT ShipperID
				  FROM Shippers
				  WHERE CompanyName LIKE "%Federal%");

-- 3. What are the order ids of the orders that ordered "Sasquatch Ale"? HINT:
-- Find the product id of "Sasquatch Ale" in a subquery and then use that
-- value to find the matching orders from the `order details` table. Because
-- the `order details` table has a space in its name, you will need to surround
-- it with back ticks in the FROM clause.
SELECT OrderID
FROM `Order Details` 
WHERE ProductID LIKE (SELECT ProductID
					FROM Products
                    WHERE ProductName LIKE "%Sasquatch%");


-- 4. What is the name of the employee that sold order 10266?
SELECT FirstName, LastName
FROM Employees
WHERE EmployeeID LIKE (SELECT EmployeeID
					FROM Orders
                    WHERE OrderID = 10266);

-- 5. What is the name of the customer that bought order 10266?
SELECT ContactName
FROM Customers
WHERE CustomerID LIKE (SELECT CustomerID
						FROM Orders
                        WHERE OrderID = 10266);
