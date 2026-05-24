-- Drop tables if they already exist
DROP TABLE IF EXISTS Transactions, Customers, Products;
GO

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);
GO

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    JoinDate DATE
);
GO

-- Create Transactions Table
CREATE TABLE Transactions (
    TransactionID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    TotalAmount AS (Quantity * (SELECT Price FROM Products p WHERE p.ProductID = Transactions.ProductID)),
    TransactionDate DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO

-- Insert sample data
INSERT INTO Products VALUES 
(1, 'Laptop', 'Electronics', 75000),
(2, 'Mobile', 'Electronics', 25000),
(3, 'Headphones', 'Accessories', 3000),
(4, 'Washing Machine', 'Home Appliances', 40000),
(5, 'Refrigerator', 'Home Appliances', 55000);

INSERT INTO Customers VALUES
(101, 'Ravi Kumar', 'Hyderabad', '2022-03-15'),
(102, 'Sneha Reddy', 'Bangalore', '2023-01-10'),
(103, 'Arjun Singh', 'Mumbai', '2023-11-05'),
(104, 'Priya Sharma', 'Chennai', '2022-06-20'),
(105, 'Rahul Verma', 'Pune', '2024-04-01');

INSERT INTO Transactions (CustomerID, ProductID, Quantity, TransactionDate) VALUES
(101, 1, 1, '2023-12-28 10:30:00'),
(102, 2, 2, '2024-01-15 15:10:00'),
(103, 3, 3, '2024-03-02 09:00:00'),
(104, 4, 1, '2024-07-22 11:45:00'),
(105, 5, 1, '2024-08-12 16:20:00'),
(101, 3, 2, '2024-09-05 10:10:00'),
(102, 1, 1, '2024-10-10 14:00:00'),
(103, 2, 1, '2024-11-01 12:45:00'),
(104, 5, 1, '2024-11-01 18:30:00'),
(105, 4, 1, '2024-11-01 20:00:00');


Q1. Find all transactions made in the last 30 days from today.
Q2. Retrieve all transactions that happened in the month of October 2024.
Q3. Display total sales amount per day for November 2024.
Q4. Find customers who made their first purchase in 2024.
Q5. Calculate the number of transactions per month in 2024.
Q6. Find total revenue generated in the current year.
Q7. Show transactions that occurred on weekends.
Q8. Calculate average purchase amount per customer per quarter.
Q9. Find all transactions where the purchase happened between 10 AM and 5 PM.
Q10. Display how long each customer has been associated with the company (in years & months).