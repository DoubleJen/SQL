-- 有訂 23 號商品而且訂超過 20 個的訂單

use Northwind
go

-- 起
select * from Orders

-- 承
select CustomerID, OrderID, OrderDate from Orders

-- 轉
select * from [Order Details]

select * from [Order Details] where ProductID = 23 and Quantity > 20

-- 合
	--select CustomerID, OrderID, OrderDate from Orders
	--  where OrderID in (10337, 10348, 10396, ...)

select CustomerID, OrderID, OrderDate from Orders
  where OrderID in 
  (
	select OrderID from [Order Details] where ProductID = 23 and Quantity > 20
  )
