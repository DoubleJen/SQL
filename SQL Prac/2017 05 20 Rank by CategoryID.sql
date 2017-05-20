--�mSQL �a�x�@�~�n
--�H Northwind ��Ʈw�� Products ��ƪ��ҡC�мg�@�Ӭd�߫��O�A�C�X�U�����~�̶Q���e�T���ӫ~�C

use Northwind
go

select CategoryID, ProductID, ProductName, UnitPrice from Products
	order by CategoryID

select CategoryID, ProductID, ProductName, UnitPrice from Products
	order by UnitPrice DESC

select CategoryID, Max(UnitPrice) from Products
	group by CategoryID
	order by CategoryID

--Mathod 1: Subquery
====================================================================================================================
--Answer
select CategoryID, UnitPrice, ProductID, ProductName, SupplierID, UnitsInStock, ReorderLevel from Products p
	where UnitPrice in (select top 3 UnitPrice from Products where CategoryID =p.CategoryID order by UnitPrice DESC)
	order by CategoryID ASC, UnitPrice DESC
====================================================================================================================

--Method 2: RANK() OVER + Subquery
select CategoryID, RANK() over(partition by CategoryID order by UnitPrice DESC) as RankNo, 
	   UnitPrice, ProductID, ProductName, SupplierID, UnitsInStock, ReorderLevel 
	from Products p

====================================================================================================================
--Answer
select * from 
	(
	select CategoryID, RANK() over(partition by CategoryID order by UnitPrice DESC) as RankNo, 
	   UnitPrice, ProductID, ProductName, SupplierID, UnitsInStock, ReorderLevel 
	from Products p
	) as T
	where T.RankNo in (1, 2, 3)
====================================================================================================================



