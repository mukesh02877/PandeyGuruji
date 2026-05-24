
Select * from dimCustomer

Create Table EMployee(
    ID int identity(1,1), -- 1: Starting,1 : Incremental,--ID int identity -- Default --1: Starting,1 : Incremental
    FirstName Varchar(100),
    LastName Varchar(100),
    Salary float
    )

insert into EMployee values ('Mukesh', 'Pandey', 1000)

Select * from EMployee

-- Copy the data from existing Table

insert into EMployee(FirstName, LastName,Salary)
Select  FirstName, LastName, YearlyIncome from DimCustomer

Truncate table EMployee

 -- Table copy 

 Select * into dimCustomer_Copy12 from dimCustomer 

 Select * from dimCustomer_Copy

 ---- Copy Copy column only not data
 
 Select * into dimCustomer_Copy1 from dimCustomer where 1 = 2

 Select * from dimCustomer_Copy1

 Select * from dimCustomer where 1 = 1

 --Alter
 Alter Table EMployee Add  Mobile bigint

 -- Remove column
 Alter Table EMployee drop column Mobile

 Select * from EMployee


 -- Update

 Update EMployee
 Set Mobile = 8309569513 where ID = 1


 Update EMployee
 Set Mobile = 9866455299 where ID = 1

 Select * from dimCustomer_Copy12

BEGIN TRANSACTION
Update dimCustomer_Copy12
Set YearlyIncome = 60000

BEGIN TRANSACTION
Update dimCustomer_Copy12
Set YearlyIncome = 60000
where CustomerKey = 11000

-- Mandatory: Need to perform either one below oration
Rollback
Commit



