Data Quality Assessment
# Objective
  To assess the quality of the retail sales dataset before performing data cleaning and analysis. This step ensures that the dataset is complete, accurate, and suitable for business analysis.
    
1)	Total Records
    mysql> use superstore_db;
            Database changed
    mysql> select count(*) as total_records from superstore;
            total_records 
                      9994 
            1 row in set (0.051 sec)
              
2)	View Sample Data
    mysql> select * from superstore limit 5;
            5 rows in set (0.012 sec)
              
3)	Check Table Structure
    mysql> describe superstore;
            21 rows in set (0.034 sec)
              
4)	Check Missing Values
    mysql> select count(*) as missing_customer_name from superstore where 'Customer Name' is null;
            1 row in set (0.009 sec)
    mysql> select count(*) as missing_sales from superstore where 'Sales' is null;
            1 row in set (0.007 sec)
    mysql> select count(*) as missing_profit from superstore where 'profit' is null;
            1 row in set (0.008 sec)
    mysql> select count(*) as missing_category from superstore where 'category' is null;
            1 row in set (0.007 sec)
              
5)	Check Duplicate Records
    mysql> select 'Order ID', count(*) as duplicate_count from superstore group by 'Order ID' having count(*) > 1;
            2471 rows in set (1.152 sec)
              
6)	Verify Data Consistency
    mysql> select * from superstore where sales<0;
            Empty set (0.314 sec)
    mysql> select * from superstore where quantity<=0;
            Empty set (0.235 sec)
    mysql> select * from superstore where discount<0 or discount>1;
            Empty set (0.235 sec)



