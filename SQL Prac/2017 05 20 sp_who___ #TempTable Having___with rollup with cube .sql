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

select CategoryID, ProductID, sum(UnitsInStock) as SumStock from Products
	group by CategoryID, ProductID with rollup
	order by CategoryID, ProductID
	--with rollup: �HCategoryID������

select CategoryID, ProductID, sum(UnitsInStock) as SumStock from Products
	group by CategoryID, ProductID with cube
	order by CategoryID, ProductID
	--with cube: �HCategoryID, ProductID������
---------------------------------------------------