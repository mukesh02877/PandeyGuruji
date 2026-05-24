--E-COMMERCE DATABASE

/* ===============================
   DROP TABLES IF EXISTS
================================ */
DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Transactions;
DROP TABLE IF EXISTS Customers;
--sp_help Customers
/* ===============================
   CREATE TABLES
================================ */
CREATE TABLE Customers (
    CustomerID INT IDENTITY PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    Mobile VARCHAR(15),
    City VARCHAR(50),
    CreatedDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE Categories (
    CategoryID INT IDENTITY PRIMARY KEY,
    CategoryName VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT IDENTITY PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT,
    Price DECIMAL(10,2),
    Stock INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders (
    OrderID INT IDENTITY PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME DEFAULT GETDATE(),
    OrderStatus VARCHAR(30),
    TotalAmount DECIMAL(12,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderItems (
    OrderItemID INT IDENTITY PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Payments (
    PaymentID INT IDENTITY PRIMARY KEY,
    OrderID INT,
    PaymentMode VARCHAR(30),
    PaymentStatus VARCHAR(30),
    PaidAmount DECIMAL(12,2),
    PaymentDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

/* ===============================
   INSERT SAMPLE DATA (25 RECORDS EACH)
================================ */

-- CUSTOMERS (25)
INSERT INTO Customers (CustomerName, Email, Mobile, City)
SELECT 
    CONCAT('Customer', n),
    CONCAT('customer', n, '@mail.com'),
    CONCAT('90000', FORMAT(n,'0000')),
    CONCAT('City', n%5)
FROM (SELECT TOP 25 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) n FROM sys.objects) t;

-- CATEGORIES (25)
INSERT INTO Categories (CategoryName)
SELECT CONCAT('Category', n)
FROM (SELECT TOP 25 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) n FROM sys.objects) t;

-- PRODUCTS (25)
INSERT INTO Products (ProductName, CategoryID, Price, Stock)
SELECT 
    CONCAT('Product', n),
    (n % 5) + 1,
    (n * 100) + 50,
    100
FROM (SELECT TOP 25 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) n FROM sys.objects) t;

-- ORDERS (25)
INSERT INTO Orders (CustomerID, OrderStatus, TotalAmount)
SELECT 
    (n % 10) + 1,
    'CREATED',
    0
FROM (SELECT TOP 25 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) n FROM sys.objects) t;

-- ORDER ITEMS (25)
INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price)
SELECT 
    n,
    (n % 10) + 1,
    2,
    500
FROM (SELECT TOP 25 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) n FROM sys.objects) t;

-- PAYMENTS (25)
INSERT INTO Payments (OrderID, PaymentMode, PaymentStatus, PaidAmount)
SELECT 
    n,
    'UPI',
    'SUCCESS',
    1000
FROM (SELECT TOP 25 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) n FROM sys.objects) t;

/* ===============================
   STORED PROCEDURE: PLACE ORDER
================================ */
DROP PROCEDURE IF EXISTS usp_PlaceOrder;
GO

CREATE PROCEDURE usp_PlaceOrder
(
    @CustomerID INT,
    @ProductID INT,
    @Quantity INT,
    @PaymentMode VARCHAR(30)
)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE 
        @OrderID INT,
        @Price DECIMAL(10,2),
        @TotalAmount DECIMAL(12,2);

    BEGIN TRANSACTION;

    -- Get Product Price
    SELECT @Price = Price FROM Products WHERE ProductID = @ProductID;

    -- Check Stock
    IF (SELECT Stock FROM Products WHERE ProductID = @ProductID) < @Quantity
    BEGIN
        ROLLBACK;
        RAISERROR('Insufficient stock',16,1);
        RETURN;
    END

    -- Create Order
    INSERT INTO Orders (CustomerID, OrderStatus, TotalAmount)
    VALUES (@CustomerID, 'CONFIRMED', 0);

    SET @OrderID = SCOPE_IDENTITY();

    -- Order Items
    INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price)
    VALUES (@OrderID, @ProductID, @Quantity, @Price);

    SET @TotalAmount = @Price * @Quantity;

    -- Update Order Total
    UPDATE Orders
    SET TotalAmount = @TotalAmount
    WHERE OrderID = @OrderID;

    -- Payment
    INSERT INTO Payments (OrderID, PaymentMode, PaymentStatus, PaidAmount)
    VALUES (@OrderID, @PaymentMode, 'SUCCESS', @TotalAmount);

    -- Update Inventory
    UPDATE Products
    SET Stock = Stock - @Quantity
    WHERE ProductID = @ProductID;

    COMMIT;

    SELECT 'Order Placed Successfully' AS Message, @OrderID AS OrderID;
END;
GO



Select * from Payments;
Select * from OrderItems;
Select * from Orders;
Select * from Products;
Select * from Categories;
Select * from Customers;