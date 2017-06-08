use Northwind
go

--使用while迴圈計算各類產品庫存總和
declare @j int = 1

while(@j <= 8)
	begin 
		select * from Products
			where CategoryID = @j
		select SUM(UnitsInStock) from Products
			where CategoryID = @j
		set @j = @j + 1	 
	end
