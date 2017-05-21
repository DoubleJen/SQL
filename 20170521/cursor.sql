use Northwind
GO

create table #Temp2
(
	 ProductID int, 
	 UnitsInStock int,
	 TotalStock int
)
go

-- �w�q Cursor (�Яd�N Keyset �ﶵ)
DECLARE CursorLab CURSOR
Keyset
FOR 
select ProductID, UnitsInStock from Products
  order by ProductID

-- �}�� Cursor
OPEN CursorLab

-- ���˵��Ĥ@�������e
--FETCH NEXT FROM CursorLab
	--�@���@�����X��
	
	--�j��L�X����
		declare @ProductID int = 0
		declare @UnitsInStock int = 0
		declare @TotalStock int = 0
		fetch next from CursorLab into @ProductID, @UnitsInStock
		print 'init:'
		print @@FETCH_STATUS
		--https://msdn.microsoft.com/zh-tw/library/ms187308.aspx
		print '--'
		
		while (@@FETCH_STATUS = 0)
			begin
				set @TotalStock = @TotalStock + @UnitsInStock
				print @ProductID
				print @UnitsInStock
				print @TotalStock
				print '------------------'

				insert into #Temp2 values(@ProductID, @UnitsInStock, @TotalStock)
				FETCH NEXT FROM CursorLab into @ProductID, @UnitsInStock
			end

-- �b�t�@�� Client �ק���
-- update Customers set ContactName = 'Maria Anders2' where CustomerID = 'ALFKI'

-- ��^�e�@��(������Ĥ@��), ��Ƥ��e�O����?
FETCH PRIOR FROM CursorLab
	--�@���@���^�h	



-- �����m��
CLOSE CursorLab	
	--�w�q�٦b	
deallocate CursorLab	
	--�����M��

select * from #Temp2

drop table #Temp2