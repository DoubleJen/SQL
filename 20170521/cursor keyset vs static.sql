use Northwind
GO

-- �w�q Cursor (�Яd�N Keyset �ﶵ)
DECLARE CursorLab CURSOR
static
	--Keyset
FOR 
select * from Customers
  order by CustomerID

-- �}�� Cursor
OPEN CursorLab

-- ���˵��Ĥ@�������e
FETCH NEXT FROM CursorLab
	--�@���@�����X��

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