

declare @i int = 0
	--�ŧi�ܼ� & ���
	--���]��ȫK��null��
	
	select @i
	select @I
		--�ܼƤ��Ϥ��j�p�g
	
	set @i =75
		--set�ܼƬ��s��1

	select @i
go


declare @k int = 0
declare	@unitprice decimal(10,2)

	set @k =3
	select @k

	select @k = UnitsInStock,
		   @unitprice = UnitPrice
		from Products where ProductID =1
		--set�ܼƬ�table������

	select @k
	select @unitprice
go

declare @j int  = 100

	if (@j between 100 and 200)
		--()�i�[�i���[
		--where ����g�k �pbetween and or like...���i���i�ӥ�
		begin
			print 'YES'
		end
	else
		begin 
			print 'NO'
		end
go

declare @m int = 0
	set @m = 1
	while(@m < =3)
		begin
			print @m
			set @m = @m + 1
		end
go