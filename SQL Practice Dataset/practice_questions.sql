-- Practice Questions for SQL Practice Dataset 2025 (SQL Server)
-- Each question includes a hint as a SQL comment below it.

-- Q1: List all customers.
-- Hint: SELECT * FROM Customers;

-- Q2: List customers from 'Mumbai'.
-- Hint: SELECT * FROM Customers WHERE City = 'Mumbai';

-- Q3: Count customers by city.
-- Hint: SELECT City, COUNT(*) AS CustomerCount FROM Customers GROUP BY City;

-- Q4: Top 10 customers by number of purchases.
-- Hint: SELECT TOP 10 c.CustomerID, c.FirstName, c.LastName, COUNT(s.SaleID) AS Purchases FROM Customers c JOIN Sales s ON c.CustomerID = s.CustomerID GROUP BY c.CustomerID, c.FirstName, c.LastName ORDER BY Purchases DESC;

-- Q5: Total revenue per product (price * qty).
-- Hint: SELECT p.ProductID, p.ProductName, SUM(p.Price * s.Quantity) AS Revenue FROM Products p JOIN Sales s ON p.ProductID = s.ProductID GROUP BY p.ProductID, p.ProductName ORDER BY Revenue DESC;

-- Q6: Monthly sales count for 2024.
-- Hint: SELECT YEAR(SaleDate) AS Yr, MONTH(SaleDate) AS Mo, COUNT(*) AS SalesCount FROM Sales WHERE YEAR(SaleDate)=2024 GROUP BY YEAR(SaleDate), MONTH(SaleDate) ORDER BY Mo;

-- Q7: Find products never sold.
-- Hint: SELECT * FROM Products p WHERE NOT EXISTS (SELECT 1 FROM Sales s WHERE s.ProductID = p.ProductID);

-- Q8: Average claim billed amount per insurance plan.
-- Hint: SELECT InsurancePlan, AVG(BilledAmount) AS AvgBilled FROM Claims c JOIN Patients p ON c.PatientID = p.PatientID GROUP BY InsurancePlan;

-- Q9: Patients with unpaid claims (PaidAmount = 0).
-- Hint: SELECT DISTINCT p.PatientID, p.Name FROM Patients p JOIN Claims c ON p.PatientID = c.PatientID WHERE c.PaidAmount = 0;

-- Q10: Length of stay per claim.
-- Hint: SELECT ClaimID, DATEDIFF(DAY, AdmitDate, DischargeDate) AS StayDays FROM Claims;

-- Q11: Top 5 highest paid employees.
-- Hint: SELECT TOP 5 * FROM Employees ORDER BY Salary DESC;

-- Q12: Employee count per department.
-- Hint: SELECT d.DeptName, COUNT(e.EmpID) AS EmpCount FROM Departments d LEFT JOIN Employees e ON d.DeptID = e.Department GROUP BY d.DeptName;

-- Q13: Average salary by department.
-- Hint: SELECT d.DeptName, AVG(e.Salary) AS AvgSalary FROM Departments d JOIN Employees e ON d.DeptID = e.Department GROUP BY d.DeptName;

-- Q14: Customers who signed up in 2023.
-- Hint: SELECT * FROM Customers WHERE YEAR(SignupDate) = 2023;

-- Q15: Most recent sale for each customer.
-- Hint: SELECT s.CustomerID, MAX(s.SaleDate) AS LastSale FROM Sales s GROUP BY s.CustomerID;

-- Q16: Revenue trend per year.
-- Hint: SELECT YEAR(SaleDate) AS Yr, SUM(p.Price * s.Quantity) AS Revenue FROM Sales s JOIN Products p ON s.ProductID = p.ProductID GROUP BY YEAR(SaleDate) ORDER BY Yr;

-- Q17: Find claims where paid < billed.
-- Hint: SELECT * FROM Claims WHERE PaidAmount < BilledAmount;

-- Q18: Top 10 diagnoses by claim count.
-- Hint: SELECT DiagnosisCode, COUNT(*) AS Count FROM Claims GROUP BY DiagnosisCode ORDER BY Count DESC;

-- Q19: Create a view for customer purchases.
-- Hint: CREATE VIEW vw_CustomerPurchases AS SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(s.SaleID) AS PurchaseCount FROM Customers c LEFT JOIN Sales s ON c.CustomerID = s.CustomerID GROUP BY c.CustomerID,c.FirstName,c.LastName;

-- Q20: Use window function: rank products by revenue.
-- Hint: SELECT ProductID, ProductName, Revenue, RANK() OVER (ORDER BY Revenue DESC) AS RevenueRank FROM (SELECT p.ProductID, p.ProductName, SUM(p.Price*s.Quantity) AS Revenue FROM Products p JOIN Sales s ON p.ProductID=s.ProductID GROUP BY p.ProductID,p.ProductName) t;

-- Q21: Customers with > 5 purchases.
-- Hint: SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(s.SaleID) AS Purchases FROM Customers c JOIN Sales s ON c.CustomerID = s.CustomerID GROUP BY c.CustomerID,c.FirstName,c.LastName HAVING COUNT(s.SaleID) > 5;

-- Q22: Find employees hired before 2015.
-- Hint: SELECT * FROM Employees WHERE HireDate < '2015-01-01';

-- Q23: Total claims billed per year.
-- Hint: SELECT YEAR(AdmitDate) AS Yr, SUM(BilledAmount) AS TotalBilled FROM Claims GROUP BY YEAR(AdmitDate) ORDER BY Yr;

-- Q24: Customers who bought 'Electronics' products.
-- Hint: SELECT DISTINCT c.* FROM Customers c JOIN Sales s ON c.CustomerID=s.CustomerID JOIN Products p ON s.ProductID=p.ProductID WHERE p.Category='Electronics';

-- Q25: Most expensive product.
-- Hint: SELECT TOP 1 * FROM Products ORDER BY Price DESC;

-- Q26: Join: employees with department names.
-- Hint: SELECT e.EmpID, e.FirstName, e.LastName, d.DeptName FROM Employees e JOIN Departments d ON e.Department = d.DeptID;

-- Q27: Subquery: products priced above average.
-- Hint: SELECT * FROM Products WHERE Price > (SELECT AVG(Price) FROM Products);

-- Q28: CTE example: yearly revenue using CTE.
-- Hint: WITH YearRevenue AS (SELECT YEAR(SaleDate) AS Yr, SUM(p.Price*s.Quantity) AS Revenue FROM Sales s JOIN Products p ON s.ProductID=p.ProductID GROUP BY YEAR(SaleDate)) SELECT * FROM YearRevenue ORDER BY Yr;

-- Q29: Find customers and their total spent (include zero).
-- Hint: SELECT c.CustomerID, c.FirstName, c.LastName, ISNULL(SUM(p.Price*s.Quantity),0) AS TotalSpent FROM Customers c LEFT JOIN Sales s ON c.CustomerID=s.CustomerID LEFT JOIN Products p ON s.ProductID=p.ProductID GROUP BY c.CustomerID,c.FirstName,c.LastName;

-- Q30: Find claims with stay > average stay.
-- Hint: SELECT ClaimID, DATEDIFF(DAY,AdmitDate,DischargeDate) AS Stay FROM Claims WHERE DATEDIFF(DAY,AdmitDate,DischargeDate) > (SELECT AVG(DATEDIFF(DAY,AdmitDate,DischargeDate)) FROM Claims);

-- Q31: Delete test: remove customers with no purchases (use caution).
-- Hint: DELETE FROM Customers WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Sales);

-- Q32: Update example: give 10% raise to employees in 'Data' dept.
-- Hint: UPDATE Employees SET Salary = Salary * 1.10 WHERE Department = (SELECT DeptID FROM Departments WHERE DeptName='Data');

-- Q33: Find top customers by revenue (top 10).
-- Hint: SELECT TOP 10 c.CustomerID, c.FirstName, c.LastName, SUM(p.Price*s.Quantity) AS Revenue FROM Customers c JOIN Sales s ON c.CustomerID=s.CustomerID JOIN Products p ON s.ProductID=p.ProductID GROUP BY c.CustomerID,c.FirstName,c.LastName ORDER BY Revenue DESC;

-- Q34: Find products with price between 1000 and 20000.
-- Hint: SELECT * FROM Products WHERE Price BETWEEN 1000 AND 20000;

-- Q35: Find patients older than 60 years.
-- Hint: SELECT PatientID, Name, DOB, DATEDIFF(YEAR, DOB, GETDATE()) AS Age FROM Patients WHERE DATEDIFF(YEAR, DOB, GETDATE()) > 60;

-- Q36: Find employees with duplicate last names.
-- Hint: SELECT LastName, COUNT(*) AS Cnt FROM Employees GROUP BY LastName HAVING COUNT(*) > 1;

-- Q37: Find first sale date per product.
-- Hint: SELECT ProductID, MIN(SaleDate) AS FirstSale FROM Sales GROUP BY ProductID;

-- Q38: Pivot-like: monthly sales count for a specific year (example 2024).
-- Hint: SELECT MONTH(SaleDate) AS Month, COUNT(*) AS SalesCount FROM Sales WHERE YEAR(SaleDate)=2024 GROUP BY MONTH(SaleDate) ORDER BY Month;

-- Q39: Calculate claim payment rate per insurance plan.
-- Hint: SELECT p.InsurancePlan, SUM(CASE WHEN c.BilledAmount>0 THEN c.PaidAmount / c.BilledAmount ELSE 0 END) AS PaymentRatio FROM Patients p JOIN Claims c ON p.PatientID = c.PatientID GROUP BY p.InsurancePlan;

-- Q40: Find customers who purchased more than 3 distinct product categories.
-- Hint: SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(DISTINCT p.Category) AS CategoryCount FROM Customers c JOIN Sales s ON c.CustomerID=s.CustomerID JOIN Products p ON s.ProductID=p.ProductID GROUP BY c.CustomerID,c.FirstName,c.LastName HAVING COUNT(DISTINCT p.Category) > 3;

-- Q41: Find 3 most recent claims.
-- Hint: SELECT TOP 3 * FROM Claims ORDER BY AdmitDate DESC;

-- Q42: Create index suggestion (example).
-- Hint: CREATE INDEX IX_Sales_CustomerID ON Sales(CustomerID); -- improves queries filtering by CustomerID

-- Q43: Find average quantity sold per sale.
-- Hint: SELECT AVG(Quantity) AS AvgQty FROM Sales;

-- Q44: Find customers with name starting with 'A'.
-- Hint: SELECT * FROM Customers WHERE FirstName LIKE 'A%';

-- Q45: Get product category distribution.
-- Hint: SELECT Category, COUNT(*) AS Count FROM Products GROUP BY Category;

-- Q46: Show unpaid claim amounts total per patient.
-- Hint: SELECT p.PatientID, p.Name, SUM(c.BilledAmount - c.PaidAmount) AS Unpaid FROM Patients p JOIN Claims c ON p.PatientID = c.PatientID GROUP BY p.PatientID, p.Name;

-- Q47: Use CROSS APPLY: customers with their latest sale row.
-- Hint: SELECT c.CustomerID, c.FirstName, c.LastName, s.* FROM Customers c CROSS APPLY (SELECT TOP 1 * FROM Sales s WHERE s.CustomerID = c.CustomerID ORDER BY SaleDate DESC) s;

-- Q48: Find products with price higher than median price.
-- Hint: WITH Ordered AS (SELECT Price, ROW_NUMBER() OVER (ORDER BY Price) AS rn, COUNT(*) OVER () AS tot FROM Products) SELECT AVG(Price) FROM (SELECT Price FROM Ordered WHERE rn IN ((tot+1)/2, (tot/2)+1)) t;

-- Suggested next steps:
-- 1. Import schema.sql, then data.sql into SQL Server (SSMS or sqlcmd).
-- 2. Run queries from this file in order to practice.
-- 3. Modify sample data or add more rows to explore joins and performance.
