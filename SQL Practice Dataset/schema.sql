-- SQL Server schema for SQL Practice Dataset 2025
-- Retail: Customers, Products, Sales
-- Healthcare: Patients, Claims
-- HR: Departments, Employees

IF OBJECT_ID('dbo.Sales','U') IS NOT NULL DROP TABLE dbo.Sales;
IF OBJECT_ID('dbo.Customers','U') IS NOT NULL DROP TABLE dbo.Customers;
IF OBJECT_ID('dbo.Products','U') IS NOT NULL DROP TABLE dbo.Products;
IF OBJECT_ID('dbo.Claims','U') IS NOT NULL DROP TABLE dbo.Claims;
IF OBJECT_ID('dbo.Patients','U') IS NOT NULL DROP TABLE dbo.Patients;
IF OBJECT_ID('dbo.Employees','U') IS NOT NULL DROP TABLE dbo.Employees;
IF OBJECT_ID('dbo.Departments','U') IS NOT NULL DROP TABLE dbo.Departments;
GO

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Gender CHAR(1),
    City NVARCHAR(50),
    SignupDate DATE
);
GO

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Price DECIMAL(10,2)
);
GO

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT,
    SaleDate DATE
);
GO

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Gender CHAR(1),
    DOB DATE,
    City NVARCHAR(50),
    InsurancePlan NVARCHAR(50)
);
GO

CREATE TABLE Claims (
    ClaimID INT PRIMARY KEY,
    PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
    AdmitDate DATE,
    DischargeDate DATE,
    DiagnosisCode NVARCHAR(10),
    BilledAmount DECIMAL(10,2),
    PaidAmount DECIMAL(10,2)
);
GO

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName NVARCHAR(50),
    Location NVARCHAR(50)
);
GO

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department INT FOREIGN KEY REFERENCES Departments(DeptID),
    HireDate DATE,
    Salary DECIMAL(10,2)
);
GO