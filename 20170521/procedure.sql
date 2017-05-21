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
	--把计
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
	--把计 & 
as 
	select * from Products where UnitPrice between @min and @max
go

exec usp_ListProd  -- all, ⊿倒箇砞
exec usp_ListProd @max = 12 --Τ倒倒ぉ
go 

drop procedure usp_ListProd
go

------------------------------------------------------
create procedure usp_ListProd
	@min money = null,
	@max money = null
	--把计 & 
as 
	if @min is null
		set @min =0
	if @max is null
		select @max = MAX(UnitPrice) from Products
	--耞Α, set @min┪select @max 
	select * from Products where UnitPrice between @min and @max
go

exec usp_ListProd  -- all, ⊿倒箇砞
go 

drop procedure usp_ListProd
go

------------------------------------------------------