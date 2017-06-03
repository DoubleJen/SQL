use Northwind
go

/* 500 
  1. �H SQL Enterprise Manager �˵� Shippers table �����w�q
  2. �мg�@�D���O, �s�W�@���B�餽�q����ƨ� Shippers table
     Shippers(CompanyName): Never Lose
     �q��(Phone): (040) 0048126
  ���椧��, �T�{�@�U�����s�[�J���B�餽�q, �s���O�X��?
 */ 
 select * from Shippers

 insert into Shippers(CompanyName, Phone)
	values('Never Lose', '(040) 0048126')

select @@IDENTITY
	--�y@@IDENTITY�z
	-- �p�G���z�����|�v�T�����ƪ�㦳�ѧO��Ʀ�A@IDENTITY �A�h�Ǧ^ NULL�C 
	--�p�G���J�h�Ӹ�ƦC�A���ͦh�Ө����ѧO�ȡA@IDENTITY�Ǧ^���ͪ��̫�@���ѧO�ȡC
	--https://msdn.microsoft.com/zh-tw/library/ms187342.aspx
-------------------------------------------------------------

/* 510 
  �мg�@�D���O, �N��~���� Never Lose �����q�W��(CompanyName)�令
  'Never Lost', �q��(Phone)�令'(123) 1234567', 
 */ 
 select * from Shippers

 update Shippers
	set CompanyName = 'Never Lost', Phone = '(123) 1234567'
	where ShipperID = 4
	--�yUPDATE�z table_name
	--SET column1 = value1, column2 = value2, ...
	--WHERE condition;
	--https://www.w3schools.com/SQL/sql_update.asp
-------------------------------------------------------------

/* 520
  �мg�@�D���O, �N���~���O(CategoryID) = 1 �����~���(products) 
  �����(UnitPrice)�հ��ʤ��� 5, ��l���O����
 */ 
 select ProductID, UnitPrice from Products
	where CategoryID = 1

 update Products
	set UnitPrice = UnitPrice * 1.05
	where CategoryID =1

 select ProductID, UnitPrice from Products
	where CategoryID = 1
-------------------------------------------------------------

/* 530
  �藍�_, ���p�������F, ���O���~���O(CategoryID) = 1 ��..., ����!?
  �A�w�g��F...., hmmm..., �i�H�·нЧA��^�Ӷ�?
 */ 
 update Products
	set UnitPrice = UnitPrice / 1.05
	where CategoryID =1

 select ProductID, UnitPrice from Products
	where CategoryID = 1
-------------------------------------------------------------

/* 540
  �мg�@�D���O �R����~���� Never Lost �B�餽�q�����
 */ 
 select * from Shippers

 Delete from Shippers
	where ShipperID = 4
	--�yDELETE�z FROM table_name
	--WHERE condition;
	--If you omit the WHERE clause, all records in the table will be deleted!
	--https://www.w3schools.com/SQL/sql_delete.asp




