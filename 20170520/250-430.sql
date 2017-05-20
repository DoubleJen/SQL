/* 010 
  �T�w���}���O Northwind ��Ʈw */
use Northwind
go

/* 110 
  �мg�@�D���O, �C�X:
  products ��ƪ��Ҧ����~���
 */ 



/* 120 
  �мg�@�D���O. �C�X:
  products ��ƪ��Ҧ����~, ���C��Ʈ�, �ЦC�X�H�U���:
  ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 */ 



/* 130 
  �мg�@�D���O, �C�X:
  products ��ƪ� "�w�s�q�C��A�q�ʶq" �����~���, ���C��Ʈ�, 
  �ЦC�X�H�U���:
  ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 */ 



/* 140 
  �мg�@�D���O, �C�X:
  products ��ƪ� (�w�s�q + �q�ʤ��ƶq) �C��A�q�ʶq�����~���, ���C��Ʈ�, 
  �ЦC�X�H�U���:
  ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 */ 





/* 150 
  �мg�@�D���O, �C�X:
  products ��ƪ� "�w�s�q�C��A�q�ʶq" �����~���, ���C��Ʈ�, 
  �ЦC�X�H�U���
  SupplierID, ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel

  �åB, �ۦP�����ӥN��(SupplierID)�����~�бƦb�@�_
 */ 





/* 160 
  �мg�@�D ���O �C�X:
  products table ���~�W�٥H C �}�Y�����
 */ 




/* 170 
  �мg�@�D���O, �C�X:
  products ��ƪ����O�s��(CategoryID)�� 1, 4, 8 �����~���
  �ƧǮ�, �Ы�"���O�s��"�Ƨ�, �ۦP���O�s�������~�����~�W��(ProductName)�ƦC
 */ 





/* 180 
  �мg�@�D���O, �C�X:
  products ��ƪ�������� 10 �� 20 ������(�]�t 10, 20)�����~���
  �åB���ӳ��(UnitPrice)�Ѥj��p�Ƨ�
 */ 





/* 190 
  �мg�@�D���O, �C�X:
  products ��ƪ��Ҧ����~, ���C��Ʈ�, 
  �ЦC�X�H�U���
  ProductID, ProductName, UnitPrice, 

  ���L, �U���W�ٽХΤ������:
  ���~�s��, ���~�W��, ���
 */ 






-- 210 �ЦC�X����̰����e�T�����~�C





-- 220 �ЦC�X���~����������C




-- 230 �ХH���O�s��(CategoryID)���� 1, 4, 8 ���p��d��, �p�ⲣ�~����������C




-- 240 �ЦC�X�U�����~����������C




-- 250 �ЦC�X��������̰����e�T�����~�C
select * from Products
	order by UnitPrice DESC

select CategoryID, AVG(UnitPrice) as AvgPrice from Products
	group by CategoryID
	order by AVG(UnitPrice) DESC

select  Top 3 CategoryID, AVG(UnitPrice) as AvgPrice from Products
	group by CategoryID
	order by AVG(UnitPrice) DESC


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
 select ProductID, ProductName as PN, p.SupplierID, s.CompanyName, s.Phone, s.ContactName 
	from Products as p join Suppliers as s
	on p.SupplierID = s.SupplierID



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




-- (Optional)
-- 340 �ЦC�X���u�Ψ���u���ݦ���]ReportsTo�^���M��C
select * from Employees

select EmployeeID, FirstName, ReportsTo from Employees

select E.EmployeeID, E.FirstName, E.ReportsTo, B.FirstName
	from Employees as E left join Employees as B
	on E.ReportsTo = B.EmployeeID



/* 410
  �ЦC�X�U�����~�����O�B�s���B�~�W�B����B
  �������~��������B����P���~����������u���t�v�C
*/
select CategoryID, ProductID, ProductName, UnitPrice from Products

select AVG(UnitPrice) from Products

select CategoryID, ProductID, ProductName, UnitPrice, (select AVG(UnitPrice) from Products) as AvgPrice,
	UnitPrice - (select AVG(UnitPrice) from Products) as PriceDiffer
 from Products
 
 --�p��U�����~����������P����t
select AVG(UnitPrice) from Products
	where CategoryID = 2

select CategoryID, p.CategoryID, ProductName, UnitPrice, (select AVG(UnitPrice) from Products) as AvgPrice,
	UnitPrice - (select AVG(UnitPrice) from Products) as PriceDiffer
 from Products as p

select CategoryID, ProductName, UnitPrice, (select AVG(UnitPrice) from Products where CategoryID = p.CategoryID) as AvgPrice,
	UnitPrice - (select AVG(UnitPrice) from Products where CategoryID = p.CategoryID) as PriceDiffer
 from Products as p


/* 420
   �ЦC�X���q�ĤT�����~���q��C
*/
select * from Orders
select * from [Order Details]
select * from Products where CategoryID = 3
select * from Suppliers

select od.OrderID, od.ProductID, od.UnitPrice, od.Quantity, od.Discount, p.SupplierID, s.Country, p.CategoryID
	from [Order Details] as od left join Products as p
	on od.ProductID = p.ProductID
	join Suppliers as s
	on p.SupplierID = s.SupplierID
	where s.Country='USA'

select CategoryID, SupplierID, ProductID, ProductName
	from Products
	where SupplierID in (select SupplierID from Suppliers where Country = 'USA')
/* 430
  �ЦC�X��o�̦n�e�T�����~�C
*/




