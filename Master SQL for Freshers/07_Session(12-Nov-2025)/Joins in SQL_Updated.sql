-------Joins in SQL-----------

-- Drop existing tables (to avoid duplication during re-runs)
DROP TABLE IF EXISTS TransactionTable;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;

-- Create Customer table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

-- Create Product table
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Product_Old (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

-- Create Transaction table
CREATE TABLE TransactionTable (
    TransactionID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    TransactionDate DATE
);

-- Insert sample data in one go
INSERT INTO Customer (CustomerID, CustomerName, City) VALUES
(1, 'John Smith', 'Hyderabad'),
(2, 'Amit Kumar', 'Delhi'),
(3, 'Sara Lee', 'Mumbai'),
(4, 'David Miller', 'Chennai');

INSERT INTO Customer (CustomerID, CustomerName, City) VALUES
(5, 'Mukesh', 'Hyd')

INSERT INTO Product (ProductID, ProductName, Category, Price) VALUES
(101, 'Laptop', 'Electronics', 75000),
(102, 'Mobile', 'Electronics', 25000),
(103, 'Tablet', 'Electronics', 35000),
(104, 'Desk Chair', 'Furniture', 8000),
(105, 'Pen', 'Stationery', 50);


INSERT INTO Product_Old(ProductID, Category, Price) VALUES
(101,  'Electronics', 75000),
(102, 'Mobile', 'Electronics', 25000),
(103, 'Tablet', 'Electronics', 35000),
(104, 'Desk Chair', 'Furniture', 8000),
(105, 'Pen', 'Stationery', 50);

INSERT INTO Product_Old (ProductID, Category, Price) VALUES
(108,  'Electronics', 100)

INSERT INTO TransactionTable (TransactionID, CustomerID, ProductID, Quantity, TransactionDate) VALUES
(1001, 1, 101, 1, '2025-11-01'),
(1002, 1, 102, 2, '2025-11-03'),
(1003, 2, 103, 1, '2025-11-05'),
(1004, 3, 104, 1, '2025-11-06'),
(1005, 3, 106, 1, '2025-11-07'); -- Intentional ProductID 106 (no match) to show JOIN difference



---INNER JOIN: Returns rows where there is a match in both tables.
SELECT 
    c.CustomerName, 
    p.ProductName, 
    t.Quantity, 
    p.Price, 
    t.TransactionDate
FROM TransactionTable t
INNER JOIN Customer c ON t.CustomerID = c.CustomerID
INNER JOIN Product p ON t.ProductID = p.ProductID;

---
Create Table TableB(ID int)
Insert into TableB
Select 3

Select * from TableA
Select * from TableB

---LEFT JOIN: Returns all rows from the left table (Customer) and matched rows from the right table.

SELECT 
    c.CustomerName, 
    t.TransactionID, 
    p.ProductName, 
    t.Quantity
FROM Customer c
LEFT JOIN TransactionTable t ON c.CustomerID = t.CustomerID
LEFT JOIN Product p ON t.ProductID = p.ProductID
Where TransactionID is null


--RIGHT JOIN:  Returns all rows from the right table (Product) and matched rows from the left table.

SELECT 
    p.ProductName, 
    c.CustomerName, 
    t.Quantity
FROM TransactionTable t
RIGHT JOIN Product p ON t.ProductID = p.ProductID
LEFT JOIN Customer c ON t.CustomerID = c.CustomerID;



---- Join Using CTE
;With CTE_Transaction
As
(
  Select * from TransactionTable where TransactionDate = '2025-11-01'
)

SELECT 
    c.CustomerName, 
    p.ProductName, 
    t.Quantity, 
    p.Price, 
    t.TransactionDate
FROM CTE_Transaction t
INNER JOIN Customer c ON t.CustomerID = c.CustomerID
INNER JOIN Product p ON t.ProductID = p.ProductID;

---- Temp Table

  Select * into #Output from TransactionTable where TransactionDate = '2025-11-01'

SELECT 
    c.CustomerName, 
    p.ProductName, 
    t.Quantity, 
    p.Price, 
    t.TransactionDate
FROM #Output t
INNER JOIN Customer c ON t.CustomerID = c.CustomerID
INNER JOIN Product p ON t.ProductID = p.ProductID;


Select * from #Output

--------------


--FULL OUTER JOIN: Combines the results of both Left and Right joins — shows all data from both sides.

SELECT 
    c.CustomerName, 
    p.ProductName, 
    t.Quantity
FROM TransactionTable t
FULL OUTER JOIN Customer c ON t.CustomerID = c.CustomerID
FULL OUTER JOIN Product p ON t.ProductID = p.ProductID;


--CROSS JOIN: Returns Cartesian product — every combination of customer and product.

SELECT 
    c.CustomerName, 
    p.ProductName
FROM Customer c
CROSS JOIN Product p;


--SELF JOIN: A table joined with itself, often to compare rows.
--Example: Find customers living in the same city.

SELECT 
    c1.CustomerName AS Customer1,
    c2.CustomerName AS Customer2,
    c1.City
FROM Customer c1
INNER JOIN Customer c2 ON c1.City = c2.City AND c1.CustomerID <> c2.CustomerID;


----
ALTER TABLE TransactionTable ADD UnitPrice DECIMAL(10,2);
ALTER TABLE TransactionTable ADD IsValid BIT;
ALTER TABLE Customer ADD CustomerCategory VARCHAR(20);


UPDATE t
SET t.UnitPrice = COALESCE(p.Price,00.00)
FROM TransactionTable t
Left JOIN Product p ON t.ProductID = p.ProductID;

Select p.ProductID, COALESCE(o.ProductName,p.ProductName,'NA') as FinalProductName
from Product p
Inner Join Product_Old o on p.ProductID = o.ProductID


INSERT INTO Product_Old(ProductID,ProductName, Category, Price) VALUES
(111,'Product_Old',  'Electronics', 100)


UPDATE t
SET t.UnitPrice = isnull(p.Price,00.00)
FROM TransactionTable t
Left JOIN Product p ON t.ProductID = p.ProductID;


Select COALESCE(p.Price,10.00),t.*
FROM TransactionTable t
Left JOIN Product p ON t.ProductID = p.ProductID;


-- Default all as valid
UPDATE TransactionTable SET IsValid = 1;

-- Mark invalid transactions using LEFT JOIN
UPDATE t
SET t.IsValid = 0
FROM TransactionTable t
LEFT JOIN Product p ON t.ProductID = p.ProductID
WHERE p.ProductID IS NULL;



