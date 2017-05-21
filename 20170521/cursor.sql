use Northwind
GO

create table #Temp2
(
	 ProductID int, 
	 UnitsInStock int,
	 TotalStock int
)
go

-- 定義 Cursor (請留意 Keyset 選項)
DECLARE CursorLab CURSOR
Keyset
FOR 
select ProductID, UnitsInStock from Products
  order by ProductID

-- 開啟 Cursor
OPEN CursorLab

-- 請檢視第一筆的內容
--FETCH NEXT FROM CursorLab
	--一筆一筆提出來
	
	--迴圈印出全部
		declare @ProductID int = 0
		declare @UnitsInStock int = 0
		declare @TotalStock int = 0
		fetch next from CursorLab into @ProductID, @UnitsInStock
		print 'init:'
		print @@FETCH_STATUS
		--https://msdn.microsoft.com/zh-tw/library/ms187308.aspx
		print '--'
		
		while (@@FETCH_STATUS = 0)
			begin
				set @TotalStock = @TotalStock + @UnitsInStock
				print @ProductID
				print @UnitsInStock
				print @TotalStock
				print '------------------'

				insert into #Temp2 values(@ProductID, @UnitsInStock, @TotalStock)
				FETCH NEXT FROM CursorLab into @ProductID, @UnitsInStock
			end

-- 在另一個 Client 修改資料
-- update Customers set ContactName = 'Maria Anders2' where CustomerID = 'ALFKI'

-- 返回前一筆(原先的第一筆), 資料內容是什麼?
FETCH PRIOR FROM CursorLab
	--一筆一筆回去	



-- 結束練習
CLOSE CursorLab	
	--定義還在	
deallocate CursorLab	
	--完全清除

select * from #Temp2

drop table #Temp2