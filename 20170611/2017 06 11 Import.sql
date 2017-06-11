--匯入先檢查
select * from test0611

--匯入Northwind的Products結構, 匯入前Northwind的Products識別規格更改為否
select * into Products from Northwind.dbo.Products where ProductID < 0
select * from Products

--將精靈匯入的test0611倒入Import0611中的Products
insert into Products select * from test0611
select * from Products