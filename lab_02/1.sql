USE [LecturesDB]
GO

--Инструкция SELECT, использующая предикат сравнения
select Lectures.Lname, LDB.Time
from LDB join Lectures on LDB.Lno = Lectures.Lno - 24000
where LDB.Price < 500

-- Инструкция SELECT, использующая предикат BETWEEN
select Lectures.Lname, LDB.Time, LDB.Data
from LDB join Lectures on LDB.Lno = Lectures.Lno - 24000
where LDB.Data between '2019-01-01' and '2019-05-05'

--Инструкция SELECT, использующая предикат LIKE
select Lectures.Lname, LDB.Price
from LDB join Lectures on LDB.Lno = Lectures.Lno - 24000
where Lectures.Lname like '%Ltd%'

--Инструкция SELECT, использующая предикат IN с вложенным подзапросом
select Lectures.Lname
from Lectures 
where Lectures.Lno in (select Lectures.Lno from Lectures where Lectures.Seats > 50) 
and Lectures.Cno = 1

--Инструкция SELECT, использующая предикат EXISTS с вложенным подзапросом
select Lectures.Lname
from Lectures 
where exists (select Lectures.Lname 
from Lecturers join Category on Lectures.Cno = Category.Cno 
where Category.Cname = 'art')

--Инструкция SELECT, использующая предикат сравнения с квантором
select LDB.Price
from LDB 
where LDB.Price > 1500 (select LDB.Price
from LDB join Lectures on LDB.Lno = Lectures.Lno - 24000
where Lectures.Lname like '%Inc%')

--Инструкция SELECT, использующая агрегатные функции в выражениях столбцов
select Lectures.Lname, AVG(LDB.Price) as avg_price
from LDB join Lectures on LDB.Lno = Lectures.Lectures.Lno - 24000
group by Lectures.Lname

--Инструкция SELECT, использующая агрегатные функции в выражениях столбцов (проверка предыдущего)
select Lectures.Lname, SUM(LDB.Price)/COUNT(Lectures.Lname) as avg_price
from LDB join Lectures on LDB.Lno = Lectures.Lno - 24000
group by Lectures.Lname

--Инструкция SELECT, использующая скалярные подзапросы в выражениях столбцов
select LDB.DATA, (select MIN(LDB.Price) 
		from LDB
		where LDB.Data between '2019-01-01' and '2019-05-05') as min_price
from LDB 
where LDB.Lno = 1

-- Инструкция SELECT, использующая простое выражение CASE
select LDB.Lno,
	CASE YEAR(LDB.Data)
		when YEAR(Getdate()) then 'This year'
		when YEAR(Getdate())-1 then 'Last year'
		else 'больше одного года назад'
	end as seats_count
from LDB

--Инструкция SELECT, использующая поисковое выражение CASE
select Lectures.Lname,
	CASE 
		when Lectures.Seats < 30 then 'Мало мест'
		when Lectures.Seats > 30 and Lectures.Seats < 60 then 'Достаточно мест'
		when Lectures.Seats > 30 then 'Много мест'
		else 'не определено'
	end as seats_count
from Lectures

--Создание новой временной локальной таблицы из результирующего набора данных инструкции SELECT. 
select LDB.Data, Places.Address
into temp advertisingTable3
from LDB join Places on LDB.Pno = Places.Pno


--Инструкция SELECT, использующая вложенные коррелированные 
--подзапросы в качестве производных таблиц в предложении FROM
select LDB.Data, LDB.Time
from LDB join (select MAX(Lectures.Seats) as max_s, Lectures.Cno
				from Lectures
				group by Lectures.Cno) as OD on  LDB.Pno=OD.Cno

--Инструкция SELECT, консолидирующая данные с помощью предложения GROUP BY, но без предложения HAVING
select MAX(Lectures.Seats) as max_s, Lectures.Cno
from Lectures
group by Lectures.Cno

--Инструкция SELECT, консолидирующая данные с помощью предложения GROUP BY и  предложения HAVING. 
select Lectures.Cno, sum(Lectures.Seats)
from Lectures
group by Lectures.Cno
having sum(Lectures.Seats) > 16000

--Однострочная инструкция INSERT, выполняющая вставку в таблицу одной строки значений
SET IDENTITY_INSERT Lectures  ON
INSERT Lectures (Lno, Lname, Seats, Cno)
VALUES (25001, 'BMSTU', 100, 3)
SET IDENTITY_INSERT Lectures OFF

--Многострочная инструкция INSERT, выполняющая вставку в таблицу результирующего 
--набора данных вложенного подзапроса
SET IDENTITY_INSERT Lectures  ON
INSERT Lectures (Lno, Lname, Seats, Cno)
values (25002, 'BMSTU2', (select max(Lectures.Seats)
from Lectures
where Lectures.Cno = 3), 3)
SET IDENTITY_INSERT Lectures OFF

-- Простая инструкция UPDATE
update Lectures set Lectures.Seats = Lectures.Seats + 1 where Lectures.Lname = 'Barnes-Franklin'

--Инструкция UPDATE со скалярным подзапросом в предложении SET
update Lectures 
set Lectures.Seats = (select AVG(Lectures.Seats)
						from Lectures
						where Lectures.Lname like '%Ltd%') 
where Lectures.Lname = 'Barnes-Franklin'

-- Простая инструкция DELETE
DELETE Lectures
WHERE Lectures.Lname = 'BMSTU2'

--Инструкция DELETE с вложенным коррелированным подзапросом в предложении WHERE
DELETE Lectures
WHERE Lectures.Lname in 
(select Lectures.Lname
from LDB join Lectures on LDB.Lno = Lectures.Lno - 24000
where LDB.LRno = 113)

-- Инструкция SELECT, использующая рекурсивное обобщенное табличное выражение
CREATE TABLE dbo.Animals ( 
AnimalsID smallint NOT NULL, 
FirstName nvarchar(30)  NOT NULL, 
ManagerID int NULL, 
CONSTRAINT PK_AnimalsID PRIMARY KEY CLUSTERED (AnimalsID ASC) ) ; 
GO  
INSERT INTO dbo.Animals VALUES (1, N'Лев',NULL) ; 
INSERT INTO dbo.Animals VALUES (2, N'Медоед',1) ; 
INSERT INTO dbo.Animals VALUES (3, N'Птица',1) ; 
INSERT INTO dbo.Animals VALUES (4, N'Комар',2) ; 
INSERT INTO dbo.Animals VALUES (5, N'муха',3) ;
GO 
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

-- Инструкция SELECT, использующая простое обобщенное табличное выражение 
with TimeTable
as
(
select LDB.Time, LDB.Data
from LDB
)
select LDB.Data
from LDB
where LDB.Data between '2019-01-01' and '2019-05-05'

--Оконные функции. Использование конструкций MIN/MAX/AVG OVER()
select Lectures.Lno, Lectures.Lname, Lectures.Cno,
avg (Lectures.Seats) over(partition by Lectures.Cno) as sum 
from Lectures

--Оконные фнкции для устранения дублей
with cte(row_na, Lno, Lname, Cno) as (
select row_number() over(partition by Lectures.Cno order by Lectures.Cno) as row_na, Lectures.Lno, Lectures.Lname, Lectures.Cno
from Lectures
)
select *
from cte
where row_na = 1
go