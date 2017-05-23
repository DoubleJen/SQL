use Northwind
go

exec sp_who
go
	--列出所有目前的處理序
	--https://msdn.microsoft.com/zh-tw/library/ms174313.aspx
-------------------------------------------------------------

--從Products資料表挑出AVG(UnitPrice) > 30的
--Mathod 1: 創一新資料表，再以where從新資料表挑出
select CategoryID, AVG(UnitPrice) as AvgPrice 
	into #Temp1
	from Products
	where ProductID >=1
	group by CategoryID
		--『into NewTable(or #TempTable)』: 建立新的資料表
		--#TempTable: 在 tempdb 資料庫中，建立一個名稱為 #TempTable 的資料表（位於暫存資料表中）。
		--            這個暫存資料表只有建立者可以使用，其他人可以看到，但無法存取。
		--            除非利用 DROP TABLE 來明確卸除暫存資料表，否則當建立該暫存資料表的連線結束時，SQL Server 會自動將其刪除。
		--https://technet.microsoft.com/zh-tw/library/ms190750(v=sql.105).aspx
		--https://social.msdn.microsoft.com/Forums/zh-TW/850f5bf2-79b5-4f32-ba40-0bba2db1e929/temptabledeclare-temptable?forum=240

	select * from #Temp1
		where AvgPrice >30

--Mathod 2: group by + havin
select CategoryID, AVG(UnitPrice) as AvgPrice 
	from Products
	where ProductID >=1
	group by CategoryID having AVG(UnitPrice) > 30
-------------------------------------------------------------

select * from Products
	where ProductID = 0 or CategoryID = 0

--小計總計with Rollup
create view vwRollUP as
	select top 10000000 
			CASE WHEN (GROUPING(CategoryID) = 1) THEN ''	
				ELSE CategoryID
				END AS CategoryID,
			CASE WHEN (GROUPING(ProductID) = 1) THEN ''	
				ELSE ProductID
				END AS ProductID,
			SUM(UnitsInStock) as SumStock 
		from Products
		group by CategoryID, ProductID with rollup
		order by CategoryID, ProductID
		--ROLLUP 將產生一個結果集，顯示出選取的資料行中值階層的彙總。

	select * from vwRollUP 
		where CategoryID = 0 or ProductID = 0 

	drop view vwRollUP

--小計總計with Cube
create view vwCube as
	select top 10000000 
			CASE WHEN (GROUPING(CategoryID) = 1) THEN ''	
				ELSE CategoryID
				END AS CategoryID,
			CASE WHEN (GROUPING(ProductID) = 1) THEN ''	
				ELSE ProductID
				END AS ProductID,
			SUM(UnitsInStock) as SumStock 
		from Products
		group by CategoryID, ProductID with cube
		order by CategoryID, ProductID
		--CUBE 將產生一個結果集，顯示出選定資料行之所有值組合的彙總。

	select * from vwCube 
		where CategoryID = 0 or ProductID = 0 

	drop view vwCube