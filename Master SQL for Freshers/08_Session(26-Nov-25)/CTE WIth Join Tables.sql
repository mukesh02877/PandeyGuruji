/*----------------------------------------------------------
    1. CREATE TABLES
-----------------------------------------------------------*/

IF OBJECT_ID('Customers') IS NOT NULL DROP TABLE Customers;
IF OBJECT_ID('Transactions') IS NOT NULL DROP TABLE Transactions;
IF OBJECT_ID('Branch') IS NOT NULL DROP TABLE Branch;

CREATE TABLE Branch (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    City VARCHAR(100)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    BranchID INT,
    Phone VARCHAR(20),
    CreatedDate DATE,
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(12,2),
    TransactionDate DATE,
    BranchID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);


/*----------------------------------------------------------
    2. INSERT 20 BRANCH RECORDS
-----------------------------------------------------------*/

INSERT INTO Branch (BranchID, BranchName, City) VALUES
(1,'MG Road Branch','Bangalore'),
(2,'Whitefield Branch','Bangalore'),
(3,'Banjara Hills Branch','Hyderabad'),
(4,'Hitech City Branch','Hyderabad'),
(5,'Andheri Branch','Mumbai'),
(6,'Dadar Branch','Mumbai'),
(7,'Gariahat Branch','Kolkata'),
(8,'Salt Lake Branch','Kolkata'),
(9,'Connaught Place Branch','Delhi'),
(10,'Dwarka Branch','Delhi'),
(11,'Lucknow Main Branch','Lucknow'),
(12,'Gomti Nagar Branch','Lucknow'),
(13,'Chandni Chowk Branch','Delhi'),
(14,'Jayanagar Branch','Bangalore'),
(15,'Vashi Branch','Navi Mumbai'),
(16,'Pimpri Branch','Pune'),
(17,'Kothrud Branch','Pune'),
(18,'Sector 17 Branch','Chandigarh'),
(19,'Vijay Nagar Branch','Indore'),
(20,'Alkapuri Branch','Vadodara');


/*----------------------------------------------------------
    3. INSERT 20 CUSTOMER RECORDS
-----------------------------------------------------------*/

INSERT INTO Customers (CustomerID, CustomerName, BranchID, Phone, CreatedDate) VALUES
(1,'Amit Verma',1,'9876543210','2023-01-10'),
(2,'Riya Singh',2,'9876501234','2023-02-14'),
(3,'John Mathews',3,'9000001111','2023-03-20'),
(4,'Kiran Kumar',4,'9000002222','2023-04-12'),
(5,'Anjali Sharma',5,'9000003333','2023-05-15'),
(6,'Vishal Gupta',6,'9000004444','2023-06-18'),
(7,'Sanjay Rao',7,'9000005555','2023-07-01'),
(8,'Mona Das',8,'9000006666','2023-07-20'),
(9,'Rahul Khanna',9,'9000007777','2023-08-05'),
(10,'Pooja Mehra',10,'9000008888','2023-08-22'),
(11,'Aakash Jain',11,'9000009999','2023-09-10'),
(12,'Shalini Nair',12,'8800001111','2023-09-18'),
(13,'Devendra Prasad',13,'8800002222','2023-10-01'),
(14,'Rekha Bose',14,'8800003333','2023-10-12'),
(15,'Suresh Patil',15,'8800004444','2023-11-05'),
(16,'Kirti Desai',16,'8800005555','2023-11-10'),
(17,'Tarun Bedi',17,'8800006666','2023-11-15'),
(18,'Neha Kumari',18,'8800007777','2023-11-18'),
(19,'Aditya Sharma',19,'8800008888','2023-11-20'),
(20,'Priya Shetty',20,'8800009999','2023-11-25');


/*----------------------------------------------------------
    4. INSERT 20 TRANSACTION RECORDS
-----------------------------------------------------------*/

INSERT INTO Transactions (TransactionID, CustomerID, Amount, TransactionDate, BranchID) VALUES
(1,1,95000,'2023-12-01',1),
(2,2,70000,'2023-12-02',2),
(3,3,15000,'2023-12-05',3),
(4,4,25000,'2023-12-06',4),
(5,5,85000,'2023-12-08',5),
(6,6,60000,'2023-12-09',6),
(7,7,30000,'2023-12-10',7),
(8,8,75000,'2023-12-11',8),
(9,9,40000,'2023-12-12',9),
(10,10,50000,'2023-12-12',10),
(11,11,67000,'2023-12-13',11),
(12,12,28000,'2023-12-14',12),
(13,13,90000,'2023-12-15',13),
(14,14,15000,'2023-12-15',14),
(15,15,82000,'2023-12-16',15),
(16,16,12000,'2023-12-16',16),
(17,17,99000,'2023-12-17',17),
(18,18,45000,'2023-12-18',18),
(19,19,20000,'2023-12-18',19),
(20,20,30000,'2023-12-19',20);


-------------------
 drop table Emp2

CREATE TABLE Emp1 (
    EmpID INT ,
    Name VARCHAR(50)
);

CREATE TABLE Emp2 (
    EmpID INT ,
    Name VARCHAR(50)
);


INSERT INTO Emp1 (EmpID, Name) VALUES
(1, 'Amit'),
(2, 'Ravi'),
(3, 'Neha'),
(4, 'Priya'),
(5, 'Rahul'),
(6, 'Sneha'),
(7, 'Ankit'),
(8, 'Pooja'),
(9, 'Vikas'),
(10, 'Kiran');

INSERT INTO Emp1 ( Name) VALUES ('Ranjeeta')
INSERT INTO Emp1 ( Name) VALUES ('Mukesh')



INSERT INTO Emp2 (EmpID, Name) VALUES
(5, 'Pandey'),
(6, 'Sneha'),
(7, 'Ankit'),
(8, 'Pooja'),
(9, 'Vikas'),
(11, 'Suresh'),
(12, 'Asha'),
(13, 'Manoj'),
(14, 'Deepa'),
(15, 'Nitin');

INSERT INTO Emp2 ( Name) VALUES ('Prabhu')


Select * from emp1
Select * from emp2
