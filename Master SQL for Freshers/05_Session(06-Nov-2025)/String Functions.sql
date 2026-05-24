

--================String functions in SQL==================

--LEFT() 

SELECT LEFT('MukeshPandey',3)  

Select LEFT(FirstName,4) as First4Letter ,* from DimEmployee

--RIGHT()

SELECT right('MukeshPandey',4)  

Select right(FirstName,4) ,* from DimEmployee

--How we can find the Name starting with Vowel Letter
Select LEFT(FirstName,1),* from DimCustomer

Select * from DimCustomer where LEFT(FirstName,1) in ('a','e','i','o','u')

Select count(*) from DimCustomer where LEFT(FirstName,1) in ('a','e','i','o','u')

Select count(1) from DimCustomer where LEFT(FirstName,1) in ('a','e','i','o','u')

Select 'Ranjeeta' from DimCustomer

Select count(1) from DimCustomer

Select LEFT(FirstName,1),* from DimCustomer where  LEFT(FirstName,1) = 'R'

Select count(MiddleName) from DimCustomer where MiddleName is not null
Select count(*) from DimCustomer where MiddleName is not null


Select * from DimCustomer where LEFT(FirstName,1) not in ('a','e','i','o','u')

--How can find the Name ending with Vowel Letter

Select * from DimCustomer where Right(FirstName,1) in ('a','e','i','o','u')

Select * from DimCustomer where Right(FirstName,1) not in ('a','e','i','o','u')

--How can find the FirstName starting with Vowel Letter and FirstName ending with Vowel Letter

Select * from DimCustomer where LEFT(FirstName,1) in ('a','e','i','o','u') and Right(FirstName,1) in ('a','e','i','o','u')


--LTRIM() 

SELECT LTRIM('   MukeshPandey')


--RTRIM() 

SELECT RTRIM('   MukeshPandey     ')

SELECT LTRIM(RTRIM('   MukeshPandey     '))

select * into DimEmployee1 from DimEmployee

Select * from DimEmployee1

--REPLACE() 
--REPLACE(find, replace, string) 

SELECT REPLACE('My name is Mukesh','Mukesh', 'Mridul')

Select  REPLACE(EmailAddress,'adventure-works.com','Graphy.com') as NewEmailAddress,EmailAddress, * from DimEmployee1

update DimEmployee1
set EmailAddress = REPLACE(EmailAddress,'adventure-works.com','Graphy.com')

select * from DimEmployee1

--STUFF

Select * from DimEmployee1

SELECT STUFF(EmailAddress,3,4,'XXXX'),EmailAddress, * from DimEmployee1

SELECT STUFF(Phone,3,8,'********'),Phone, * from DimEmployee1
SELECT STUFF(Phone,3,6,'********'),Phone, * from DimEmployee1

SELECT STUFF(Phone,4,5,'XXXX'),Phone, * from DimEmployee1


--REVERSE() 

select REVERSE(FirstName),* from DimEmployee

--CHARINDEX 

SELECT CHARINDEX('SQL', 'Microsoft SQL Server') 

select CHARINDEX('@',EmailAddress),EmailAddress, * from DimEmployee

select CHARINDEX('@',FirstName), * from DimEmployee



--PATINDEX 

Select PATINDEX('%CD%','ABCDhhjhjghjgjhgjh')

Select PATINDEX('%ter%', 'interesting data'); 

--LEN

select top 1 LEN(FirstName) as LentFirstName,FirstName from DimEmployee order by LentFirstName desc

select LEN(Title),* from DimEmployee

-- Find the maxumimum name lenghth stored in the FrstName and what is that Name. 

select LEN(FirstName) as LenghtName,* from DimEmployee order by 1 desc

select top 1 LEN(FirstName) as LenghtName,* from DimEmployee order by 1 desc


--Marketing  Manager


--SUBSTRING

SELECT SUBSTRING('abcdefgh', 5, 3) 

SELECT SUBSTRING('SQL SERVER is USEFUL', 5, 6) 

SELECT LEFT('MukeshPandey',4)  

Select * from DimEmployee1

-- Trim the Values which is before @ in the EmailAddress column

Select SUBSTRING(EmailAddress,1,4) as NTID,EmailAddress, * from DimEmployee

Select SUBSTRING(EmailAddress,1,CHARINDEX('@',EmailAddress)-1) as NTID,EmailAddress, * from DimEmployee



--LOWER / UPPER

select LOWER(FirstName),* from DimEmployee

select UPPER(FirstName),* from DimEmployee

Select * from DimEmployee

Update DimEmployee
Set FirstName = LOWER(FirstName)

Select * from DimEmployee

Select UPPER(Left(FirstName,1))+SUBSTRING(FirstName,2,Len(FirstName)) , * from DimEmployee

Update DimEmployee
Set FirstName = UPPER(Left(FirstName,1))+SUBSTRING(FirstName,2,Len(FirstName))

Select * from DimEmployee

-- Space and Concat

Select * from DimEmployee

Select CONCAT(FirstName,Space(1),LastName) as FullName, * from DimEmployee

select  FirstName + LastName as FullName, * from DimEmployee


select  (FirstName + Space(1) + LastName) as FullName, * from DimEmployee

select  (FirstName + ' ' + LastName) as FullName, * from DimEmployee

Select * from DimEmployee

-- This will throw an Conversion Error.
select  (EmployeeKey + Space(1) + FirstName) as FullName, * from DimEmployee

Select CONCAT(EmployeeKey,Space(1),FirstName) as EMpKeyFirstName, * from DimEmployee

select  (cast(EmployeeKey as Varchar(100))+ Space(1) + FirstName) as FullName, * from DimEmployee

