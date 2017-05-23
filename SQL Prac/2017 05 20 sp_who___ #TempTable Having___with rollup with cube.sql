use Northwind
go

exec sp_who
go
	--�C�X�Ҧ��ثe���B�z��
	--https://msdn.microsoft.com/zh-tw/library/ms174313.aspx
-------------------------------------------------------------

--�qProducts��ƪ�D�XAVG(UnitPrice) > 30��
--Mathod 1: �Ф@�s��ƪ�A�A�Hwhere�q�s��ƪ�D�X
select CategoryID, AVG(UnitPrice) as AvgPrice 
	into #Temp1
	from Products
	where ProductID >=1
	group by CategoryID
		--�yinto NewTable(or #TempTable)�z: �إ߷s����ƪ�
		--#TempTable: �b tempdb ��Ʈw���A�إߤ@�ӦW�٬� #TempTable ����ƪ�]���Ȧs��ƪ��^�C
		--            �o�ӼȦs��ƪ�u���إߪ̥i�H�ϥΡA��L�H�i�H�ݨ�A���L�k�s���C
		--            ���D�Q�� DROP TABLE �ө��T�����Ȧs��ƪ�A�_�h��إ߸ӼȦs��ƪ��s�u�����ɡASQL Server �|�۰ʱN��R���C
		--https://technet.microsoft.com/zh-tw/library/ms190750(v=sql.105).aspx
		--https://social.msdn.microsoft.com/Forums/zh-TW/850f5bf2-79b5-4f32-ba40-0bba2db1e929/temptabledeclare-temptable?forum=240

	select * from #Temp1
		where AvgPrice >30

--Mathod 2: group by + havin
select CategoryID, AVG(UnitPrice) as AvgPrice 
	from Products
	where ProductID >=1
	group by CategoryID having AVG(UnitPrice) > 30
-------------------------------------------------------------

select * from Products
	where ProductID = 0 or CategoryID = 0

--�p�p�`�pwith Rollup
create view vwRollUP as
	select top 10000000 
			CASE WHEN (GROUPING(CategoryID) = 1) THEN ''	
				ELSE CategoryID
				END AS CategoryID,
			CASE WHEN (GROUPING(ProductID) = 1) THEN ''	
				ELSE ProductID
				END AS ProductID,
			SUM(UnitsInStock) as SumStock 
		from Products
		group by CategoryID, ProductID with rollup
		order by CategoryID, ProductID
		--ROLLUP �N���ͤ@�ӵ��G���A��ܥX�������Ʀ椤�ȶ��h���J�`�C

	select * from vwRollUP 
		where CategoryID = 0 or ProductID = 0 

	drop view vwRollUP

--�p�p�`�pwith Cube
create view vwCube as
	select top 10000000 
			CASE WHEN (GROUPING(CategoryID) = 1) THEN ''	
				ELSE CategoryID
				END AS CategoryID,
			CASE WHEN (GROUPING(ProductID) = 1) THEN ''	
				ELSE ProductID
				END AS ProductID,
			SUM(UnitsInStock) as SumStock 
		from Products
		group by CategoryID, ProductID with cube
		order by CategoryID, ProductID
		--CUBE �N���ͤ@�ӵ��G���A��ܥX��w��Ʀ椧�Ҧ��ȲզX���J�`�C

	select * from vwCube 
		where CategoryID = 0 or ProductID = 0 

	drop view vwCube