# Sales-Analysis-MySql
# viewing the data
select * from sales;

# checking for the distinct values:-
select distinct(STATUS)from sales;
select distinct(YEAR_ID)from sales;
select distinct(PRODUCTLINE)from sales;
select distinct(COUNTRY)from sales;
select distinct(PRODUCTCODE)from sales;
select distinct(TERRITORY)from sales;
select distinct(DEALSIZE)from sales;


# ANALYSIS:-
# Grouping sales by productline
select PRODUCTLINE, sum(sales) Revenue
from sales
group by PRODUCTLINE
order by Revenue desc;


# Most ordered productline
select PRODUCTLINE, count(ORDERNUMBER) as odercount
from sales
group by PRODUCTLINE
order by odercount desc;


# grouping sales by year
select YEAR_ID, sum(sales) Revenue
from sales
group by YEAR_ID
order by Revenue desc;


# Checking why the sales is so low on year 2005
select distinct(MONTH_ID)
from sales
where YEAR_ID=2005; # They have made sales for 5 months only in 2005


# grouping sales by country
select COUNTRY, sum(sales) Revenue
from sales
group by COUNTRY
order by Revenue desc;


# grouping sales by TERRITORY
select TERRITORY, sum(SALES) Revenue
from sales
group by TERRITORY
order by Revenue desc;


# grouping sales by DEALSIZE
select DEALSIZE, sum(SALES) Revenue
from sales
group by DEALSIZE
order by Revenue desc;

# the best month for sales in a specific year along with order count
select MONTH_ID, sum(sales) Revenue, count(ORDERNUMBER) Frequency
from sales
where YEAR_ID = 2004 #we can change according to our requirements
group by MONTH_ID
order by Revenue desc;

#As we found earlier november is the best month so lets check which what are the product that sare sold maximum in november
select MONTH_ID, PRODUCTLINE, sum(sales) Revenue, count(ORDERNUMBER)
from sales
where YEAR_ID = 2003 and MONTH_ID = 11 #we can change according to our requirements
group by MONTH_ID, PRODUCTLINE
order by Revenue desc;


# Finding the TotalSales, AvgSAles, OderCount, and the last order date for different customers
select CUSTOMERNAME,
sum(sales) TotalSales,
avg(sales) AvgSales,
count(ORDERNUMBER) OderCount,
max(ORDERDATE) last_order_date
from sales
group by CUSTOMERNAME
order by AvgSales desc; #change this according to our requirement


# City with the highest number of sales
select city, sum(sales) Revenue
from sales
group by city
order by Revenue desc;


# City with the highest number of oder count
select city, count(ORDERNUMBER) OderCount
from sales
group by city
order by OderCount desc;


# Country with the highest sales
select country, sum(sales) Revenue
from sales
group by country
order by Revenue desc;


# Country with the highest number of oder count
select country, count(ORDERNUMBER) OderCount
from sales
group by country
order by OderCount desc;


best product in each country
select country, YEAR_ID, PRODUCTLINE, sum(sales) Revenue
from sales
where country = 'USA' #we change according to our requirement
group by country, YEAR_ID, PRODUCTLINE
order by Revenue desc;


# best product in each city
select city, YEAR_ID, PRODUCTLINE, sum(sales) Revenue
from sales
where city = 'Madrid' #we change according to our requirement
group by country, YEAR_ID, PRODUCTLINE
order by Revenue desc;


# sales in each quater
select QTR_ID, sum(sales) as Revenue
from sales
group by QTR_ID
order by Revenue;


oder count in each quater
select QTR_ID, count(ORDERNUMBER) OderCount
from sales
group by QTR_ID
order by OderCount;
