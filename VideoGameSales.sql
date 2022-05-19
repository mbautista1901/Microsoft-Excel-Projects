--Queries for Video Game Sales Project
Select *
From VGSales.dbo.WorkingData$
------------------------------------------------------------------------------------
--1. Find total sales for each region
SELECT SUM(NA_Sales) as Total_NA_Sales, 
	   SUM(EU_Sales) as Total_EU_Sales, 
	   SUM(JP_Sales) as Total_JP_Sales,
	   SUM(Other_Sales) as Total_Other_Sales,
	   SUM(Global_Sales) as Total_Global_Sales
From VGSales.dbo.WorkingData$

------------------------------------------------------------------------------------
--2. Find out best-selling platform per region
SELECT Platform, SUM(NA_Sales) as NASalesPerPlatform,
				 SUM(EU_Sales) as EUSalesPerPlatform,
				 SUM(JP_Sales) as JPSalesPerPlatform,
				 SUM(Other_Sales) as OtherSalesPerPlatform
From VGSales.dbo.WorkingData$ 
GROUP BY Platform

--SELECT Platform, SUM(NA_Sales) as NASalesPerPlatform
--From VGSales.dbo.WorkingData$ 
--GROUP BY Platform
--ORDER BY NASalesPerPlatform DESC

--SELECT Platform, SUM(EU_Sales) as EUSalesPerPlatform
--From VGSales.dbo.WorkingData$ 
--GROUP BY Platform
--ORDER BY EUSalesPerPlatform DESC

--SELECT Platform, SUM(JP_Sales) as JPSalesPerPlatform
--From VGSales.dbo.WorkingData$ 
--GROUP BY Platform
--ORDER BY JPSalesPerPlatform DESC

--SELECT Platform, SUM(Other_Sales) as OtherSalesPerPlatform
--From VGSales.dbo.WorkingData$ 
--GROUP BY Platform
--ORDER BY OtherSalesPerPlatform DESC

------------------------------------------------------------------------------------
--3.Find out which genre sells the most/least (globally)
SELECT Genre, SUM(Global_Sales) as SalesPerGenre
From VGSales.dbo.WorkingData$ 
GROUP BY Genre
ORDER BY SalesPerGenre DESC

------------------------------------------------------------------------------------
--4. Find out which year had the most sales
SELECT Year, SUM(Global_Sales) as SalesPerYear
From VGSales.dbo.WorkingData$ 
GROUP BY Year
ORDER BY  SalesPerYear DESC

------------------------------------------------------------------------------------
--5. Determine the top 10 games for each region
--North America
Select TOP 10 Rank,Name,Platform, NA_Sales
From VGSales.dbo.WorkingData$
Order by NA_Sales DESC

--Europe
Select TOP 10 Rank,Name,Platform, EU_Sales
From VGSales.dbo.WorkingData$
Order by EU_Sales DESC

--Japan
Select TOP 10 Rank,Name,Platform, JP_Sales
From VGSales.dbo.WorkingData$
Order by JP_Sales DESC

--Other Regions
Select TOP 10 Rank,Name,Platform, Other_Sales
From VGSales.dbo.WorkingData$
Order by Other_Sales DESC

--Top 10 games Globally
Select TOP 10 Rank,Name,Platform, Global_Sales
From VGSales.dbo.WorkingData$
Order by Global_Sales DESC
------------------------------------------------------------------------------------
--6. Check the top publisher in each region
SELECT Publisher, SUM(NA_Sales) as NASalesPerPlatform
From VGSales.dbo.WorkingData$ 
GROUP BY Publisher
ORDER BY NASalesPerPlatform DESC

SELECT Publisher, SUM(EU_Sales) as EUSalesPerPlatform
From VGSales.dbo.WorkingData$ 
GROUP BY Publisher
ORDER BY EUSalesPerPlatform DESC

SELECT Publisher, SUM(JP_Sales) as JPSalesPerPlatform
From VGSales.dbo.WorkingData$ 
GROUP BY Publisher
ORDER BY JPSalesPerPlatform DESC

SELECT Publisher, SUM(Other_Sales) as OtherSalesPerPlatform
From VGSales.dbo.WorkingData$ 
GROUP BY Publisher
ORDER BY OtherSalesPerPlatform DESC