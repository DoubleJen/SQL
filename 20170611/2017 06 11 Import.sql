--�פJ���ˬd
select * from test0611

--�פJNorthwind��Products���c, �פJ�eNorthwind��Products�ѧO�W���אּ�_
select * into Products from Northwind.dbo.Products where ProductID < 0
select * from Products

--�N���F�פJ��test0611�ˤJImport0611����Products
insert into Products select * from test0611
select * from Products