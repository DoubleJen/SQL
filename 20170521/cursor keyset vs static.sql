use Northwind
GO

-- 定義 Cursor (請留意 Keyset 選項)
DECLARE CursorLab CURSOR
static
	--Keyset
FOR 
select * from Customers
  order by CustomerID

-- 開啟 Cursor
OPEN CursorLab

-- 請檢視第一筆的內容
FETCH NEXT FROM CursorLab
	--一筆一筆提出來

-- 在另一個 Client 修改資料
-- update Customers set ContactName = 'Maria Anders2' where CustomerID = 'ALFKI'

-- 返回前一筆(原先的第一筆), 資料內容是什麼?
FETCH PRIOR FROM CursorLab
	--一筆一筆回去	


-- 結束練習
CLOSE CursorLab	
	--定義還在	
deallocate CursorLab	
	--完全清除