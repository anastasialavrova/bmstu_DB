CREATE TABLE [dbo].[Lectures](
[Lno] [int] IDENTITY(1,1) NOT NULL,
[Lname] [varchar](60) NOT NULL,
[Category] [varchar](30) NOT NULL,
[Seats] [smallint] NOT NULL
)
GO

CREATE TABLE [dbo].[Lecturers](
[LRno] [int] IDENTITY(1,1) NOT NULL,
[LRname] [varchar](60) NOT NULL,
[Phone] [varchar](30) NOT NULL,
[Job] [varchar](100) NOT NULL
)
GO

CREATE TABLE [dbo].[Places](
[Pno] [int] IDENTITY(1,1) NOT NULL,
[Address] [varchar](60) NOT NULL,
[Postcode] [varchar](30) NOT NULL
)
GO

CREATE TABLE [dbo].[LDB](
[Lno] [int] NOT NULL,
[LRno] [int] NOT NULL,
[Pno] [int] NOT NULL,
[Data] [date] NOT NULL,
[Time] [time] NOT NULL,
[Price] [money] NOT NULL,
)
GO