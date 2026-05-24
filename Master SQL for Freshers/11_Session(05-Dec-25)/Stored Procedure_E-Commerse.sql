
--1.Get Customer Orders by CustomerID
DROP PROCEDURE IF EXISTS usp_GetCustomerOrders;
GO
CREATE PROCEDURE usp_GetCustomerOrders
(
    @CustomerID INT
)
AS
BEGIN
    SELECT o.CustomerID, 
        o.OrderID,
        o.OrderDate,
        o.OrderStatus,
        o.TotalAmount
    FROM Orders o
    WHERE o.CustomerID = @CustomerID;
END;
GO

EXEC usp_GetCustomerOrders @CustomerID = 4;


--2.Get Orders Between Date Range


CREATE PROCEDURE usp_GetOrdersByDateRange
(
    @FromDate DATE,
    @ToDate DATE
)
AS
BEGIN
    SELECT *
    FROM Orders
    WHERE OrderDate BETWEEN @FromDate AND @ToDate;
END;


EXEC usp_GetOrdersByDateRange '2024-01-10', '2025-12-31';


--3. Get Products by Category & Price Filter

DROP PROCEDURE IF EXISTS usp_GetProductsByCategoryPrice;
GO
CREATE PROCEDURE usp_GetProductsByCategoryPrice
(
    @CategoryID INT,
    @MinPrice DECIMAL(10,2),
    @MaxPrice DECIMAL(10,2)
)
AS
BEGIN
    SELECT 
        p.ProductID,
        p.ProductName,
        c.CategoryName,
        p.Price,
        p.Stock
    FROM Products p
    JOIN Categories c ON p.CategoryID = c.CategoryID
    WHERE p.CategoryID = @CategoryID
      AND p.Price BETWEEN @MinPrice AND @MaxPrice;
END;
GO

EXEC usp_GetProductsByCategoryPrice 1, 200, 1000;

--4. Get Order Details (Header + Items)

DROP PROCEDURE IF EXISTS usp_GetOrderDetails;
GO
CREATE PROCEDURE usp_GetOrderDetails
(
    @OrderID INT
)
AS
BEGIN
    SELECT 
        o.OrderID,
        c.CustomerName,
        p.ProductName,
        oi.Quantity,
        oi.Price,
        o.TotalAmount
    FROM Orders o
    JOIN Customers c ON o.CustomerID = c.CustomerID
    JOIN OrderItems oi ON o.OrderID = oi.OrderID
    JOIN Products p ON oi.ProductID = p.ProductID
    WHERE o.OrderID = @OrderID;
END;
GO

EXEC usp_GetOrderDetails 5;


--Optional Parameter Example (Admin Friendly)
DROP PROCEDURE IF EXISTS usp_GetOrdersOptionalFilter;
GO
CREATE PROCEDURE usp_GetOrdersOptionalFilter
(
    @OrderStatus VARCHAR(30) = NULL,
    @CustomerID INT = NULL
)
AS
BEGIN
    SELECT *
    FROM Orders
    WHERE (@OrderStatus IS NULL OR OrderStatus = @OrderStatus)
      AND (@CustomerID IS NULL OR CustomerID = @CustomerID);
END;
GO

EXEC usp_GetOrdersOptionalFilter @OrderStatus = 'CONFIRMED';
EXEC usp_GetOrdersOptionalFilter @CustomerID = 2;
