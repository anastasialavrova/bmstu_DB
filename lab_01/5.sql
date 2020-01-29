USE [LecturesDB]
GO

select * from 

UPDATE Lectures
SET Cno = 1
WHERE Category = 'art'

CREATE TABLE [dbo].[Category](
[Cno] [int] IDENTITY(1,1) NOT NULL,
[Cname] [varchar](60) NOT NULL,
)
GO

ALTER TABLE [dbo].[Category] ADD
CONSTRAINT [PK_C] PRIMARY KEY ([Cno]),
CONSTRAINT [UK_C] UNIQUE ([Cname])
GO


select * from sys.all_columns
where lower(name) = 'cno'

with tst(Cno) as (select distinct cno from Lectures)
select ROW_NUMBER() over(order by Cno) as rn , Cno
from tst


ALTER TABLE [dbo].[Lectures] ADD
CONSTRAINT [FK_L_C] FOREIGN KEY([Cno]) REFERENCES [dbo].[Category] ([Cno])
GO