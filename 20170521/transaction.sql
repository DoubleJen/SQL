use northwind
go

set xact_abort off
go


begin tran
  print 'flag 1'
  print @@TranCount
		--計算幾個Tran進行中

  print 'flag 2'
  select * from productss
		--無productss這個資料表, 所以程式當掉(有時不會往下

  print 'flag 3'
  print @@TranCount

rollback tran
go
----------------------------------------------------------------------

-- note: print @@TranCount > 0, that is... transaction still on!!





-- alter table products drop constraint chk_price
-- alter table products drop constraint CK_Products_UnitPrice
alter table products add constraint chk_price check (UnitPrice >= 0)
select * from products
go

begin tran
  print 'flag 1'
  print @@TranCount

  print 'flag 2'
  update products set unitPrice = -1 where productID = 1
	--unitPrice must >= 0, 但仍往3邁進(有時往下, 程式當機時, 應親自檢查
						
  print 'flag 3'
  print @@TranCount

rollback tran
go

-- flag 2 skipped, go ahead to flag3
print @@TranCount






begin tran
  print 'flag 1'
  print @@TranCount

  print 'flag 2'
  update products set unitPrice = -1 where productID = 1
  if @@error <> 0	--@@error <> 0 系統遇到問題了嗎? 決定重做 跳脫 or ...
  begin
    print 'flag: if @error is true'
    rollback tran
    return
  end

  print 'flag 3'
  print @@TranCount

rollback tran
go

-- flag 2 skipped, go ahead to flag3
print @@TranCount



set xact_abort on
	--開關打開 SQL針對再小問題都停下來, 取消==>缺點: server過度敏感(因已投入的事情必須重做), 真正問題尚未發現
begin tran
  print 'flag 1'
  print @@TranCount

  print 'flag 2'
  update products set unitPrice = -1 where productID = 1

  print 'flag 3'
  print @@TranCount

rollback tran
go

-- flag 2 skipped, go ahead to flag3
print @@TranCount


