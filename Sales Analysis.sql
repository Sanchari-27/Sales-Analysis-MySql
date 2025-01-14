# creating a data base
create schema Sanchari;
# using the database
use Arkajyoti;

#viewing the data
select * from sales;

#checking for the distinct values:-
select distinct(STATUS)from sales;
select distinct(YEAR_ID)from sales;
select distinct(PRODUCTLINE)from sales;
select distinct(COUNTRY)from sales;
select distinct(PRODUCTCODE)from sales;
select distinct(TERRITORY)from sales;
select distinct(DEALSIZE)from sales;

#ANALYSIS:-
#Grouping sales by productline
select PRODUCTLINE, sum(sales) Revenue
from sales
group by PRODUCTLINE
order by Revenue desc;

#Most ordered productline
select PRODUCTLINE, count(ORDERNUMBER) as odercount
from sales
group by PRODUCTLINE
order by odercount desc;

#grouping sales by year
select YEAR_ID, sum(sales) Revenue
from sales
group by YEAR_ID
order by Revenue desc;

#Checking why the sales is so low on year 2005
select distinct(MONTH_ID)
from sales
where YEAR_ID=2005;           # They have made sales for 5 months only in 2005 

#grouping sales by country
select COUNTRY, sum(sales) Revenue
from sales
group by COUNTRY
order by Revenue desc;

#grouping sales by TERRITORY
select TERRITORY, sum(SALES) Revenue
from sales
group by TERRITORY
order by Revenue desc;

#grouping sales by DEALSIZE
select DEALSIZE, sum(SALES) Revenue
from sales
group by DEALSIZE
order by Revenue desc;

#the best month for sales in a specific year along with order count
select  MONTH_ID, sum(sales) Revenue, count(ORDERNUMBER) Frequency
from sales
where YEAR_ID = 2004   #we can change according to our requirements
group by  MONTH_ID
order by Revenue desc;

#As we found earlier november is the best month so lets check which what are the product that sare sold maximum in november
select  MONTH_ID, PRODUCTLINE, sum(sales) Revenue, count(ORDERNUMBER)
from sales
where YEAR_ID = 2003 and MONTH_ID = 11    #we can change according to our requirements
group by  MONTH_ID, PRODUCTLINE
order by Revenue desc;

#Finding the TotalSales, AvgSAles, OderCount, and the last order date for different customers
select CUSTOMERNAME, 
sum(sales) TotalSales,
avg(sales) AvgSales,
count(ORDERNUMBER) OderCount,
max(ORDERDATE) last_order_date
from sales
group by CUSTOMERNAME
order by AvgSales desc;     #change this according to our requirement

#City with the highest number of sales 
select city, sum(sales) Revenue
from sales
group by city
order by Revenue desc;

#City with the highest number of oder count
select city, count(ORDERNUMBER) OderCount
from sales
group by city
order by OderCount desc;

#Country with the highest sales
select country, sum(sales) Revenue
from sales
group by country
order by Revenue desc;

#Country with the highest number of oder count
select country, count(ORDERNUMBER) OderCount
from sales
group by country
order by OderCount desc;

#best product in each country
select country, YEAR_ID, PRODUCTLINE, sum(sales) Revenue
from sales
where country = 'USA'    #we change according to our requirement
group by  country, YEAR_ID, PRODUCTLINE
order by Revenue desc;

#best product in each city
select city, YEAR_ID, PRODUCTLINE, sum(sales) Revenue
from sales
where city = 'Madrid'    #we change according to our requirement
group by  country, YEAR_ID, PRODUCTLINE
order by Revenue desc;

#sales in each quater
select QTR_ID, sum(sales) as Revenue
from sales
group by QTR_ID
order by Revenue;

#oder count in each quater
select QTR_ID, count(ORDERNUMBER) OderCount
from sales
group by QTR_ID
order by OderCount;


#INSIGTHS:-
# Classic cars is the most selling product
# Classic cars had been ordered the maximum time followed by Vintage cars
# In the year 2004 the maximum sales have been made as they have made sales in all the months
# Also found why the sales of 2005 was lowest because they made sales for only 5 months in 2005
# USA have recorded the highest revenue
# EMEA territory have recorded the highest revenue
# Medium dealsize gave the highest revenue
# In the year 2003 the best month of sales was the month of November
# In the year 2004 the best month of sales was the month of November
# In the year 2005 the best month of sales was the month of MAY
# Classic car was the order that was sold the maximum in the november 2004 with the order count of 105
# Classic car was the order that was sold the maximum in the november 2003 with the order count of 114
# Customer Euro Shoppingchannel have generated the max revenue
# Customer Euro Shoppingchannel also have the max oder count
# Customer Super Scale Inc have the max average sales among all customers
# Madrid is the city with the maximum sales
# Madrid is the city with the maximum oder count
# USA is the country from which maximum revenue has been genearted
# USA is the country from which maximum oder count
# In overall from 2003-2005 the 3rd quater have the maximum sales
# In overall from 2003-2005 the 3rd quater also have the maximum oder count







