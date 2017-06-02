use Northwind
go

-- 250 �ЦC�X��������̰����e�T�����~�C
select * from Products

select CategoryID, AVG(UnitPrice) as AvgPrice from Products
	group by CategoryID
	order by AVG(UnitPrice) DESC

select Top 3 CategoryID, AVG(UnitPrice) as AvgPrice from Products
	group by CategoryID
	order by AVG(UnitPrice) DESC
-------------------------------------------------------------

/* 310
  �мg�@�D���O, �C�X products ��ƪ��H�U���
  ProductID, ProductName, SupplierID
 */ 
select ProductID, ProductName, SupplierID from Products

/* 320
   �P�W, ���Ф@�֦C�X�Ө����ӦW��(CompanyName)�B
   �p���q��(Phone)�B�p���H(ContactName)�n��?
   �t�~, �ۦP�����Ӫ���ƽЦC�b�@�_
 */ 
 select * from Suppliers

 select p.ProductID, p.ProductName, p.SupplierID, s.CompanyName, s.Phone, s.ContactName 
	from Products as p join Suppliers as s on p.SupplierID = s.SupplierID
	order by p.SupplierID
-------------------------------------------------------------

/* 330
   �ڷQ�C�X�u�Ҧ��v�����ӥثe�U�۴��ѧڭ̭��ǲ��~��ƪ���Ӫ�,
   �ثe�S���ѧڭ̲��~�������Ӥ]�n�C�X

   <note>
   �U���O�e, �Х�����U�C���O:
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
-- 340 �ЦC�X���u�Ψ���u���ݦ���]ReportsTo�^���M��C
select * from Employees

select EmployeeID, (FirstName + ' ' + LastName) as EmployeeName, ReportsTo
	from Employees

select e.EmployeeID, (e.FirstName + ' ' + e.LastName) as EmployeeName, e.ReportsTo, 
	   (b.FirstName + ' ' + b.LastName) as BossName
	from Employees as e left join Employees as b on e.ReportsTo = b.EmployeeID
-------------------------------------------------------------

/* 410
  �ЦC�X�U�����~�����O�B�s���B�~�W�B����B
  �������~��������B����P���~����������u���t�v�C
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
   �ЦC�X���q�ĤT�����~���q��C
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
  �ЦC�X��o�̦n�e�T�����~�C
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

