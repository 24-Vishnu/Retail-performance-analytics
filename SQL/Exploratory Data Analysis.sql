# Exploratory Data Analysis (EDA)
Here we start finding business insights.
  
1.  How much money did we make from sales?
      mysql> select round(sum(sales),2) as total_sales from superstore_clean;
              2297200.86
              1 row in set (0.207 sec)
                
2.  How much profit did we make?
      mysql> select round(sum(profit),2) as total_profits from superstore_Clean;
              286397.02
              1 row in set (0.119 sec)
                
3.  How many orders did we receive?
      mysql> select count(distinct `order ID`) as total_orders from superstore_clean;
              5009 
              1 row in set (0.584 sec)
                
4.  Which category has the highest sales
      mysql> select category,round(sum(sales),2) as total_sales from superstore_clean group by category order by total_sales desc;
      	      category		total_sales
              Technology		836154.03 
              Furniture		741999.8 
              Office Supplies	719047.03 
              3 rows in set (0.649 sec)
                
5.  Which category gives us the highest profit?
      mysql> select category,round(sum(profit),2) as total_profit from superstore_clean group by category order by total_profit desc;
              category		total_profit
              Technology		145454.95
              Office Supplies	122490.8 
              Furniture		18451.27 
              3 rows in set (0.325 sec)
                
6.  Which are our top 5 products by sales?
      mysql> select `product name`,round(Sum(sales),2) as total_sales from superstore_clean group by `product name` order by total_sales desc limit 5;
              5 rows in set (0.744 sec)
                
7.  Which are our top 3 customers?
      mysql> select `customer name`,round(sum(sales),2) as total_sales from superstore_clean group by `customer name` order by total_sales desc limit 3;
              customer name	total_sales 
              Sean Miller		25043.05 
              Tamara Chand		19052.22 
              Raymond Buch	15117.34 
              3 rows in set (0.351 sec)
                
8.  Which region has the highest sales?
      mysql> select region,round(sum(sales),2) as total_sales from superstore_clean group by region order by total_sales desc;
              region		total_sales 
              West		725457.82 
              East		678781.24 
              Central		501239.89 
              South		391721.91 
              4 rows in set (0.297 sec)
                
9.  Which year had the highest sales?
      mysql> select year(`order date`) as year,round(sum(sales),2) as total_sales from superstore_clean group by year(`order date`) order by total_sales desc;
              year	total_sales
              2017	733215.26
              2016	609205.6 
              2014	484247.5 
              2015	470532.51
              4	rows in set (0.415 sec)
                
10.  Does discount affect profit?
      mysql> select discount,round(sum(profit),2) as total_profit from superstore_clean group by discount order by discount;
              12 rows in set (0.194 sec)
