use Northwind
go

create procedure usp_ListProd as 
	select * from Products
go

exec usp_ListProd
go

drop procedure usp_ListProd
go

------------------------------------------------------
create procedure usp_ListProd
	@min money,
	@max money
	--�ŧi�Ѽ�
as 
	select * from Products where UnitPrice between @min and @max
go

exec usp_ListProd 10, 20 -- call by order
exec usp_ListProd @min = 10, @max = 12 --call by name
go 

drop procedure usp_ListProd
go

------------------------------------------------------
create procedure usp_ListProd
	@min money = 0,
	@max money = 999
	--�ŧi�Ѽ� & ���
as 
	select * from Products where UnitPrice between @min and @max
go

exec usp_ListProd  -- all, �S�����w�]��
exec usp_ListProd @max = 12 --������������
go 

drop procedure usp_ListProd
go

------------------------------------------------------
create procedure usp_ListProd
	@min money = null,
	@max money = null
	--�ŧi�Ѽ� & ���
as 
	if @min is null
		set @min =0
	if @max is null
		select @max = MAX(UnitPrice) from Products
	--�P�_��, set @min�ȩ�select @max�� 
	select * from Products where UnitPrice between @min and @max
go

exec usp_ListProd  -- all, �S�����w�]��
go 

drop procedure usp_ListProd
go

------------------------------------------------------