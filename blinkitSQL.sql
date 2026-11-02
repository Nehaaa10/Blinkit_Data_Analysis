select * from blinkit_data

--Total Sales
select sum(total_sales) as total_sales from blinkit_data;


--Avg of Sales
select Avg(total_sales) as avg_sales from blinkit_data;

--No of items
select count(*) as no_of_items from blinkit_data;

--AVG RATING
select cast(avg(rating) as DECIMAL(10,1)) as avg_rating from blinkit_data;

--Total Sales by Fat Content
select item_fat_content, sum(total_sales) as total_sales
from blinkit_data
group by item_fat_content

--Total Sales by Item Type
select item_type, cast(sum(total_sales) as DECIMAL(10,2)) as total_sales
from blinkit_data
group by item_type

--Fat Content by Outlet for Total Sales
SELECT Outlet_Location_Type, item_fat_content, cast(sum(total_sales) as DECIMAL(10,2)) as total_sales
from blinkit_data
group by outlet_location_type, item_fat_content
order by Outlet_Location_Type, total_sales DESC;

--Total Sales by Outlet Establishment
select outlet_establishment_year, cast(sum(total_sales) as decimal(10,2)) as total_sales
from blinkit_data
group by outlet_establishment_year
order by outlet_establishment_year


--Percentage of Sales by Outlet Size
SELECT 
    Outlet_Size, 
    CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;

-- Sales by Outlet Location
select outlet_location_type, sum(total_sales) as total_sales
from blinkit_data
group by outlet_location_type
order by total_sales desc

--All Metrics by Outlet Type:
select outlet_type,
cast(sum(total_sales) as decimal(10,2)) as total_sales,
cast(avg(total_sales) as decimal(10,1)) as Avg_sales,
count(*) no_of_items,
cast(avg(rating) as DECIMAL(10,1)) as avg_rating,
cast(avg(item_visibility) as decimal(10,1)) as avg_item_visibility
from blinkit_data
group by outlet_type
order by total_sales desc
