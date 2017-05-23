/* 010 
  確定打開的是 Northwind 資料庫 */
use Northwind
go
	--『go』: 利用 GO 來作為批次結束的信號。
	--https://msdn.microsoft.com/zh-tw/library/ms188037.aspx
-------------------------------------------------------------

/* 110 
  請寫一道指令, 列出:
  products 資料表的所有產品資料
 */ 
 select * from Products
 -------------------------------------------------------------

/* 120 
  請寫一道指令. 列出:
  products 資料表的所有產品, 條列資料時, 請列出以下欄位:
  ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 */ 
 select ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel from Products
	--『SELECT column1, column2, ...』FROM table_name
 -------------------------------------------------------------

/* 130 
  請寫一道指令, 列出:
  products 資料表 "庫存量低於再訂購量" 的產品資料, 條列資料時, 
  請列出以下欄位:
  ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 */ 
 select ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel from Products
	where UnitsInStock < ReorderLevel
	--『WHERE condition』;
	--https://www.w3schools.com/SQL/sql_where.asp
-------------------------------------------------------------

/* 140 
  請寫一道指令, 列出:
  products 資料表 (庫存量 + 訂購中數量) 低於再訂購量的產品資料, 條列資料時, 
  請列出以下欄位:
  ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel
 */ 
 select ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel from Products
	where (UnitsInStock + UnitsOnOrder) < ReorderLevel
-------------------------------------------------------------

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
	--『ORDER BY column1, column2, ... ASC(default) | DESC;』
	--https://www.w3schools.com/SQL/sql_orderby.asp
-------------------------------------------------------------

/* 160 
  請寫一道 指令 列出:
  products table 產品名稱以 C 開頭的資料
 */ 
 select * from Products
	where ProductName like 'c%'
	union all
 select * from Products
	where ProductName like 'C%'
	--WHERE columnN 『LIKE 'pattern'』;
	--"%" : represents zero, one, or multiple characters
    --"_" : represents a single character
	--https://www.w3schools.com/SQL/sql_like.asp
	--『UNION』
	--To allow duplicate values, use 『UNION ALL』:
	--https://www.w3schools.com/SQL/sql_union.asp
-------------------------------------------------------------

/* 170 
  請寫一道指令, 列出:
  products 資料表之類別編號(CategoryID)為 1, 4, 8 的產品資料
  排序時, 請按"類別編號"排序, 相同類別編號的產品按產品名稱(ProductName)排列
 */ 
 select * from Products
	where CategoryID in (1, 4, 8)
	order by CategoryID, ProductName
	--WHERE condition1 『AND』 condition2 『AND』 condition3 ...;
	--WHERE condition1 『OR』 condition2 『OR』 condition3 ...;
	--WHERE 『NOT』 condition;
	--https://www.w3schools.com/SQL/sql_and_or.asp
	--WHERE column_name 『IN』 (value1, value2, ...);
	--WHERE column_name 『IN』 (SELECT STATEMENT);
	--https://www.w3schools.com/SQL/sql_in.asp
	--WHERE column_name 『BETWEEN』 value1 AND value2;
	--https://www.w3schools.com/SQL/sql_between.asp
	--WHERE column_name IS 『NULL』;
	--WHERE column_name IS 『NOT NULL』;
	--https://www.w3schools.com/SQL/sql_null_values.asp
-------------------------------------------------------------

/* 180 
  請寫一道指令, 列出:
  products 資料表之單價介於 10 到 20 元之間(包含 10, 20)的產品資料
  並且按照單價(UnitPrice)由大到小排序
 */ 
 select * from Products
	where UnitPrice between 10 and 20
	order by UnitPrice DESC
-------------------------------------------------------------

/* 190 
  請寫一道指令, 列出:
  products 資料表之所有產品, 條列資料時, 
  請列出以下欄位
  ProductID, ProductName, UnitPrice, 

  不過, 各欄位名稱請用中文顯示:
  產品編號, 產品名稱, 單價
 */ 
 select ProductID as 產品編號, 
		ProductName as 產品名稱, 
		UnitPrice as 單價, 
		(UnitPrice * UnitsInStock) as StockCost 
 from Products
	--SELECT column1 『as』 self-defined1, column2 『as』 self-defined2, ...
 -------------------------------------------------------------

-- 210 請列出單價最高的前三項產品。
select * from Products
	order by UnitPrice DESC

select top 3 * from products
	order by UnitPrice DESC
	--SELECT 『TOP number|percent』 column_name(s)
	--https://www.w3schools.com/SQL/sql_top.asp
	--SELECT TOP number 『WITH TIES』
	--『WITH TIES』需撘配 TOP n 還有 ORDER BY, 會讓 ORDER BY 最後一筆的結果一樣的data也出來
	--http://powerfuleric.pixnet.net/blog/post/36739961-sql-%E8%AA%9E%E6%B3%95-%E7%9A%84-with-ties
 -------------------------------------------------------------

-- 220 請列出產品的平均單價。
select * from Products

select AVG(UnitPrice) from Products
	--SELECT 『AVG(column_name)』, 會忽略 Null 值
	--SELECT 『SUM(column_name)』, 會忽略 Null 值
	--SELECT 『COUNT(column_name)』, 
		--COUNT(*) 會傳回群組中的項目數。 其中包括 「NULL 值和複本」
		--COUNT (DISTINCT運算式) 評估運算式每個資料列群組中，並傳回「唯一且非 null 值」的數目。
	--https://www.w3schools.com/SQL/sql_count_avg_sum.asp
	--https://msdn.microsoft.com/zh-tw/library/ms177677.aspx
	--https://msdn.microsoft.com/zh-tw/library/ms187810.aspx
	--https://msdn.microsoft.com/zh-tw/library/ms175997.aspx
	--http://m.studyofnet.com/news/1219.html
-------------------------------------------------------------

-- 230 請以類別編號(CategoryID)等於 1, 4, 8 為計算範圍, 計算產品的平均單價。
select * from Products
	where CategoryID in (1, 4, 8)

select AVG(UnitPrice) from Products
	where CategoryID in (1, 4, 8)
-------------------------------------------------------------

-- 240 請列出各類產品的平均單價。
select * from products

select CategoryID, Avg(UnitPrice) as AvgPrice from products
  group by CategoryID
  having Avg(UnitPrice) >30
  --SELECT column_name(s), COUNT, MAX, MIN, SUM, AVG FROM table_name
  --WHERE condition
  --『GROUP BY』 column_name(s)
  --HAVING condition
  --ORDER BY column_name(s);
  --https://www.w3schools.com/SQL/sql_groupby.asp
  --https://www.w3schools.com/SQL/sql_having.asp

