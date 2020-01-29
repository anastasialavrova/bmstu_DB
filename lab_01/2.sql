USE [LecturesDB]
GO

ALTER TABLE [dbo].[Lectures] ADD
CONSTRAINT [PK_L] PRIMARY KEY ([Lno]),
CONSTRAINT [UK_L] UNIQUE ([Lname])
GO

ALTER TABLE [dbo].[Lecturers] ADD
CONSTRAINT [PK_LR] PRIMARY KEY ([LRno]),
CONSTRAINT [UK_LR] UNIQUE ([LRname])
GO

ALTER TABLE [dbo].[Places] ADD
CONSTRAINT [PK_P] PRIMARY KEY ([Pno]),
CONSTRAINT [UK_P] UNIQUE ([Address])
GO

ALTER TABLE [dbo].[LDB] ADD
CONSTRAINT [PK_LDB] PRIMARY KEY ( [Lno], [LRno], [Pno] ),
CONSTRAINT [FK_LDB_L] FOREIGN KEY([Lno]) REFERENCES [dbo].[Lectures] ([Lno]) ,
CONSTRAINT [FK_LDB_LR] FOREIGN KEY([LRno]) REFERENCES [dbo].[Lecturers] ([LRno]) ,
CONSTRAINT [FK_LDB_P] FOREIGN KEY([Pno]) REFERENCES [dbo].[Places] ([Pno])
GO

ALTER TABLE [dbo].[Lectures] ADD
CONSTRAINT [Seats_chk] CHECK ([Seats] BETWEEN 20 AND 150)
GO

ALTER TABLE [dbo].[LDB] ADD
CONSTRAINT [Price_chk] CHECK ([Price] >= 0)
GO

ALTER TABLE [dbo].[Lectures] ADD
CONSTRAINT [Category_chk] CHECK (([Category]='art' OR [Category]='health' OR
[Category]='technology' OR [Category]='lifestyle' OR [Category]='languages'))
GO

