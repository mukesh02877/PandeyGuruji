CREATE TABLE Product (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    price DECIMAL(10,2),
    category VARCHAR(50)
);

CREATE TABLE Customer (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Sales (
    trans_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    customer_id INT,
    date DATE,
    deliver_date DATE,
    FOREIGN KEY (product_id) REFERENCES Product(id),
    FOREIGN KEY (customer_id) REFERENCES Customer(id)
);

-- Products
INSERT INTO Product VALUES 
(1, 'Laptop', 800.00, 'Electronics'),
(2, 'Mobile', 500.00, 'Electronics'),
(3, 'Headphones', 100.00, 'Accessories'),
(4, 'Chair', 150.00, 'Furniture'),
(5, 'Table', 300.00, 'Furniture');

-- Customers
INSERT INTO Customer VALUES 
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');

-- Sales
INSERT INTO Sales VALUES
(101, 1, 2, 1, '2025-01-02', '2025-01-05'), -- Thu
(102, 2, 5, 2, '2025-01-03', '2025-01-06'),
(103, 3, 10, 1, '2025-01-05', '2025-01-07'),
(104, 1, 1, 3, '2025-01-09', '2025-01-11'),
(105, 4, 3, 4, '2025-02-13', '2025-02-15'),
(106, 5, 4, 2, '2025-02-15', '2025-02-20'),
(107, 2, 2, 3, '2025-03-06', '2025-03-10'),
(108, 3, 6, 1, '2025-03-07', '2025-03-12'),
(109, 1, 5, 4, '2025-03-20', '2025-03-25');
