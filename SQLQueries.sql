select * from  [Textile_Sales].[dbo].[Textile]
select count(Order_ID) as Total_count from [Textile_Sales].[dbo].[Textile]
select sum(Sales_Amount_Expected) as Total_Sales_Amount from [Textile_Sales].[dbo].[Textile]
select avg(Unit_Price) as Average_Unit_Price from [Textile_Sales].[dbo].[Textile]
select Fabric_Type,sum(Quantity_Meters_Raw) as Total_Quantity from [Textile_Sales].[dbo].[Textile] group by Fabric_Type
select Region,sum(Sales_Amount_Expected) as Total_Sales from [Textile_Sales].[dbo].[Textile] group by Region
select State,sum(Sales_Amount_Expected) as Total_Sales from [Textile_Sales].[dbo].[Textile] group by State
select Customer_ID, sum(Sales_Amount_Expected) as Total_Sales from [Textile_Sales].[dbo].[Textile] group by Customer_ID
Select TOP 10 Customer_Name, sum(Sales_Amount_Expected) as Total_Sales from [Textile_Sales].[dbo].[Textile] group by Customer_Name
Select TOP 10 Product_Name, sum(Sales_Amount_Expected) as Total_Sales from [Textile_Sales].[dbo].[Textile] group by Product_Name
select count(Order_ID) as Orders, Payment_Method from [Textile_Sales].[dbo].[Textile] group by Payment_Method order by Orders desc
select count(Order_ID) as Orders, Order_Status from [Textile_Sales].[dbo].[Textile] group by Order_Status order by Orders desc
select Order_Month, sum(Sales_Amount_Expected) as Sales from [Textile_Sales].[dbo].[Textile] group by Order_Month order by Sales desc
select Order_Month, count(Order_ID) as Order_Count from [Textile_Sales].[dbo].[Textile] group by Order_Month, Month(Order_Date) order by Month(Order_Date) Asc
select Product_Name, avg(Discount_Percent) as Average_Discount from [Textile_Sales].[dbo].[Textile] group by Product_Name order by Average_discount desc
SELECT MAX(Sales_Amount_Expected) AS Highest_Order_Value FROM [Textile_Sales].[dbo].[Textile]
SELECT MIN(Sales_Amount_Expected) AS Lowest_Order_Value FROM [Textile_Sales].[dbo].[Textile]
SELECT(COUNT(CASE WHEN Order_Status IN ('Cancelled', 'Returned') THEN 1 END) * 100.0) / COUNT(Order_ID) AS Cancelled_Returned_Percentage FROM [Textile_Sales].[dbo].[Textile]
select Customer_Name, sum(Sales_Amount_Expected) as Total_sales, rank() over (order by sum(Sales_Amount_Expected)desc) as RNK FROM [Textile_Sales].[dbo].[Textile] group by Customer_Name
SELECT Product_Name, sum(Quantity_Meters) as Quantity, DENSE_RANK() over (order by sum(Quantity_Meters) desc) as Dnsernk FROM [Textile_Sales].[dbo].[Textile] group by Product_Name
SELECT Order_Year, Order_Month, ((SUM(Sales_Amount_Expected) - LAG(SUM(Sales_Amount_Expected)) OVER(ORDER BY Order_Year, MONTH(Order_Date))) / LAG(SUM(Sales_Amount_Expected)) OVER(ORDER BY Order_Year, MONTH(Order_Date))) * 100 AS Growth_Percentage 
FROM [Textile_Sales].[dbo].[Textile]  GROUP BY Order_Year, Order_Month, MONTH(Order_Date) ORDER BY Order_Year, MONTH(Order_Date);
SELECT CASE WHEN Order_Status = 'Delivered' THEN 'Delivered' ELSE 'Non-Delivered' END AS Delivery_Category, SUM(Sales_Amount_Expected) AS Total_Sales 
FROM [Textile_Sales].[dbo].[Textile] GROUP BY CASE WHEN Order_Status = 'Delivered' THEN 'Delivered' ELSE 'Non-Delivered' END;
SELECT TOP 1 Region, sum(Sales_Amount_Expected) as Total_Revenue FROM [Textile_Sales].[dbo].[Textile] GROUP BY Region ORDER BY Total_Revenue DESC;
SELECT Customer_Name, COUNT(Order_ID) AS Total_Orders FROM [Textile_Sales].[dbo].[Textile] GROUP BY Customer_Name HAVING COUNT(Order_ID) > 20;
CREATE VIEW Cleaned_Textile_Sales_Data AS  SELECT * FROM [Textile_Sales].[dbo].[Textile];
SELECT * FROM Cleaned_Textile_Sales_Data;
