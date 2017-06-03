use Northwind
go

/* 500 
  1. 以 SQL Enterprise Manager 檢視 Shippers table 的欄位定義
  2. 請寫一道指令, 新增一筆運輸公司的資料到 Shippers table
     Shippers(CompanyName): Never Lose
     電話(Phone): (040) 0048126
  執行之後, 確認一下那筆新加入的運輸公司, 編號是幾號?
 */ 
 select * from Shippers

 insert into Shippers(CompanyName, Phone)
	values('Never Lose', '(040) 0048126')

select @@IDENTITY
	--『@@IDENTITY』
	-- 如果陳述式不會影響任何資料表具有識別資料行，@IDENTITY ，則傳回 NULL。 
	--如果插入多個資料列，產生多個身分識別值，@IDENTITY傳回產生的最後一個識別值。
	--https://msdn.microsoft.com/zh-tw/library/ms187342.aspx
-------------------------------------------------------------

/* 510 
  請寫一道指令, 將剛才那筆 Never Lose 的公司名稱(CompanyName)改成
  'Never Lost', 電話(Phone)改成'(123) 1234567', 
 */ 
 select * from Shippers

 update Shippers
	set CompanyName = 'Never Lost', Phone = '(123) 1234567'
	where ShipperID = 4
	--『UPDATE』 table_name
	--SET column1 = value1, column2 = value2, ...
	--WHERE condition;
	--https://www.w3schools.com/SQL/sql_update.asp
-------------------------------------------------------------

/* 520
  請寫一道指令, 將產品類別(CategoryID) = 1 的產品資料(products) 
  的單價(UnitPrice)調高百分之 5, 其餘類別不變
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
  對不起, 不小心講錯了, 不是產品類別(CategoryID) = 1 啦..., 什麼!?
  你已經改了...., hmmm..., 可以麻煩請你改回來嗎?
 */ 
 update Products
	set UnitPrice = UnitPrice / 1.05
	where CategoryID =1

 select ProductID, UnitPrice from Products
	where CategoryID = 1
-------------------------------------------------------------

/* 540
  請寫一道指令 刪除剛才那筆 Never Lost 運輸公司的資料
 */ 
 select * from Shippers

 Delete from Shippers
	where ShipperID = 4
	--『DELETE』 FROM table_name
	--WHERE condition;
	--If you omit the WHERE clause, all records in the table will be deleted!
	--https://www.w3schools.com/SQL/sql_delete.asp




