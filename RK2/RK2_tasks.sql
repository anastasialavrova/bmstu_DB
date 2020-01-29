-- Задание 2

--1
select Manager.Mname,
	CASE 
		when Manager.Experience < 5 then 'Маленький стаж'
		when Manager.Experience >= 5 and Manager.Experience <= 10 then 'Средний стаж'
		when Manager.Experience > 10 then 'Высокий стаж'
	end as exp_count
from Manager

--2
select Manager.Mname, Manager.Phone,
avg (Manager.Experience) over(partition by Manager.Myear) as sum 
from Manager

--3
select SV.Sno, sum(Visitor.Vyear)
from SV join Visitor on SV.Vno = Visitor.Vno
group by SV.Sno
having sum(Visitor.Vyear) > 2010

--Задание 3

CREATE PROCEDURE MyTables13 
@cnt int OUTPUT
AS  
BEGIN  
SELECT * FROM sys.all_objects
where type = 'FN'
SELECT @cnt = COUNT(*) FROM sys.all_objects
where type = 'FN'
END
GO

DECLARE @cnt int 
EXEC MyTables13 @cnt output
GO

PRINT 'Количество функций: ' + CONVERT(VARCHAR, @cnt)