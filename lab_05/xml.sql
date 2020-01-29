use LecturesDB
go

------------------------------1-----------------------------------------------------

-- В режиме AUTO результаты запросов возвращаются в виде вложенных XML-элементов

---1.1-----
SELECT *  from LDB
FOR XML AUTO

-----1.2-----
-- Выводит Id лекции и лектора, где цена > 2000
-- получение данных по элементам
SELECT Lno, LRno
FROM LDB
WHERE Price > 2000
FOR XML RAW
GO

----1.3-----
-- Применение PATH со столбцами без имени
-- Т.е. мы не присвиваем какое-либо имя для наших атрибутов
SELECT Time, Pno
FROM LDB
WHERE Data between '2019-01-01' and '2019-05-05'
FOR XML PATH
GO

----1.4------
-- Для того, чтобы задать столбцу имя, нужно использовать символ @
SELECT Time as "@Time",
	Pno as "@idPlace"
FROM LDB
WHERE Data between '2019-01-01' and '2019-05-05'
FOR XML PATH
GO

-- Использование FOR XML EXPLICIT
-- EXPLICIT предоставляет более гибкую работу при формировании XML документа

SELECT 1 as Tag,
	NULL as Parent,
	L.Lno as [LDB!1!Lno],
	NULL as [LDB!2!LRno],
	NULL as [LDB!2!Data]
FROM LDB AS L
WHERE Price < 1000
UNION ALL
SELECT 2 as Tag,
	1 as Parent,
	L.Lno,
	L.LRno,
	L.Data
FROM LDB AS L
WHERE Data between '2019-01-01' and '2019-05-05'
FOR XML EXPLICIT
GO


-----1.5------
SELECT 1 as Tag,
	NULL as Parent,
	L.Lno as [LDB!1!Lno],
	L.LRno as [LDB!1!LRno],
	L.Data as [LDB!1!Data]
FROM LDB AS L
WHERE Data between '2019-01-01' and '2019-05-05'
FOR XML EXPLICIT
GO



-----------------------------------2----------------------------
DECLARE @idoc int, @doc varchar(1000)
SET @doc='
<ROOT>
<LDB LDB.Lno="1" Price="100">
</LDB>
<LDB LDB.Lno="2" Price="100">
</LDB>
</ROOT>'

EXEC sp_xml_preparedocument @idoc OUTPUT, @doc
SELECT *
FROM OPENXML(@idoc, '/ROOT/LDB', 2) WITH (Lno varchar(10), Price varchar(20))
EXEC sp_xml_removedocument @idoc
GO


------2.1-------
DECLARE @XML_Doc XML;
DECLARE @XML_Doc_Handle INT;
--Формируем XML документ
SET @XML_Doc = (
        SELECT  Lno AS "@Id",
		Time as "@Time",
		Pno as "@idPlace"
		FROM LDB
		WHERE Data between '2019-01-01' and '2019-05-05'
		FOR XML PATH ('L'), TYPE, ROOT ('Lectures')
);
--Подготавливаем XML документ
EXEC sp_xml_preparedocument @XML_Doc_Handle OUTPUT, @XML_Doc;

--Извлекаем данные из XML документа
--@XML_Doc_Handle - дескриптор документа
SELECT *
   FROM OPENXML (@XML_Doc_Handle, '/Lectures/L', 8)
   WITH (
   ProductId INT '@Id', 
          Time time(7),
		Place NVARCHAR(100)
);
--Удаляем дескриптор XML документа
EXEC sp_xml_removedocument @XML_Doc_Handle;



----2.2-----
DECLARE @idoc int
DECLARE @doc xml
--Обращаемся к документу
SELECT @doc = c FROM OPENROWSET(BULK 'C:\Users\User\Desktop\Лабораторная работа №5\file.xml', SINGLE_BLOB) AS TEMP(c)
EXEC sp_xml_preparedocument @idoc OUTPUT, @doc
SELECT *
FROM OPENXML (@idoc, '/root/LDB')
WITH (ID INT,
      Title NVARCHAR(50),
      Category INT)
EXEC sp_xml_removedocument @idoc



