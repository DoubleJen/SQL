--選出最後一天的訂單

use Northwind
go

--起
select * from Orders

--承
select OrderID, CustomerID, OrderDate
  from Orders

--轉
	--select OrderID, CustomerID, OrderDate
	--  from Orders
	--  where ???

select MAX(OrderDate) from Orders

--合
	--select OrderID, CustomerID, OrderDate
	--  from Orders
	--  where OrderDate = '1998-05-06'

	--select OrderID, CustomerID, OrderDate
	--  from Orders
	--  where OrderDate = (select ...)

select OrderID, CustomerID, OrderDate
  from Orders
  where OrderDate = (select MAX(OrderDate) from Orders)