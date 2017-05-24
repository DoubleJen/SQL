-- 客戶購買商品的對照清單
use Northwind
go

select * from Customers

select CustomerID, CompanyName
	from Customers

select * from orders

select c.CustomerID, CompanyName, orderID 
	from Customers as c join Orders as o on o.CustomerID = c.CustomerID

select * from [Order Details]

select c.CustomerID, CompanyName, o.orderID, ProductID 
	from Customers as c join Orders as o on o.CustomerID = c.CustomerID
						join [Order Details] as od on od.OrderID = o.OrderID
	order by c.CustomerID, o.OrderID

select * from Products

select c.CustomerID, CompanyName, o.orderID, od.ProductID, ProductName 
	from Customers as c join Orders as o on o.CustomerID = c.CustomerID
						join [Order Details] as od on od.OrderID = o.OrderID
						join Products as p on p.ProductID = od.ProductID
	order by c.CustomerID, o.OrderID

select c.CustomerID, CompanyName, od.ProductID, ProductName 
	from Customers as c join Orders as o on o.CustomerID = c.CustomerID
						join [Order Details] as od on od.OrderID = o.OrderID
						join Products as p on p.ProductID = od.ProductID
	order by c.CustomerID, od.ProductID

select distinct c.CustomerID, CompanyName, od.ProductID, ProductName 
	from Customers as c join Orders as o on o.CustomerID = c.CustomerID
						join [Order Details] as od on od.OrderID = o.OrderID
						join Products as p on p.ProductID = od.ProductID
	order by c.CustomerID, od.ProductID


