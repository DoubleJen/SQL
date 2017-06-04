use TestDB
go

select * into od from Northwind.dbo.[Order Details]
go

alter table od add bufferData char(100)
go

update od set bufferData = OrderID
go

select * from od
go

set statistics io on
go

select * from od
go

-- Table Scan
select * from od where orderid = 10248
go

create clustered index idx_orderID on od(orderid)
go

-- Index Seek:
select * from od where orderid = 10248
go

select * from od where ProductID = 11
go

create nonclustered index idx_productID on od (ProductID)
go

-- seek:
select OrderID, ProductID from od where ProductID = 11
go

-- index scan
select OrderID, ProductID, Quantity from od where ProductID = 11
go

create nonclustered index idx_productID2 on od (ProductID) include (quantity)
go

select OrderID, ProductID, Quantity from od where ProductID = 11
go

-- create unique index on students (nid)

exec sp_helpindex od
go

drop index idx_productID on od
go