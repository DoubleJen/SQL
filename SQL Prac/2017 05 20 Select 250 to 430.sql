use Northwind
go

-- 250 請列出平均單價最高的前三類產品。
select * from Products

select CategoryID, AVG(UnitPrice) as AvgPrice from Products
	group by CategoryID
	order by AVG(UnitPrice) DESC

select Top 3 CategoryID, AVG(UnitPrice) as AvgPrice from Products
	group by CategoryID
	order by AVG(UnitPrice) DESC
-------------------------------------------------------------

/* 310
  請寫一道指令, 列出 products 資料表的以下欄位
  ProductID, ProductName, SupplierID
 */ 
select ProductID, ProductName, SupplierID from Products

/* 320
   同上, 但請一併列出該供應商名稱(CompanyName)、
   聯絡電話(Phone)、聯絡人(ContactName)好嗎?
   另外, 相同供應商的資料請列在一起
 */ 
 select * from Suppliers

 select p.ProductID, p.ProductName, p.SupplierID, s.CompanyName, s.Phone, s.ContactName 
	from Products as p join Suppliers as s on p.SupplierID = s.SupplierID
	order by p.SupplierID
-------------------------------------------------------------

/* 330
   我想列出「所有」供應商目前各自提供我們哪些產品資料的對照表,
   目前沒提供我們產品的供應商也要列出

   <note>
   下指令前, 請先執行下列指令:
   -- begin --
   insert into suppliers
     (CompanyName, ContactName, Phone)
      values
     ('Taiwan First', 'A-Ban', '(001) 000-0001')
   -- end --
 */
insert into suppliers
    (CompanyName, ContactName, Phone)
    values
    ('Taiwan First', 'A-Ban', '(001) 000-0001') 

select * from Suppliers
select * from Products

select s.SupplierID, CompanyName, ProductID, ProductName
	from Suppliers as s left join Products as p on s.SupplierID = p.SupplierID
	order by s.SupplierID
-------------------------------------------------------------

-- (Optional)
-- 340 請列出員工及其員工直屬老闆（ReportsTo）的清單。
select * from Employees

select EmployeeID, (FirstName + ' ' + LastName) as EmployeeName, ReportsTo
	from Employees

select e.EmployeeID, (e.FirstName + ' ' + e.LastName) as EmployeeName, e.ReportsTo, 
	   (b.FirstName + ' ' + b.LastName) as BossName
	from Employees as e left join Employees as b on e.ReportsTo = b.EmployeeID
-------------------------------------------------------------

/* 410
  請列出各項產品的類別、編號、品名、單價、
  該類產品平均單價、單價與產品平均單價的「價差」。
*/
select * from Products


select CategoryID, ProductID, ProductName, UnitPrice from Products

select AVG(UnitPrice) from Products
		where CategoryID = 1

select CategoryID, ProductID, ProductName, UnitPrice, 37.9791 as AvgUnitPrice from Products

select CategoryID, ProductID, ProductName, UnitPrice, 37.9791 as AvgUnitPrice
	from Products as o

select CategoryID, ProductID, ProductName, UnitPrice, 
	   (select AVG(UnitPrice) from Products as i where CategoryID = o.CategoryID) as AvgUnitPrice
	from Products as o 

select CategoryID, ProductID, ProductName, UnitPrice, 
	   (select AVG(UnitPrice) from Products as i where CategoryID = o.CategoryID) as AvgUnitPrice,
	   UnitPrice - (select AVG(UnitPrice) from Products as i where CategoryID = o.CategoryID) as DifferPrice
	from Products as o 
	order by CategoryID, ProductID
-------------------------------------------------------------

/* 420
   請列出有訂第三類產品的訂單。
*/
select * from Orders
select * from [Order Details]
select * from Products

select * from Orders
	where OrderID in (
		select OrderID from [Order Details]
			where ProductID in (select ProductID from Products where CategoryID = 3)
		)
-------------------------------------------------------------

/* 430
  請列出賣得最好前三項產品。
*/
select * from Products
select * from [Order Details]

select ProductID, SUM(Quantity) as SumQty from [Order Details]
	group by ProductID
	order by SumQty DESC

select Top 3 ProductID, SUM(Quantity) as SumQty from [Order Details]
	group by ProductID
	order by SumQty DESC

select ProductID, ProductName from Products
	where ProductID in (
		select Top 3 ProductID from [Order Details]
		group by ProductID
		order by Sum(Quantity) DESC
	)

