--選出最近20筆訂單，訂單日期遞增排序

use Northwind
go

select * from Orders

select * from Orders
  order by OrderDate DESC

select top 20 * from Orders
  order by OrderDate DESC
-------------------------------------------------------------

select * from
	(
		select top 20 * from Orders
		  order by OrderDate DESC
	) as T

-------------------------------------------------------------

select * from
	(
		select top 20 * from Orders
		  order by OrderDate DESC
	) as T
order by OrderDate ASC