use Northwind
go

select * from Products

select * from Products order by UnitPrice ASC
 -------------------------------------------------------------

select *, rank() over(order by UnitPrice) as RankNo
	from Products order by UnitPrice ASC
	--『RANK() OVER(partition by XXXX order by XXXX)』
	--partition by XXXX: 以XXXX做分組
	--order by XXXX: 以XXXX做排序
	--『RANK() OVER』: 排序出來的排名如有兩個以上為同一Rank時，其後Rank不會連號
	--https://msdn.microsoft.com/zh-tw/library/ms176102.aspx

select *, dense_rank() over(order by UnitPrice) as RankNo
	from Products order by UnitPrice ASC
	--『dense_rank() over』: 排序出來的排名如有兩個以上為同一Rank時，其後Rank會連號
	--https://msdn.microsoft.com/zh-tw/library/ms173825.aspx

select *, rank() over(partition by CategoryID order by UnitPrice) as RankNo
	from Products order by CategoryID ASC ,UnitPrice ASC
-------------------------------------------------------------

select ROW_NUMBER() over(order by UnitPrice) as RowNo
 ,* from Products order by UnitPrice ASC
	--『ROW_NUMBER() OVER(partition by XXXX order by XXXX)』  
	--https://msdn.microsoft.com/zh-tw/library/ms186734.aspx
-------------------------------------------------------------

select NTILE(5) over(order by UnitPrice) as Quartile
 ,* from Products order by UnitPrice ASC
	--『NTILE(n) OVER(partition by XXXX order by XXXX)』
	--https://msdn.microsoft.com/zh-tw/library/ms175126.aspx  
