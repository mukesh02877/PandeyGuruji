
--1.Write a SQL Query to find top Products by Week (Week Starts on Thursday)

SELECT 
    DATEADD(DAY, -((DATEPART(WEEKDAY, date) + @@DATEFIRST - 5) % 7), date) AS WeekStart,
    p.name AS ProductName,
    SUM(s.quantity) AS TotalSold
FROM Sales s
JOIN Product p ON s.product_id = p.id
GROUP BY DATEADD(DAY, -((DATEPART(WEEKDAY, date) + @@DATEFIRST - 5) % 7), date), p.name
ORDER BY WeekStart, TotalSold DESC;

--2.	Write a SQL Query to find top Products by Year, Month

SELECT 
    YEAR(date) AS SalesYear,
    MONTH(date) AS SalesMonth,
    p.name AS ProductName,
    SUM(s.quantity) AS TotalSold
FROM Sales s
JOIN Product p ON s.product_id = p.id
GROUP BY YEAR(date), MONTH(date), p.name
ORDER BY SalesYear, SalesMonth, TotalSold DESC;

--3.	Write a SQL Query to find top Products by Year.

SELECT 
    YEAR(date) AS SalesYear,
    p.name AS ProductName,
    SUM(s.quantity) AS TotalSold
FROM Sales s
JOIN Product p ON s.product_id = p.id
GROUP BY YEAR(date), p.name
ORDER BY SalesYear, TotalSold DESC;



/*
3.	Assume a new Stock column is added in Product.
Create a stored procedure usp_InsertSale that:

•	Validates if enough stock exists before inserting into Sales

•	If not enough stock, returns a message without inserting

•	Otherwise, inserts the sale and decrements stock atomically (transaction handling required).

*/

-- Create a sequence to generate trans_id if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM sys.sequences WHERE name = 'seq_SalesTransId')
BEGIN
    CREATE SEQUENCE dbo.seq_SalesTransId
        START WITH 1
        INCREMENT BY 1;
END
GO

CREATE PROCEDURE dbo.sp_InsertSale
    @ProductID INT,
    @Quantity INT,
    @CustomerID INT,
    @SaleDate DATE,
    @DeliverDate DATE
AS
BEGIN
    SET NOCOUNT ON;
    IF @Quantity <= 0
    BEGIN
        RAISERROR('Quantity must be positive',16,1); RETURN;
    END

    BEGIN TRAN;
    BEGIN TRY
        -- Lock the product row to prevent race conditions
        DECLARE @stock INT;
        SELECT @stock = stock
        FROM dbo.Product WITH (UPDLOCK, HOLDLOCK)
        WHERE id = @ProductID;

        IF @stock IS NULL
        BEGIN
            RAISERROR('Product not found',16,1);
            ROLLBACK TRAN;
            RETURN;
        END

        IF @stock < @Quantity
        BEGIN
            RAISERROR('Insufficient stock. Available: %d',16,1,@stock);
            ROLLBACK TRAN;
            RETURN;
        END

        -- Generate trans_id
        DECLARE @transid BIGINT = NEXT VALUE FOR dbo.seq_SalesTransId;

        INSERT INTO dbo.Sales(trans_id, product_id, quantity, customer_id, [date], deliver_date)
        VALUES (@transid, @ProductID, @Quantity, @CustomerID, @SaleDate, @DeliverDate);

        -- decrement stock
        UPDATE dbo.Product
        SET stock = stock - @Quantity
        WHERE id = @ProductID;

        COMMIT TRAN;

        -- Return the inserted trans id
        SELECT @transid AS trans_id;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0 ROLLBACK TRAN;
        DECLARE @msg NVARCHAR(4000) = ERROR_MESSAGE();
        THROW 50000, @msg, 1;
    END CATCH
END
GO


--Test
ALTER TABLE Product ADD stock INT DEFAULT 0;
-- Initialize stock levels
UPDATE Product SET stock = 10 WHERE id = 1; -- Laptop
UPDATE Product SET stock = 20 WHERE id = 2; -- Mobile
UPDATE Product SET stock = 15 WHERE id = 3; -- Headphones
UPDATE Product SET stock = 5  WHERE id = 4; -- Chair
UPDATE Product SET stock = 8  WHERE id = 5; -- Table

--– Successful Insert
EXEC dbo.sp_InsertSale 
    @ProductID = 1,   -- Laptop
    @Quantity = 2,
    @CustomerID = 1,
    @SaleDate = '2025-09-20',
    @DeliverDate = '2025-09-25';

    ---– Insufficient Stock
    EXEC dbo.sp_InsertSale 
    @ProductID = 4,   -- Chair
    @Quantity = 10,   -- more than available stock (5)
    @CustomerID = 2,
    @SaleDate = '2025-09-20',
    @DeliverDate = '2025-09-25';

    ---– Invalid Product

    EXEC dbo.sp_InsertSale 
    @ProductID = 999, -- nonexistent
    @Quantity = 1,
    @CustomerID = 3,
    @SaleDate = '2025-09-20',
    @DeliverDate = '2025-09-22';

    --– Invalid Quantity
    EXEC dbo.sp_InsertSale 
    @ProductID = 2,  -- Mobile
    @Quantity = 0,   -- invalid
    @CustomerID = 1,
    @SaleDate = '2025-09-20',
    @DeliverDate = '2025-09-22';

