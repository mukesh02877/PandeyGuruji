
--Filtered Indexes
/*
 Filtered Indexes which is an index with a WHERE clause

 A Filtered Index, which is an optimized non-clustered index, allows us to define a filter predicate, 
 a WHERE clause, while creating the index.

 
 */
 --drop table Employee
 -- Script 1

-- Create Employee table with a clustered index on primary key
CREATE TABLE Employee
(
EmpID INT PRIMARY KEY ,
EmpName VARCHAR(100) NOT NULL,
HireDate DATE NULL, 
DOJ DATE NULL, 
)
GO
-- Creating a non clustered index on HireDate column
CREATE NONCLUSTERED INDEX NC_Employee_HireDate
ON Employee(HireDate) 
GO
-- Creating a non clustered Filetered index on DOJ column
CREATE NONCLUSTERED INDEX FI_Employee_DOJ
ON Employee(DOJ)
WHERE DOJ IS NOT NULL --Notice here the filter criteria for the index
GO

Select * from Employee

---- Looping(While Loop\ Cursor)
DECLARE @intCounter INT = 1 
WHILE @intCounter <= 1000
BEGIN
IF (@intCounter % 100) = 0
BEGIN
INSERT INTO Employee(EmpID, EmpName, HireDate, DOJ)
VALUES (@intCounter, 'ABC' + CAST(@intCounter AS VARCHAR), CAST((GETDATE() - @intCounter) AS DATE)
, CAST((GETDATE() - @intCounter) AS DATE))
END
ELSE
BEGIN
INSERT INTO Employee(EmpID, EmpName, HireDate, DOJ)
VALUES (@intCounter, 'ABC' + CAST(@intCounter AS VARCHAR), NULL, NULL)
END
SET @intCounter = @intCounter + 1
END

Select * from Employee



--How we can print A-Z or a-z

   Select ASCII('A') 
   Select CHAR(65)    
  
  Declare @a int, @b int
  Set @a = 65 
  Set @b = 90
  
  While @a <= @b --91 <= 90  
  Begin
         Select CHAR(@a)
         
         Set @a = @a+1
  End



  ------------
  select * into TestDimCustomer from DimCustomer   
 
 Select * from TestDimCustomer

 Create clustered index IX_TestDimCustomer on TestDimCustomer(customerKey)

 -------------Start-------------------
 
 Declare @max int, @min int, @emiladdress Nvarchar(1000), @Gender varchar(10)
 
 Select  @max = MAX(customerKey),@min = MIN(CustomerKey)   from TestDimCustomer
 
 While @min <= @max 
  Begin 
        Select @emiladdress = EmailAddress, @Gender = Gender from TestDimCustomer 
		Where CustomerKey = @min
		
        If @Gender = 'M'
        Begin 
         Update TestDimCustomer
         Set Suffix = left(@emiladdress,3)
         Where CustomerKey = @min
         End

		If @Gender = 'F'
        Begin 
         Update TestDimCustomer
         Set Suffix = left(@emiladdress,5)
         Where CustomerKey = @min
         End

       set @min = @min+1
      End   
      
      Select * from TestDimCustomer 