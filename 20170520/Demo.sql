sp_who
	--偵測目前連線對象
---------------------------------------------------

	--Way 1
select CategoryID, AVG(UnitPrice) as AvgPrice 
	into Must_A_New_Table from Products
	where ProductID >= 0
	group by CategoryID
	--into #Temp1: into至臨時性資料表, 其他連線無法讀取, 結束連線自動消失.
select * from Must_A_New_Table
	where AvgPrice > 30

	--Way 2
select CategoryID, AVG(UnitPrice) as AvgPrice 
	from Products
	where ProductID >= 0
	group by CategoryID having AVG(UnitPrice) > 30
---------------------------------------------------

select * from Products

select CategoryID, ProductID, sum(UnitsInStock) as SumStock from Products
	group by CategoryID, ProductID with rollup
	order by CategoryID, ProductID
	--with rollup: 以CategoryID為分組

select CategoryID, ProductID, sum(UnitsInStock) as SumStock from Products
	group by CategoryID, ProductID with cube
	order by CategoryID, ProductID
	--with cube: 以CategoryID, ProductID為分組
---------------------------------------------------

