use Northwind
go

--�ϥ�while�j��p��U�����~�w�s�`�M
declare @j int = 1

while(@j <= 8)
	begin 
		select * from Products
			where CategoryID = @j
		select SUM(UnitsInStock) from Products
			where CategoryID = @j
		set @j = @j + 1	 
	end
