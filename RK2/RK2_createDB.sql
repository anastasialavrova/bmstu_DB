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

INSERT INTO Section (Sno, Sname, Syear, SDesc) VALUES (1, '�����', '2011', '�����')
INSERT INTO Section (Sno, Sname, Syear, SDesc) VALUES (2, '����������', '2009', '���� �� ���. ������������')
INSERT INTO Section (Sno, Sname, Syear, SDesc) VALUES (3, '��������', '2010', '������ �������� �� ������')
INSERT INTO Section (Sno, Sname, Syear, SDesc) VALUES (4, '���������', '2011', '�����, ���������, �����')
INSERT INTO Section (Sno, Sname, Syear, SDesc) VALUES (5, '���-���', '2015', '�����')
INSERT INTO Section (Sno, Sname, Syear, SDesc) VALUES (6, '������', '2013', '���� � ����')
INSERT INTO Section (Sno, Sname, Syear, SDesc) VALUES (7, '�����2', '2011', '�����')
INSERT INTO Section (Sno, Sname, Syear, SDesc) VALUES (8, '�����3', '2015', '�����')
INSERT INTO Section (Sno, Sname, Syear, SDesc) VALUES (9, '�����4', '2011', '�����')
INSERT INTO Section (Sno, Sname, Syear, SDesc) VALUES (10, '�����5', '2019', '�����')


INSERT INTO Manager (Mno, Mname, Myear, Experience, Phone) VALUES (1, '���_1', '1970', 10, '+700000000')
INSERT INTO Manager (Mno, Mname, Myear, Experience, Phone) VALUES (2, '���_2', '1980', 5, '+700000000')
INSERT INTO Manager (Mno, Mname, Myear, Experience, Phone) VALUES (3, '���_3', '1990', 6, '+700000000')
INSERT INTO Manager (Mno, Mname, Myear, Experience, Phone) VALUES (4, '���_4', '1998', 3, '+700000000')
INSERT INTO Manager (Mno, Mname, Myear, Experience, Phone) VALUES (5, '���_5', '1999', 1, '+700000000')
INSERT INTO Manager (Mno, Mname, Myear, Experience, Phone) VALUES (6, '���_6', '1976', 5, '+700000000')
INSERT INTO Manager (Mno, Mname, Myear, Experience, Phone) VALUES (7, '���_7', '1965', 15, '+700000000')
INSERT INTO Manager (Mno, Mname, Myear, Experience, Phone) VALUES (8, '���_8', '1969', 20, '+700000000')
INSERT INTO Manager (Mno, Mname, Myear, Experience, Phone) VALUES (9, '���_9', '1971', 10, '+700000000')
INSERT INTO Manager (Mno, Mname, Myear, Experience, Phone) VALUES (10, '���_10', '1973', 15, '+700000000')


INSERT INTO Visitor (Vno, Vname, Vyear, Adress, Email) VALUES (1, '���_Vis_1', 2001, 'Adress1', 'yandex@gmail.com')
INSERT INTO Visitor (Vno, Vname, Vyear, Adress, Email) VALUES (2, '���_Vis_2', 2010, 'Adress1', 'yandex@gmail.com')
INSERT INTO Visitor (Vno, Vname, Vyear, Adress, Email) VALUES (3, '���_Vis_3', 2009, 'Adress1', 'yandex@gmail.com')
INSERT INTO Visitor (Vno, Vname, Vyear, Adress, Email) VALUES (4, '���_Vis_4', 2015, 'Adress1', 'yandex@gmail.com')
INSERT INTO Visitor (Vno, Vname, Vyear, Adress, Email) VALUES (5, '���_Vis_5', 2012, 'Adress1', 'yandex@gmail.com')
INSERT INTO Visitor (Vno, Vname, Vyear, Adress, Email) VALUES (6, '���_Vis_6', 2010, 'Adress1', 'yandex@gmail.com')
INSERT INTO Visitor (Vno, Vname, Vyear, Adress, Email) VALUES (7, '���_Vis_7', 2011, 'Adress1', 'yandex@gmail.com')
INSERT INTO Visitor (Vno, Vname, Vyear, Adress, Email) VALUES (8, '���_Vis_8', 2013, 'Adress1', 'yandex@gmail.com')
INSERT INTO Visitor (Vno, Vname, Vyear, Adress, Email) VALUES (9, '���_Vis_9', 2015, 'Adress1', 'yandex@gmail.com')
INSERT INTO Visitor (Vno, Vname, Vyear, Adress, Email) VALUES (19, '���_Vis_10', 2005, 'Adress1', 'yandex@gmail.com')


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