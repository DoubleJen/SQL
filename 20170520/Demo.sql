sp_who
	--�����ثe�s�u��H
---------------------------------------------------

	--Way 1
select CategoryID, AVG(UnitPrice) as AvgPrice 
	into Must_A_New_Table from Products
	where ProductID >= 0
	group by CategoryID
	--into #Temp1: into���{�ɩʸ�ƪ�, ��L�s�u�L�kŪ��, �����s�u�۰ʮ���.
select * from Must_A_New_Table
	where AvgPrice > 30

	--Way 2
select CategoryID, AVG(UnitPrice) as AvgPrice 
	from Products
	where ProductID >= 0
	group by CategoryID having AVG(UnitPrice) > 30
---------------------------------------------------

select * from Products

select CategoryID, ProductID, sum(UnitsInStock) as SumStock from Products
	group by CategoryID, ProductID with rollup
	order by CategoryID, ProductID
	--with rollup: �HCategoryID������

select CategoryID, ProductID, sum(UnitsInStock) as SumStock from Products
	group by CategoryID, ProductID with cube
	order by CategoryID, ProductID
	--with cube: �HCategoryID, ProductID������
---------------------------------------------------

