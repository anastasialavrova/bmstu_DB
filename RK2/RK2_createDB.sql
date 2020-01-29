CREATE TABLE [dbo].[Section](
[Sno] INT NOT NULL PRIMARY KEY,
[Sname] [varchar](60) NOT NULL,
[Syear] [smallint] NOT NULL,
[Desc] [varchar](60) NOT NULL
)
GO

CREATE TABLE [dbo].[Manager](
[Mno] INT NOT NULL PRIMARY KEY,
[Mname] [varchar](60) NOT NULL,
[Myear] [smallint] NOT NULL,
[Experience] [smallint],
[Phone] [varchar](30) NOT NULL,
)
GO

CREATE TABLE [dbo].[Visitor](
[Vno] INT NOT NULL PRIMARY KEY,
[Vname] [varchar](60) NOT NULL,
[Vyear] [smallint] NOT NULL,
[Adress] [varchar](60) NOT NULL,
[Email] [varchar](30) NOT NULL,
)
GO

CREATE TABLE [dbo].SV(
[Vno] [int] NOT NULL,
[Sno] [int] NOT NULL
)
GO

CREATE TABLE [dbo].SM(
[Sno] [int] NOT NULL,
[Mno] [int] NOT NULL
)
GO


ALTER TABLE [dbo].[SV] ADD
CONSTRAINT [PK_SV] PRIMARY KEY ( [Vno], [Sno]),
CONSTRAINT [FK_SV_V] FOREIGN KEY([Vno]) REFERENCES [dbo].[Visitor] ([Vno]) ,
CONSTRAINT [FK_SV_S] FOREIGN KEY([Sno]) REFERENCES [dbo].[Section] ([Sno]) 
GO

ALTER TABLE [dbo].[SM] ADD
CONSTRAINT [PK_SM] PRIMARY KEY ( [Sno], [Mno]),
CONSTRAINT [FK_SM_S] FOREIGN KEY([Sno]) REFERENCES [dbo].[Section] ([Sno]),
CONSTRAINT [FK_SM_M] FOREIGN KEY([Mno]) REFERENCES [dbo].[Manager] ([Mno])
GO

INSERT INTO Section (Sno, Sname, Syear, SDesc) VALUES (1, 'Балет', '2011', 'танцы')
INSERT INTO Section (Sno, Sname, Syear, SDesc) VALUES (2, 'Фортепьяно', '2009', 'игра на муз. инстурментах')
INSERT INTO Section (Sno, Sname, Syear, SDesc) VALUES (3, 'Живопись', '2010', 'рисуем красками на холсте')
INSERT INTO Section (Sno, Sname, Syear, SDesc) VALUES (4, 'Рукоделие', '2011', 'бисер, вышивание, лепка')
INSERT INTO Section (Sno, Sname, Syear, SDesc) VALUES (5, 'Хип-хоп', '2015', 'танцы')
INSERT INTO Section (Sno, Sname, Syear, SDesc) VALUES (6, 'Скауты', '2013', 'леса и горы')
INSERT INTO Section (Sno, Sname, Syear, SDesc) VALUES (7, 'Балет2', '2011', 'танцы')
INSERT INTO Section (Sno, Sname, Syear, SDesc) VALUES (8, 'Балет3', '2015', 'танцы')
INSERT INTO Section (Sno, Sname, Syear, SDesc) VALUES (9, 'Балет4', '2011', 'танцы')
INSERT INTO Section (Sno, Sname, Syear, SDesc) VALUES (10, 'Балет5', '2019', 'танцы')


INSERT INTO Manager (Mno, Mname, Myear, Experience, Phone) VALUES (1, 'ФИО_1', '1970', 10, '+700000000')
INSERT INTO Manager (Mno, Mname, Myear, Experience, Phone) VALUES (2, 'ФИО_2', '1980', 5, '+700000000')
INSERT INTO Manager (Mno, Mname, Myear, Experience, Phone) VALUES (3, 'ФИО_3', '1990', 6, '+700000000')
INSERT INTO Manager (Mno, Mname, Myear, Experience, Phone) VALUES (4, 'ФИО_4', '1998', 3, '+700000000')
INSERT INTO Manager (Mno, Mname, Myear, Experience, Phone) VALUES (5, 'ФИО_5', '1999', 1, '+700000000')
INSERT INTO Manager (Mno, Mname, Myear, Experience, Phone) VALUES (6, 'ФИО_6', '1976', 5, '+700000000')
INSERT INTO Manager (Mno, Mname, Myear, Experience, Phone) VALUES (7, 'ФИО_7', '1965', 15, '+700000000')
INSERT INTO Manager (Mno, Mname, Myear, Experience, Phone) VALUES (8, 'ФИО_8', '1969', 20, '+700000000')
INSERT INTO Manager (Mno, Mname, Myear, Experience, Phone) VALUES (9, 'ФИО_9', '1971', 10, '+700000000')
INSERT INTO Manager (Mno, Mname, Myear, Experience, Phone) VALUES (10, 'ФИО_10', '1973', 15, '+700000000')


INSERT INTO Visitor (Vno, Vname, Vyear, Adress, Email) VALUES (1, 'ФИО_Vis_1', 2001, 'Adress1', 'yandex@gmail.com')
INSERT INTO Visitor (Vno, Vname, Vyear, Adress, Email) VALUES (2, 'ФИО_Vis_2', 2010, 'Adress1', 'yandex@gmail.com')
INSERT INTO Visitor (Vno, Vname, Vyear, Adress, Email) VALUES (3, 'ФИО_Vis_3', 2009, 'Adress1', 'yandex@gmail.com')
INSERT INTO Visitor (Vno, Vname, Vyear, Adress, Email) VALUES (4, 'ФИО_Vis_4', 2015, 'Adress1', 'yandex@gmail.com')
INSERT INTO Visitor (Vno, Vname, Vyear, Adress, Email) VALUES (5, 'ФИО_Vis_5', 2012, 'Adress1', 'yandex@gmail.com')
INSERT INTO Visitor (Vno, Vname, Vyear, Adress, Email) VALUES (6, 'ФИО_Vis_6', 2010, 'Adress1', 'yandex@gmail.com')
INSERT INTO Visitor (Vno, Vname, Vyear, Adress, Email) VALUES (7, 'ФИО_Vis_7', 2011, 'Adress1', 'yandex@gmail.com')
INSERT INTO Visitor (Vno, Vname, Vyear, Adress, Email) VALUES (8, 'ФИО_Vis_8', 2013, 'Adress1', 'yandex@gmail.com')
INSERT INTO Visitor (Vno, Vname, Vyear, Adress, Email) VALUES (9, 'ФИО_Vis_9', 2015, 'Adress1', 'yandex@gmail.com')
INSERT INTO Visitor (Vno, Vname, Vyear, Adress, Email) VALUES (19, 'ФИО_Vis_10', 2005, 'Adress1', 'yandex@gmail.com')


INSERT INTO SV(Vno, Sno) VALUES (1, 5)
INSERT INTO SV(Vno, Sno) VALUES (2, 10)
INSERT INTO SV(Vno, Sno) VALUES (3, 6)
INSERT INTO SV(Vno, Sno) VALUES (4, 3)
INSERT INTO SV(Vno, Sno) VALUES (5, 5)
INSERT INTO SV(Vno, Sno) VALUES (6, 9)
INSERT INTO SV(Vno, Sno) VALUES (7, 9)
INSERT INTO SV(Vno, Sno) VALUES (8, 7)
INSERT INTO SV(Vno, Sno) VALUES (9, 8)
INSERT INTO SV(Vno, Sno) VALUES (10, 5)


INSERT INTO SM(Sno, Mno) VALUES (10, 1)
INSERT INTO SM(Sno, Mno) VALUES (9, 2)
INSERT INTO SM(Sno, Mno) VALUES (8, 3)
INSERT INTO SM(Sno, Mno) VALUES (7, 4)
INSERT INTO SM(Sno, Mno) VALUES (6, 5)
INSERT INTO SM(Sno, Mno) VALUES (5, 6)
INSERT INTO SM(Sno, Mno) VALUES (4, 7)
INSERT INTO SM(Sno, Mno) VALUES (3, 8)
INSERT INTO SM(Sno, Mno) VALUES (2, 9)
INSERT INTO SM(Sno, Mno) VALUES (1, 10)