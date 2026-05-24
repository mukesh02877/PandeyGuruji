-- CTE to get all High-Value Transactions in last 30 days

--Transactions: 50M

WITH HighValueTxn AS (
    SELECT 
        t.CustomerID,
        t.TransactionID,
        t.Amount,
        t.TransactionDate,
        t.BranchID
    FROM Transactions t
    WHERE t.Amount >= 50000
      --AND t.TransactionDate >= DATEADD(DAY, -5, GETDATE())
)

-- Join CTE with Customer and Branch table
SELECT 
    c.CustomerID,
    c.CustomerName,
    h.TransactionID,
    h.Amount,
    h.TransactionDate,
    b.BranchName,
    b.City
FROM HighValueTxn h
JOIN Customers c 
    ON h.CustomerID = c.CustomerID
JOIN Branch b 
    ON h.BranchID = b.BranchID
ORDER BY h.TransactionDate DESC;



-- Bad Performance

SELECT 
    c.CustomerID,
    c.CustomerName,
    h.TransactionID,
    h.Amount,
    h.TransactionDate,
    b.BranchName,
    b.City
FROM Transactions h  ---50M
JOIN Customers c 
    ON h.CustomerID = c.CustomerID
JOIN Branch b 
    ON h.BranchID = b.BranchID
    where t.Amount >= 50000
ORDER BY h.TransactionDate DESC;