use northwind;
-- 1. Add a new supplier.
INSERT INTO Suppliers (CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone)
VALUES ("New Company", "Camille Ingram", "Sales Agent", "123 Main Street", "Charlotte", "North Carolina", "28262", "USA", "123-123-4567"); 

-- 2. Add a new product provided by that supplier
INSERT INTO Products (ProductName, SupplierID, UnitPrice)
VALUES("New Product", 30, 20.00);

-- 3. List all products and their suppliers.
SELECT ProductID, ProductName, CompanyName
FROM Products
JOIN Suppliers
	ON Products.SupplierID = Suppliers.SupplierID;
    
-- 4. Raise the price of your new product by 15%.
SET SQL_SAFE_UPDATES = 0;
UPDATE Products
SET UnitPrice = UnitPrice * 1.15
WHERE ProductName LIKE "%New Product%";
SET SQL_SAFE_UPDATEs = 1;
-- 5. List the products and prices of all products from that supplier.
SELECT ProductName, UnitPrice
FROM Products
WHERE SupplierID IN (SELECT SupplierID
						FROM Suppliers
                        WHERE CompanyName LIKE "%New Company%");
-- 6. Delete the new product.
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Products
WHERE ProductName LIKE "%New Product%";
SET SQL_SAFE_UPDATES = 1;

-- 7. Delete the new supplier.
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Suppliers
WHERE CompanyName LIKE "%New Company%";
SET SQL_SAFE_UPDATES = 1;
-- 8. List all products.
SELECT * 
FROM Products;

-- 9. List all suppliers.
SELECT *
FROM Suppliers
