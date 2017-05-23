use Northwind
go

select * from Products

select * from Products order by UnitPrice ASC
 -------------------------------------------------------------

select *, rank() over(order by UnitPrice) as RankNo
	from Products order by UnitPrice ASC
	--�yRANK() OVER(partition by XXXX order by XXXX)�z
	--partition by XXXX: �HXXXX������
	--order by XXXX: �HXXXX���Ƨ�
	--�yRANK() OVER�z: �ƧǥX�Ӫ��ƦW�p����ӥH�W���P�@Rank�ɡA���Rank���|�s��
	--https://msdn.microsoft.com/zh-tw/library/ms176102.aspx

select *, dense_rank() over(order by UnitPrice) as RankNo
	from Products order by UnitPrice ASC
	--�ydense_rank() over�z: �ƧǥX�Ӫ��ƦW�p����ӥH�W���P�@Rank�ɡA���Rank�|�s��
	--https://msdn.microsoft.com/zh-tw/library/ms173825.aspx

select *, rank() over(partition by CategoryID order by UnitPrice) as RankNo
	from Products order by CategoryID ASC ,UnitPrice ASC
-------------------------------------------------------------

select ROW_NUMBER() over(order by UnitPrice) as RowNo
 ,* from Products order by UnitPrice ASC
	--�yROW_NUMBER() OVER(partition by XXXX order by XXXX)�z  
	--https://msdn.microsoft.com/zh-tw/library/ms186734.aspx
-------------------------------------------------------------

select NTILE(5) over(order by UnitPrice) as Quartile
 ,* from Products order by UnitPrice ASC
	--�yNTILE(n) OVER(partition by XXXX order by XXXX)�z
	--https://msdn.microsoft.com/zh-tw/library/ms175126.aspx  
