
use PandeyGuruji
go

--Data Partitioning in SQL
--drop table Transactions

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    BranchCode VARCHAR(10),
    TransactionAmount DECIMAL(12,2),
    TransactionDate DATE
);

-- Insert sample data
INSERT INTO Transactions VALUES
(1, 101, 'BR001', 5000.00, '2023-12-15'),
(2, 102, 'BR002', 2000.00, '2024-01-10'),
(3, 103, 'BR001', 7000.00, '2024-01-25'),
(4, 104, 'BR003', 3000.00, '2024-02-05'),
(5, 105, 'BR002', 10000.00, '2024-02-15');



Select * from Transactions

--A. Range Partitioning – Partition by TransactionDate (e.g., monthly)

-- Drop if already exists
IF OBJECT_ID('Transactions_Range', 'U') IS NOT NULL DROP TABLE Transactions_Range;
IF EXISTS (SELECT * FROM sys.partition_schemes WHERE name = 'ps_TransByYear') DROP PARTITION SCHEME ps_TransByYear;
IF EXISTS (SELECT * FROM sys.partition_functions WHERE name = 'pf_TransByYear') DROP PARTITION FUNCTION pf_TransByYear;

-- 1. Partition Function (range by year)
CREATE PARTITION FUNCTION pf_TransByYear (DATE)
AS RANGE LEFT FOR VALUES 
('2022-12-31', '2023-12-31', '2024-12-31', '2025-12-31');

-- 2. Partition Scheme
CREATE PARTITION SCHEME ps_TransByYear
AS PARTITION pf_TransByYear ALL TO ([PRIMARY]);

-- 3. Create Partitioned Table
CREATE TABLE Transactions_Range (
    TransactionID INT,
    AccountID INT,
    BranchCode VARCHAR(10),
    TransactionAmount DECIMAL(12,2),
    TransactionDate DATE,
    CONSTRAINT PK_TransactionsRange PRIMARY KEY (TransactionID, TransactionDate)
) ON ps_TransByYear(TransactionDate);

-- 4. Insert Sample Multi-Year Banking Transactions
INSERT INTO Transactions_Range VALUES
(1, 101, 'BR001', 1000.00, '2022-01-15'),
(2, 102, 'BR002', 2000.00, '2023-03-10'),
(3, 103, 'BR003', 3000.00, '2023-08-20'),
(4, 104, 'BR001', 4000.00, '2024-02-12'),
(5, 105, 'BR002', 5000.00, '2024-09-18'),
(6, 106, 'BR003', 6000.00, '2025-05-22'),
(7, 107, 'BR001', 7000.00, '2025-10-02');

-- 5. Check Partition Distribution
SELECT 
    TransactionID,
    TransactionDate,
    $PARTITION.pf_TransByYear(TransactionDate) AS PartitionNumber
FROM Transactions_Range
ORDER BY TransactionDate;


--B. List Partitioning – Based on BranchCode
--Simulate with views if DBMS doesn’t support native list partitioning.

CREATE VIEW Transactions_BR001 AS
SELECT * FROM Transactions WHERE BranchCode = 'BR001';

CREATE VIEW Transactions_BR002 AS
SELECT * FROM Transactions WHERE BranchCode = 'BR002';


--C. Hash Partitioning – Based on AccountID
--This helps in parallel query execution or load balancing.


SELECT *
FROM Transactions
WHERE ABS(CHECKSUM(AccountID)) % 2 = 0;

--D. Composite Partitioning – Range + Hash
--Not all databases support this natively, but conceptually:
-- Use TransactionDate for range (monthly partitioning) and within each, use hash on AccountID to spread data.
