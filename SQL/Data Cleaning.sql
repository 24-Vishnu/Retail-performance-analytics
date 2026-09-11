# Data Cleaning – Finding and fixing problems in the dataset so it becomes accurate and ready for analysis.

Original Table
      superstore
            └─────────────►superstore_clean
                                 │
                           We clean this table

TASK 1 - Create a copy of the original table
        mysql> create table superstore_clean as select * from superstore;
                Query OK, 9994 rows affected (9.370 sec)
                Records: 9994 Duplicates: 0 Warnings: 0
                  
TASK 2 - Standardize the Date Format
        mysql> select `order date`,`ship date` from superstore_clean limit 5;
                | order date | ship date  |
                | 11-08-2016 | 11-11-2016 |
                | 11-08-2016 | 11-11-2016 |
                | 10-11-2015 | 10/18/2015 |
                | 10-11-2015 | 10/18/2015 |
                | 06-09-2014 | 6/14/2014  |
                 rows in set (0.009 sec)
        mysql> select `order date` from superstore_clean where `order date` like '13-%';
                Empty set (0.122 sec)
        mysql> select `ship date` from superstore_clean where `order date` like '13-%';
                Empty set (0.148 sec)
                  
        # Change the column data type
        1)	ORDER DATE
                mysql> alter table superstore_clean add column order_date_new DATE;
                        Query OK, 0 rows affected (0.512 sec)
                        Records: 0  Duplicates: 0  Warnings: 0
                mysql>update superstore_clean set order_date_new = case when `order date` like '%/%' then str_to_date(`order date`, '%m/%d/%Y') else str_to_date(`order date`, '%m-%d-%Y')
                        Query OK, 9994 rows affected (8.154 sec)
                        Rows matched: 9994  Changed: 9994  Warnings: 0
                mysql> SELECT `Order Date`, order_date_new from superstore_clean limit 20;
                        20 rows in set (0.010 sec)
        
        2)	SHIP DATE
                mysql> alter table superstore_clean add column ship_date_new date;
                        Query OK, 0 rows affected (2.299 sec)
                        Records: 0  Duplicates: 0  Warnings: 0
                mysql> update superstore_clean set ship_date_new=case when `ship date` like '%/%' then str_to_date(`ship date`,'%m/%d/%Y') else str_to_date(`ship date`,'%m-%d-%Y') end;
                        Query OK, 9994 rows affected (9.808 sec)
                        Rows matched: 9994  Changed: 9994  Warnings: 0
                mysql> select `ship date`,ship_date_new from superstore_clean limit 5;
                        5 rows in set (0.316 sec)
                  
TASK 3 - Remove unnecessary spaces (if any)
        # Check for spaces
        mysql> select distinct category from superstore_clean;
                3 rows in set (0.706 sec)
        mysql> select distinct segment from superstore_clean;
                3 rows in set (0.239 sec)
        mysql> select distinct region from superstore_clean;
                4 rows in set (0.295 sec)
        All values were already clean and consistent, so no trimming operation was required.
                  
TASK 4 - Fix inconsistent values (if needed)
        # Objective: 
        Checked categorical columns for inconsistent spellings, letter case, and naming conventions.
        -	I reviewed the distinct values in important categorical columns such as Category, Segment, and Region. Since all values followed a consistent naming convention, no corrections were required.
                          
TASK 5 - Handle missing values (if required)
        # Objective
        Check whether important columns contain missing NULL values and decide whether any action is required.
        mysql> select count(*) as missing_customer_name from superstore where `customer name` is null;
                1 row in set (0.541 sec)
        mysql> select count(*) as missing_sales from superstore where sales is null;
                1 row in set (0.100 sec)
        mysql> select count(*) as missing_profit from superstore where profit is null;
                1 row in set (0.113 sec)	
        mysql> select count(*) as missing_category from superstore where category is null;
                1 row in set (0.107 sec)
        I verified that the key columns had no missing values, so no further action was needed.
                  
TASK 6 - Verify that the cleaned data is correct
        # Objective
        After cleaning the dataset, we must verify that everything is correct.
        Check 1 - Total Records
              	mysql> select count(*) as total_records from superstore_clean;
                        1 row in set (0.342 sec)
        Check 2 – Verify Date Conversion
              	mysql> select `order date`,order_date_new,`ship date`,ship_date_new from superstore _clean limit 3;
                        3 rows in set (0.011 sec)
        Check 3 – Verify Table Structure
              	mysql> describe superstore_clean;
                        23 rows in set (0.072 sec)
# Conclusion
The dataset was successfully cleaned and verified. It is now ready for exploratory data analysis (EDA).
