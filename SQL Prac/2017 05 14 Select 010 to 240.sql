/* 010 
  �T�w���}���O Northwind ��Ʈw */
use Northwind
go
	--�ygo�z: �Q�� GO �ӧ@���妸�������H���C
	--https://msdn.microsoft.com/zh-tw/library/ms188037.aspx
-------------------------------------------------------------

/* 110 
  �мg�@�D���O, �C�X:
  products ��ƪ��Ҧ����~���
 */ 
 select * from Products
 -------------------------------------------------------------

/* 120 
  �мg�@�D���O. �C�X:
  products ��ƪ��Ҧ����~, ���C��Ʈ�, �ЦC�X�H�U���:
  ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 */ 
 select ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel from Products
	--�ySELECT column1, column2, ...�zFROM table_name
 -------------------------------------------------------------

/* 130 
  �мg�@�D���O, �C�X:
  products ��ƪ� "�w�s�q�C��A�q�ʶq" �����~���, ���C��Ʈ�, 
  �ЦC�X�H�U���:
  ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 */ 
 select ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel from Products
	where UnitsInStock < ReorderLevel
	--�yWHERE condition�z;
	--https://www.w3schools.com/SQL/sql_where.asp
-------------------------------------------------------------

/* 140 
  �мg�@�D���O, �C�X:
  products ��ƪ� (�w�s�q + �q�ʤ��ƶq) �C��A�q�ʶq�����~���, ���C��Ʈ�, 
  �ЦC�X�H�U���:
  ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 */ 
 select ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel from Products
	where (UnitsInStock + UnitsOnOrder) < ReorderLevel
-------------------------------------------------------------

/* 150 
  �мg�@�D���O, �C�X:
  products ��ƪ� "�w�s�q�C��A�q�ʶq" �����~���, ���C��Ʈ�, 
  �ЦC�X�H�U���
  SupplierID, ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel

  �åB, �ۦP�����ӥN��(SupplierID)�����~�бƦb�@�_
 */ 
 select SupplierID, ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel from Products
	where UnitsInStock < ReorderLevel
	order by SupplierID
	--�yORDER BY column1, column2, ... ASC(default) | DESC;�z
	--https://www.w3schools.com/SQL/sql_orderby.asp
-------------------------------------------------------------

/* 160 
  �мg�@�D ���O �C�X:
  products table ���~�W�٥H C �}�Y�����
 */ 
 select * from Products
	where ProductName like 'c%'
	union all
 select * from Products
	where ProductName like 'C%'
	--WHERE columnN �yLIKE 'pattern'�z;
	--"%" : represents zero, one, or multiple characters
    --"_" : represents a single character
	--https://www.w3schools.com/SQL/sql_like.asp
	--�yUNION�z
	--To allow duplicate values, use �yUNION ALL�z:
	--https://www.w3schools.com/SQL/sql_union.asp
-------------------------------------------------------------

/* 170 
  �мg�@�D���O, �C�X:
  products ��ƪ����O�s��(CategoryID)�� 1, 4, 8 �����~���
  �ƧǮ�, �Ы�"���O�s��"�Ƨ�, �ۦP���O�s�������~�����~�W��(ProductName)�ƦC
 */ 
 select * from Products
	where CategoryID in (1, 4, 8)
	order by CategoryID, ProductName
	--WHERE condition1 �yAND�z condition2 �yAND�z condition3 ...;
	--WHERE condition1 �yOR�z condition2 �yOR�z condition3 ...;
	--WHERE �yNOT�z condition;
	--https://www.w3schools.com/SQL/sql_and_or.asp
	--WHERE column_name �yIN�z (value1, value2, ...);
	--WHERE column_name �yIN�z (SELECT STATEMENT);
	--https://www.w3schools.com/SQL/sql_in.asp
	--WHERE column_name �yBETWEEN�z value1 AND value2;
	--https://www.w3schools.com/SQL/sql_between.asp
	--WHERE column_name IS �yNULL�z;
	--WHERE column_name IS �yNOT NULL�z;
	--https://www.w3schools.com/SQL/sql_null_values.asp
-------------------------------------------------------------

/* 180 
  �мg�@�D���O, �C�X:
  products ��ƪ�������� 10 �� 20 ������(�]�t 10, 20)�����~���
  �åB���ӳ��(UnitPrice)�Ѥj��p�Ƨ�
 */ 
 select * from Products
	where UnitPrice between 10 and 20
	order by UnitPrice DESC
-------------------------------------------------------------

/* 190 
  �мg�@�D���O, �C�X:
  products ��ƪ��Ҧ����~, ���C��Ʈ�, 
  �ЦC�X�H�U���
  ProductID, ProductName, UnitPrice, 

  ���L, �U���W�ٽХΤ������:
  ���~�s��, ���~�W��, ���
 */ 
 select ProductID as ���~�s��, 
		ProductName as ���~�W��, 
		UnitPrice as ���, 
		(UnitPrice * UnitsInStock) as StockCost 
 from Products
	--SELECT column1 �yas�z self-defined1, column2 �yas�z self-defined2, ...
 -------------------------------------------------------------

-- 210 �ЦC�X����̰����e�T�����~�C
select * from Products
	order by UnitPrice DESC

select top 3 * from products
	order by UnitPrice DESC
	--SELECT �yTOP number|percent�z column_name(s)
	--https://www.w3schools.com/SQL/sql_top.asp
	--SELECT TOP number �yWITH TIES�z
	--�yWITH TIES�z��弰t TOP n �٦� ORDER BY, �|�� ORDER BY �̫�@�������G�@�˪�data�]�X��
	--http://powerfuleric.pixnet.net/blog/post/36739961-sql-%E8%AA%9E%E6%B3%95-%E7%9A%84-with-ties
 -------------------------------------------------------------

-- 220 �ЦC�X���~����������C
select * from Products

select AVG(UnitPrice) from Products
	--SELECT �yAVG(column_name)�z, �|���� Null ��
	--SELECT �ySUM(column_name)�z, �|���� Null ��
	--SELECT �yCOUNT(column_name)�z, 
		--COUNT(*) �|�Ǧ^�s�դ������ؼơC �䤤�]�A �uNULL �ȩM�ƥ��v
		--COUNT (DISTINCT�B�⦡) �����B�⦡�C�Ӹ�ƦC�s�դ��A�öǦ^�u�ߤ@�B�D null �ȡv���ƥءC
	--https://www.w3schools.com/SQL/sql_count_avg_sum.asp
	--https://msdn.microsoft.com/zh-tw/library/ms177677.aspx
	--https://msdn.microsoft.com/zh-tw/library/ms187810.aspx
	--https://msdn.microsoft.com/zh-tw/library/ms175997.aspx
	--http://m.studyofnet.com/news/1219.html
-------------------------------------------------------------

-- 230 �ХH���O�s��(CategoryID)���� 1, 4, 8 ���p��d��, �p�ⲣ�~����������C
select * from Products
	where CategoryID in (1, 4, 8)

select AVG(UnitPrice) from Products
	where CategoryID in (1, 4, 8)
-------------------------------------------------------------

-- 240 �ЦC�X�U�����~����������C
select * from products

select CategoryID, Avg(UnitPrice) as AvgPrice from products
  group by CategoryID
  having Avg(UnitPrice) >30
  --SELECT column_name(s), COUNT, MAX, MIN, SUM, AVG FROM table_name
  --WHERE condition
  --�yGROUP BY�z column_name(s)
  --HAVING condition
  --ORDER BY column_name(s);
  --https://www.w3schools.com/SQL/sql_groupby.asp
  --https://www.w3schools.com/SQL/sql_having.asp

