--��X�̪�20���q��A�q�������W�Ƨ�

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