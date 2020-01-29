
--������� �������
CREATE TABLE [dbo].[InOut](
[IOno] [int]  NOT NULL,
[Date] [date] NOT NULL,
[Day] [varchar](30) NOT NULL,
[Time] [time] NOT NULL,
[Type] [int] NOT NULL
)
GO

CREATE TABLE [dbo].[Staff](
[Sno] [int]  NOT NULL,
[Name] [varchar](60) NOT NULL,
[Date] [date] NOT NULL,
[Section] [varchar](60) NOT NULL
)
GO

ALTER TABLE [dbo].[Staff] ADD
CONSTRAINT [PK_S] PRIMARY KEY ([Sno])
GO

INSERT InOut (IOno, Date, Day, Time,Type) VALUES (1, '14-12-2018', '�������', '9:00:00', 1)
INSERT InOut (IOno, Date, Day, Time,Type) VALUES (1, '14-12-2018', '�������', '9:20:00', 2)
INSERT InOut (IOno, Date, Day, Time,Type) VALUES (1, '14-12-2018', '�������', '9:25:00', 1)
INSERT InOut (IOno, Date, Day, Time,Type) VALUES (2, '14-12-2018', '�������', '9:05:00', 1)


INSERT Staff (Sno, Name, Date, Section) VALUES (1, '������ ���� ��������', '25-09-1990', '��')
INSERT Staff (Sno, Name, Date, Section) VALUES (2, '������ ���� ��������', '12-11-1987', '�����������')


-- ��������� ���������� ������� ������� ���������� ����� (�. �. ���, ��� ������ ����� 9:00)
-- �������� ������� ��� �������� ���������� ����������� � �������� ��� �� ������� ����
-- ������� ��������� �� �����

create procedure middle_age 
as
begin
	declare @avg_age int;
	select @avg_age = avg (YEAR(Staff.Date)) from InOut join Staff on InOut.IOno = Staff.Sno
	where InOut.Time > '9:00:00' and InOut.Type = 1
	select @avg_age = YEAR(getdate()) - @avg_age
	print @avg_age
end;

exec middle_age

-- ������� 2(2)

select Staff.Name, count(*) from InOut join Staff on InOut.IOno = Staff.Sno
where InOut.Time > '9:00:00' and InOut.Time < '18:00:00' and InOut.Type = 2
group by Staff.Name

CREATE FUNCTION max_rating_OVER_ALL_TIMES() RETURNS float   
AS EXTERNAL NAME Lab04.first.max_rating_OVER_ALL_TIMES;   
GO  