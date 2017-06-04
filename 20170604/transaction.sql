use Northwind
go

select * from Products

begin transaction
	update Products set UnitPrice = 11 where CategoryID = 1
	update Products set UnitPrice = 22 where CategoryID = 2
	update Products set UnitPrice = 33 where CategoryID = 3

rollback transaction

select * from Products
commit transaction