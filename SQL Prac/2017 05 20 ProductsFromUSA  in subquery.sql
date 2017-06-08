-- 列出美商供應的產品清單

use Northwind
go

-- 起
select * from Products
select * from Suppliers

-- 承
select CategoryID, SupplierID, ProductID, ProductName
  from Products

-- 轉
select * from Suppliers where Country = 'USA'

select SupplierID from Suppliers where Country = 'USA'

-- 合
	--select CategoryID, SupplierID, ProductID, ProductName
	--  from Products
	--  where SupplierID in (...)

select CategoryID, SupplierID, ProductID, ProductName
  from Products
  where SupplierID in (select SupplierID from Suppliers where Country = 'USA')