-- Lab 練習: View (檢視表)
use Northwind
go

-- 建立檢視表
create view vw_Test as
  select ProductID, ProductName, UnitPrice 
    from products 
    where UnitPrice < 50
go

-- 透過檢視表存取資料表
select * from vw_Test  
update vw_Test set UnitPrice = 20 where ProductID = 1
go

-- 透過檢視表看不到的資料, 不能透過檢視表修改
update vw_Test set UnitsInStock = 40 where ProductID = 1
update vw_Test set UnitPrice = 40 where ProductID = 9
go


-- 符合檢視存取範圍的資料, 預設可以改成檢視表範圍之外.
update vw_Test set UnitPrice = 90 where ProductID = 1 


-- 再建一個檢視表, 這次我們加上 with check option
create view vw_TestC as
  select ProductID, ProductName, UnitPrice 
  from products 
  where UnitPrice < 50
with check option
go

-- 再試一次
select * from vw_TestC
update vw_TestC set UnitPrice = 20 where ProductID = 3
update vw_TestC set UnitPrice = 60 where ProductID = 3  -- should be ERROR!!
select * from vw_TestC


-- 還原 Lab 練習環境
drop view vw_Test
drop view vw_TestC
go



-----------------------------------------------------
create view vTEST as
	select ProductID, ProductName, UnitPrice 
	from products 
	where UnitPrice < 50
	order by UnitPrice DESC
	--select 無法單純與order by 使用
	--除非同時指定了 TOP、OFFSET 或 FOR XML，否則 ORDER BY 子句在檢視表、內嵌函數、衍生資料表、子查詢及通用資料表運算式中均為無效。