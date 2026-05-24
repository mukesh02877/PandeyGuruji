

--------======================Set Operator in SQL=================================

create table courses_b
(courseID int,
CourseName char(30) )
--select * from courses

insert into courses_b  values (1,'Arts')
insert into courses_b  values (2,'Science')
insert into courses_b  values (3,'coummerce')
insert into courses_b  values (4,'IT')

insert into courses_b  values (7,'Data Science')


create table courses_a
(courseID int,
CourseName char(30) )
--select * from courses

insert into courses_a  values (1,'Arts')
insert into courses_a  values (2,'Science')
insert into courses_a  values (3,'coummerce')
insert into courses_a  values (4,'IT')
insert into courses_a  values (9,'Sanskrit')
insert into courses_a(courseID)  values (10)



select * from courses_a
Select * from courses_b

--•	Union: Removing the Duplicate Values
Select courseID,CourseName from courses_a
Union 
Select courseID,CourseName from courses_b

--Union all: Not Removing the Duplicate Values
Select courseID,CourseName from courses_a
Union all
Select courseID,CourseName from courses_b



--will thro an erro
Select courseID,CourseName from courses_a
Union 
Select CourseName,courseID from courses_b

Select courseID,CourseName from courses_a
Union 
Select courseID from courses_b


--•	Intersect: equivalent to Inner Join

Select courseID,CourseName from courses_a
Intersect
Select courseID,CourseName from courses_b

--•	Except

Select courseID,CourseName from courses_a
Except
Select courseID,CourseName from courses_b