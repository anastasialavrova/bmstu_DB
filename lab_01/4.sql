USE [LecturesDB]
GO

select * from Places

select DISTINCT Category from Lectures
--уникльные элементы из столбца


SET IDENTITY_INSERT Places ON

INSERT Places (Pno, Address, Postcode)
VALUES (2995, 'BMSTU Moscow', '100000')

SET IDENTITY_INSERT Places OFF

select LRname, Phone from Lecturers


SET IDENTITY_INSERT Lectures  ON

INSERT Lectures (Lno, Lname, Seats, Cno)
VALUES (25001, 'BMSTU', 5, 3)

SET IDENTITY_INSERT Lectures OFF