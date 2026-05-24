

-----------============Conversion Function(CAST Vs CONVERT).========================

Select CustomerKey+''+FirstName, * from Dimcustomer

Select GETDATE()

--'12/8/2009'


--We can not convert char\Varchar\Nvarchar data to int
--We can conervt int to char\Varchar\Nvarchar
--We can convert datetime to char\Varchar\Nvarchar
--we can convert char\Varchar\Nvarchar to datetime is valid date is there


/*

Types of Conversions:

Cast
Convert

Syntax for CAST: CAST ( value/expression AS data_type [ ( length ) ] ) 
Syntax for CONVERT: CONVERT ( data_type [ ( length ) ] , value/expression [ , style ] )
*/

-- Cast

Select cast(CustomerKey as varchar(100))+' '+FirstName, * from Dimcustomer

Select * from Dimcustomer


Select 'My Name is ' + FirstName + ' ' + LastName+ ' and my Yearly income is ' + YearlyIncome As Details ,* 
from Dimcustomer


Select 'My Name is ' + FirstName + ' ' + LastName+ ' and my Yearly income is ' + cast(YearlyIncome as Varchar(50)) As Details ,* 
from Dimcustomer

select  (cast(EmployeeKey as Varchar(100)) + Space(1) + FirstName) as FullName, * from DimEmployee

Select cast(YearlyIncome as int),* from Dimcustomer


--Convert

Select CONVERT(Varchar(100),CustomerKey )+ ' '+ FirstName, * from Dimcustomer


Select CONVERT(int,YearlyIncome),* from Dimcustomer

Select * from DimEmployee

Select convert(varchar,BirthDate,3) As DerrivedBirthDate,BirthDate,* from Dimcustomer

Select  getdate()

--Datetime Convertion formats Example
SELECT convert(varchar,getdate())    -- Mar 15 2018 10:35AM
SELECT convert(varchar,getdate(),0)  -- Mar 15 2018 10:35AM
SELECT convert(varchar,getdate(),1)  -- 03/15/18
SELECT convert(varchar,getdate(),2)  -- 18.03.15
SELECT convert(varchar,getdate(),3)  -- 15/03/18
SELECT convert(varchar,getdate(),4)  -- 15.03.18
SELECT convert(varchar,getdate(),5)  -- 15-03-18
SELECT convert(varchar,getdate(),6)  -- 15 Mar 18
SELECT convert(varchar,getdate(),7)  -- Mar 15, 18
SELECT convert(varchar,getdate(),8)  -- 10:39:39
SELECT convert(varchar,getdate(),9)  -- Mar 15 2018 10:39:48:373AM
SELECT convert(varchar,getdate(),10) -- 03-15-18
SELECT convert(varchar,getdate(),11) -- 18/03/15
SELECT convert(varchar,getdate(),15) -- 180315
SELECT convert(varchar,getdate(),13) -- 15 Mar 2018 10:41:07:590
SELECT convert(varchar,getdate(),14) -- 10:41:25:903
SELECT convert(varchar,getdate(),20) -- 2018-03-15 10:43:56
SELECT convert(varchar,getdate(),21) -- 2018-03-15 10:44:04.950
SELECT convert(varchar,getdate(),22) -- 03/15/18 10:44:50 AM
SELECT convert(varchar,getdate(),23) -- 2018-03-15
SELECT convert(varchar,getdate(),24) -- 10:45:45
SELECT convert(varchar,getdate(),25) -- 2018-03-15 10:46:11.263


SELECT convert(varchar, getdate(), 100) -- Oct 23 2016 10:22AM (or PM)
SELECT convert(varchar, getdate(), 101) -- 10/23/2016
SELECT convert(varchar, getdate(), 102) -- 2016.10.23
SELECT convert(varchar, getdate(), 103) -- 23/10/2016
SELECT convert(varchar, getdate(), 104) -- 23.10.2016
SELECT convert(varchar, getdate(), 105) -- 23-10-2016
SELECT convert(varchar, getdate(), 106) -- 23 Oct 2016
SELECT convert(varchar, getdate(), 107) -- Oct 23, 2016
SELECT convert(varchar, getdate(), 108) -- 09:10:34
SELECT convert(varchar, getdate(), 109) -- Oct 23 2016 11:10:33:993AM (or PM)
SELECT convert(varchar, getdate(), 110) -- 10-23-2016
SELECT convert(varchar, getdate(), 111) -- 2016/10/23
SELECT convert(varchar, getdate(), 112) -- 20161023
SELECT convert(varchar, getdate(), 113) -- 23 Oct 2016 06:10:55:383
SELECT convert(varchar, getdate(), 114) -- 06:10:55:383(24h)
SELECT convert(varchar, getdate(), 120) -- 2016-10-23 06:10:55(24h)
SELECT convert(varchar, getdate(), 121) -- 2016-10-23 06:10:55.383
SELECT convert(varchar, getdate(), 126) -- 2016-10-23T06:10:55.383

