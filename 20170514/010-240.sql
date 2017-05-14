/* 010 
  確定打開的是 Northwind 資料庫 */
use Northwind
go


/* 110 
  請寫一道指令, 列出:
  products 資料表的所有產品資料
 */
 select * from Products 


/* 120 
  請寫一道指令. 列出:
  products 資料表的所有產品, 條列資料時, 請列出以下欄位:
  ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 */ 
 select ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel 
	from Products


/* 130 
  請寫一道指令, 列出:
  products 資料表 "庫存量低於再訂購量" 的產品資料, 條列資料時, 
  請列出以下欄位:
  ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 */ 
select ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel from Products
	where UnitsInStock < ReorderLevel


/* 140 
  請寫一道指令, 列出:
  products 資料表 (庫存量 + 訂購中數量) 低於再訂購量的產品資料, 條列資料時, 
  請列出以下欄位:
  ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 */ 
 select ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel from Products
	where (UnitsInStock + UnitsOnOrder) < ReorderLevel


/* 150 
  請寫一道指令, 列出:
  products 資料表 "庫存量低於再訂購量" 的產品資料, 條列資料時, 
  請列出以下欄位
  SupplierID, ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel

  並且, 相同供應商代號(SupplierID)的產品請排在一起
 */ 
 select SupplierID, ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel from Products
	where UnitsInStock < ReorderLevel
	order by SupplierID


/* 160 
  請寫一道 指令 列出:
  products table 產品名稱以 C 開頭的資料
 */ 
 select * from Products
	where ProductName like 'C%'
		union all
select * from Products
	where ProductName like 'c%'




/* 170 
  請寫一道指令, 列出:
  products 資料表之類別編號(CategoryID)為 1, 4, 8 的產品資料
  排序時, 請按"類別編號"排序, 相同類別編號的產品按產品名稱(ProductName)排列
 */ 
 select * from Products
	where CategoryID in (1, 4, 8)
	order by CategoryID, ProductName


/* 180 
  請寫一道指令, 列出:
  products 資料表之單價介於 10 到 20 元之間(包含 10, 20)的產品資料
  並且按照單價(UnitPrice)由大到小排序
 */ 
 select * from Products
	where UnitPrice Between 10 And 20
	order by UnitPrice desc


/* 190 
  請寫一道指令, 列出:
  products 資料表之所有產品, 條列資料時, 
  請列出以下欄位
  ProductID, ProductName, UnitPrice, 

  不過, 各欄位名稱請用中文顯示:
  產品編號, 產品名稱, 單價
 */ 
 select ProductID as 產品編號,  ProductName as 產品名稱, UnitPrice as 單價 from Products





-- 210 請列出單價最高的前三項產品。
select * from products
  order by UnitPrice desc

select Top 3 * from products
  order by UnitPrice desc


-- 220 請列出產品的平均單價。
select * from products

select avg(UnitPrice) from products



-- 230 請以類別編號(CategoryID)等於 1, 4, 8 為計算範圍, 計算產品的平均單價。

select * from products

select * from products
  where CategoryID in (1, 4, 8)

select avg(UnitPrice) from products
  where CategoryID in (1, 4, 8)



-- 240 請列出各類產品的平均單價。
select * from products

select Avg(UnitPrice) from products
  group by CategoryID

select CategoryID, Avg(UnitPrice) as AvgPrice from products
  group by CategoryID

select CategoryID, ProductID, Avg(UnitPrice) as AvgPrice from products
  group by CategoryID
  --同一個CategoryID會有很多個ProductID 所以出error

select CategoryID, Avg(UnitPrice) as AvgPrice from products
	where ProductID > 0
  group by CategoryID having Avg(UnitPrice) >30




-- 250 請列出平均單價最高的前三類產品。




/* 310
  請寫一道指令, 列出 products 資料表的以下欄位
  ProductID, ProductName, SupplierID
 */ 




/* 320
   同上, 但請一併列出該供應商名稱(CompanyName)、
   聯絡電話(Phone)、聯絡人(ContactName)好嗎?
   另外, 相同供應商的資料請列在一起
 */ 




/* 330
   我想列出「所有」供應商目前各自提供我們哪些產品資料的對照表,
   目前沒提供我們產品的供應商也要列出

   <note>
   下指令前, 請先執行下列指令:
   -- begin --
   insert into suppliers
     (CompanyName, ContactName, Phone)
      values
     ('Taiwan First', 'A-Ban', '(001) 000-0001')
   -- end --
 */ 




-- (Optional)
-- 340 請列出員工及其員工直屬老闆（ReportsTo）的清單。




/* 410
  請列出各項產品的類別、編號、品名、單價、
  該類產品平均單價、單價與產品平均單價的「價差」。
*/




/* 420
   請列出有訂第三類產品的訂單。
*/





/* 430
  請列出賣得最好前三項產品。
*/




