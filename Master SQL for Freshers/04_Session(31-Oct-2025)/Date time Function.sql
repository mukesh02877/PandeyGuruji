
------------Date Time Function----------

Select * from DimEmployee

--•	GETDATE() 

Select GETDATE() -- System Time
Select GETUTCDATE()  -- Server Time(Real time using)

Select GETUTCDATE() as ReportGeneratedDate, *  from FactInternetSales

Create table Emp123(ID int identity(1,1), EMPName Varchar(100), LastUpdated Datetime default GetDate())
insert into Emp123 (EMPName) values ('Ranjeeta')

Select * from Emp123
--


--DATEADD() 

SELECT DATEADD(day,90,GETDATE())

SELECT DATEADD(day,-60,GETDATE())

-- Last one month order data
Select *,GETDATE() as ReportGeneratedDate from FactInternetSales
Where OrderDate > DATEADD(day,-30,GETDATE())

Select *,GETDATE() as ReportGeneratedDate from FactInternetSales
Where OrderDate > DATEADD(WEEK,-16,GETDATE())

Select *,GETDATE() as ReportGeneratedDate from FactInternetSales
Where OrderDate > DATEADD(MONTH,-2,GETDATE())

Select *,GETDATE() as ReportGeneratedDate from FactInternetSales
Where OrderDate > DATEADD(YEAR,-5,GETDATE())


Select OrderDate,DATEADD(day,-10,OrderDate), * from FactInternetSales

Declare @Date datetime
Select @Date = DATEADD(day,-60,GETDATE())

Select * from FactInternetSales where OrderDate>=@Date

Select * from FactInternetSales where OrderDate>='2022-01-02 10:18:12.783'


--DATEPART()

SELECT DATEPART(year, GETDATE()) 

SELECT DATEPART(DAY, GETDATE())

SELECT DATEPART(MONTH, GETDATE())

Select DATEPART(year, OrderDate),DATEPART(MONTH, OrderDate),DATEPART(QUARTER, OrderDate),
DATEPART(DAY, OrderDate),OrderDate,* from FactInternetSales

--- Find the total order on 2010

Select count(*) as TodalOrder from FactInternetSales 
where DATEPART(year, OrderDate) = 2010

Select DATEPART(year, OrderDate) As Years, count(*) as TotalOrder from FactInternetSales 
Group by DATEPART(year, OrderDate)
order by TotalOrder desc


Select DATEPART(year, OrderDate) As Years, 'Q'+ cast(DATEPART(QUARTER, OrderDate) as varchar(100)) TotalOrderInQUARTER,
       count(*) as TotalOrder  from FactInternetSales 
Group by DATEPART(year, OrderDate), DATEPART(QUARTER, OrderDate)
having DATEPART(year, OrderDate) = 2013
order by 3 desc

Select cast(1 as varchar(10)) +' Mukesh'

Select * from Revenue
Update Revenue set TotalOrderInQUARTER = 'Q4' where TotalOrderInQUARTER = 4

--- Find the total order on Dec month on year 2011

Select * from FactInternetSales
where DATEPART(MONTH, OrderDate) = 12
And DATEPART(year, OrderDate) = 2011

Select * from DimEmployee

Select DATEPART(year, BirthDate) As BirthYear ,BirthDate,* from DimEmployee

--Find the Employee information which Birthyear is 1974

Select * from DimEmployee Where DATEPART(year, BirthDate) = 1974

Select * from DimEmployee where DATEPART(MONTH, BirthDate) = 12

--Find the joining year

Select DATEPART(year, HireDate) As HireDate ,BirthDate,* 
from DimEmployee where DATEPART(year, HireDate) = 2007

Select DATEPART(MONTH, HireDate) As HireMonh ,BirthDate,* 
from DimEmployee where DATEPART(MONTH, HireDate) = '7' 


--DATEDIFF()
Select 10-2

Select DATEDIFF(YEAR, BirthDate,getdate()) As Age ,* from DimEmployee

Select * from DimEmployee where DATEDIFF(YEAR, BirthDate,getdate()) >= 50

Select DATEDIFF(YEAR, HireDate,getdate()) As Tenure ,* from DimEmployee

Select DATEDIFF(YEAR, HireDate,getdate()) As Tenure ,* from DimEmployee

Select OrderDate,ShipDate,DATEDIFF(day,OrderDate,ShipDate),  * from FactInternetSales

--Greater than 10 years

Select DATEDIFF(YEAR, HireDate,getdate()) As Tenure ,* from DimEmployee 
where DATEDIFF(YEAR, HireDate,getdate()) >= 10

--DATENAME()
SELECT DATENAME(QUARTER, getdate()) AS 'Today Is'
SELECT DATENAME(dw, getdate()) AS 'Today Is'
SELECT DATENAME(dw, HireDate), HireDate,* from DimEmployee

--Q. Which days higest no of product is ordered.

Select DATEPART(year, OrderDate) Years,DATENAME(dw, OrderDate) As WeekekDays, 
       count(*) as TotalOrder  from FactInternetSales 
Group by DATEPART(year, OrderDate),DATENAME(dw, OrderDate)
having DATEPART(year, OrderDate) = 2013
order by 3 desc

--Q. Find the Details of How many emp is join on Weekday?

SELECT DATENAME(dw, HireDate) as JoiningWeekdays, Count(*) as TotalempJoined
from DimEmployee
GROUP BY DATENAME(dw, HireDate)
order by 2 desc


SELECT DATENAME(dw, HireDate) as JoiningWeekdays, Count(*) as TotalempJoined
from DimEmployee
GROUP BY DATENAME(dw, HireDate)
Having DATENAME(dw, HireDate) = 'Thursday'


SELECT  DATENAME(dw, HireDate),* from DimEmployee where DATENAME(dw, HireDate) = 'Monday'

SELECT DATENAME(month, getdate()) AS 'Month'

SELECT DATENAME(dw, '2021-02-15') 

-----------------------------------------
Select EOMONTH('1979-02-15')

Select EOMONTH(getdate())




