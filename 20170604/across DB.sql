use TestDB
go

--���Ʈw
select * into Customers from Northwind.dbo.Customers
select * into Orders from Northwind.dbo.Orders
go

select * from Customers where CustomerID = 'ALFKI'
select * from Orders where CustomerID = 'ALFKI'

alter table Orders
	drop constraint FK_Customers_Orders

alter table Orders
	add constraint FK_Customers_Orders
	foreign key (CustomerID) references Customers(CustomerID)
	on update cascade on delete cascade
	--�ק�s��ק� �R���s��R��

select * from Customers where CustomerID = '543XX'
select * from Orders where CustomerID = '543XX'