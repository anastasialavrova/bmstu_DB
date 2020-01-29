Use LecturesDB
go

--Скалярная функция
create function dbo.dd (@price money)
returns date
begin
declare @DD date
select @DD = LDB.Data
from LDB join Lectures on LDB.Lno = Lectures.Lno - 24000
where LDB.Price = @price
return @DD
end;
go

select dbo.dd(106)
from LDB

select Lectures.Lname, LDB.Data
from LDB join Lectures on LDB.Lno = Lectures.Lno - 24000
where LDB.Price = 106


--Подставляемая табличная функция
create function dbo.tbl2 (@d1 date, @d2 date)
returns table
as
return
(select Lectures.Lname, LDB.Time, LDB.Data
from LDB join Lectures on LDB.Lno = Lectures.Lno - 24000
where LDB.Data between @d1 and @d2)

select *
from dbo.tbl2('2019-01-01', '2019-05-05')

select Lectures.Lname, LDB.Time, LDB.Data
from LDB join Lectures on LDB.Lno = Lectures.Lno - 24000
where LDB.Data between '2019-01-01' and '2019-05-05'


--Многооператорная табличная функция
create function dbo.tbl3 ()
returns @ret table (nameL varchar(60), nameLR varchar(60))
as
begin
insert @ret
select Lectures.Lname, Lecturers.LRname
from LDB join Lectures on LDB.Lno = Lectures.Lno - 24000 join Lecturers on LDB.LRno = Lecturers.LRno - 1000
return 
end;

select *
from dbo.tbl3()

select Lectures.Lname, Lecturers.LRname
from LDB join Lectures on LDB.Lno = Lectures.Lno - 24000 join Lecturers on LDB.LRno = Lecturers.LRno - 1000


--Рекурсивная функция
create function dbo.tbl4 ()
returns table as return
(
	WITH DirectReports (ManagerID, AnimalsID, FirstName, Level) 
	AS ( 
	SELECT e.ManagerID, e.AnimalsID, e.FirstName, 0 AS Level    
	FROM dbo.Animals AS e    
	WHERE ManagerID IS NULL    
	UNION ALL  
	SELECT e.ManagerID, e.AnimalsID, e.FirstName, Level + 1    
	FROM dbo.Animals AS e INNER JOIN DirectReports AS d ON e.ManagerID = d.AnimalsID )
	SELECT ManagerID, AnimalsID, FirstName, Level FROM DirectReports
)

select * from dbo.tbl4()

-- Определение ОТВ
WITH DirectReports (ManagerID, AnimalsID, FirstName, Level) AS ( 
-- Определение закрепленного элемента
SELECT e.ManagerID, e.AnimalsID, e.FirstName, 0 AS Level    
FROM dbo.Animals AS e    
WHERE ManagerID IS NULL    
UNION ALL  
-- Определение рекурсивного элемента
SELECT e.ManagerID, e.AnimalsID, e.FirstName, Level + 1    
FROM dbo.Animals AS e INNER JOIN DirectReports AS d ON e.ManagerID = d.AnimalsID ) 
-- Инструкция, использующая ОТВ
SELECT ManagerID, AnimalsID, FirstName, Level FROM DirectReports
go
