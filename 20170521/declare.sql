

declare @i int = 0
	--宣告變數 & 初值
	--不設初值便為null值
	
	select @i
	select @I
		--變數不區分大小寫
	
	set @i =75
		--set變數為新值1

	select @i
go


declare @k int = 0
declare	@unitprice decimal(10,2)

	set @k =3
	select @k

	select @k = UnitsInStock,
		   @unitprice = UnitPrice
		from Products where ProductID =1
		--set變數為table中的值

	select @k
	select @unitprice
go

declare @j int  = 100

	if (@j between 100 and 200)
		--()可加可不加
		--where 條件寫法 如between and or like...均可拿進來用
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