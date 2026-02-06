/* 
ZEPTO SQL DATA ANALYSIS PROJECT
AUTHOR : VINAY KUMAR

STEP 1 :- Download Dataset(Start point) First, I downloaded a Zepto product dataset which contains category,product name,MRP,discounts,stock and weight details.
        File :- https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset
STEP 2:- Open Sql Editor(Now open MySql workbench and connect to your local MySql server.)
	    Click :- 1.MySql WorkBench 
				 2.Local instance
				 3.Open Sql Editor
STEP 3:- CREATE DATABASE :- Before storing data, we need a database.
		Query :- CREATE DATABASE ZEPTO_DB;
                 USE ZEPTO_DB;
        Key :- A Database is just a container to store tables not to insert values.
STEP 4:- CREATE TABLE :- Now I'm creating a table structure exactly like the CSV file.(To create table)
	    Query :- create table zepto(
                 z_id int auto_increment primary key,
				 category varchar(100),
				 name varchar(100),
				 discountPercent decimal(10,2),
                 availableQuantity int,
                 discountSellingprice decimal(10,2),
                 weightinGms int,
			     outOfStock varchar(80),
                 Quantity int
				 );
		Key :- Primary key means a unique ID for every product,this is not in dataset you should create it.
STEP 5:-IMPORT CSV DATA :- Now I'm importing the CSV file into MYSQL
						   1.Right click table ZEPTO
                           2.Table Data Import Wizard
                           3.Select Zepto_data.csv
                           4.Next -> Next -> Finish
         Key :- Now our Excel data is converted into SQL data.
STEP 6:- 
	    Query :- SELECT * FROM ZEPTO 
				 LIMIT 10;
STEP 7:- START ANALYSIS
		Key :- First check whether any column containing null values using [CASE]
        Query :- select * from zepto
                 where name is null or
                 category is null or
			     mrp is null or
				 discountpercent is null or 
                 availableQuantity is null or 
                 discountedSellingPrice is null or
                 weightinGms is null or 
				 outOfStock is null or 
                 Quantity is null;
		Query :- To count no.of rows
			     SELECT COUNT(*) FROM ZEPTO;
        Query :- To count total category's in the dataset
				 SELECT COUNT(DISTINCT CATEGORY) FROM ZEPTO;
        Query :- To count total product_name in the dataset
                 SELECT COUNT(DISTINCT NAME) FROM ZEPTO;

STEP 8:- TOP 20 DIFFERENT E-COMMERCE QUESTIONS - SOLVING USING ZEPTO DATASET 

QUESTION 1 :-  Find the number of products available in each category and display the categories in descending order based on product count ?

QUERY :-
       select category,count(*) as Product_count
       from zepto
       group by category 
	   order by product_count desc;
       
QUESTION 2:- Find the top 10 best-selling products based on total quantity sold ?

QUERY :- 
	   select name, sum(quantity) as "Total_sold"
       from zepto
       group by name
       order by Total_sold desc
       limit 10;
       
QUESTION 3 :- List all unique product categories available in the Zepto dataset ?

Query :    
      select distinct category
      from zepto
	  order by category;
      
QUESTION  4 :- Find the number of products that are in stock and outofstock in the zepto dataset ?

Query :-
      select outofstock, count(z_id)
      from zepto
      group by outofstock;

QUESTION 5:- Identify products that appear multiple times in the zepto dataset and show how many times each product is repeated ?

Query :- 
	  select name,count(z_id) as "numberofmultiples"
      from zepto
      group by name
      having count(z_id) > 1
      order by count(z_id) desc;

QUESTION 6 :- Which products have wrong price values like MRP = 0 or Discountedsellingprice = 0 ?

Query :- 
      select * from zepto
      where mrp = 0 or discountedsellingprice = 0;
      
QUESTION 7 :- Remove all products from the zepto dataset where the MRP value is Zero ?
 
Query :-
      delete from zepto
      where mrp = 0;
QUESTION 8:- Find how many products share the same discounted selling price in the zepto dataset ?

Query :- 
      select discountedsellingprice, count(*) 
      from zepto
      group by discountedsellingprice;

QUESTION 9:- Find the top 10 best-value products based on the discount percentage?

Query :- 
      select distinct name,mrp,discountpercent
      from zepto
      order by discountpercent desc
      limit 10;

QUESTION 10:- what are the products with high mrp but Outofstock?

Query :- 
      select distinct name,mrp
      from zepto
      where outofstock = "TRUE" and mrp > 300 
      order by mrp DESC;

QUESTION 11 :- calculate estimated revenue for each category ?

Query :- 
	select category,sum(discountedsellingprice * availableQuantity) as Total_revenue
    from zepto
    group by category
    order by Total_revenue desc;

QUESTION 12 :- Find all products where MRP is greater than 500 and discount is less than 10%

Query :-
	select distinct name,mrp,discountpercent 
    from zepto
    where mrp > 500 and discountpercent < 10
    order by mrp desc, discountPercent desc;

QUESTION 13 :- Identify the top 5 categories offering the highest average discount percentage?

Query :-
     select category,round(avg(discountpercent),2) as avg_discount
     from zepto
     group by category
     order by avg_discount desc
     limit 5; 

QUESTION 14 :- Find the price per gram for products above 100g and sort by best value ? 

Query :-
      select distinct name,weightinGms,discountedsellingprice,
      round(discountedsellingprice/weightinGms,2) as price_per_gram
      from zepto
	  where weightinGms >= 100
      order by price_per_gram;

QUESTION 15 :- Group the products into catergories like low,medium,Bulk based on the WeightinGms ?

Query:-
     select distinct name,category,weightinGms,CASE
     when weightinGms < 1000 then "Low"
     when weightinGms < 5000 then "Medium"
     else "bulk"
     end as "Weight_category"
     from zepto
	 order by WeightinGms desc;

QUESTION 16 :- Which is the Total Inventory Weight Per Category ?

Query:-
     select distinct category,sum(weightinGms * availableQuantity) as total_weight
     from zepto
     group by category
     order by total_weight;

QUESTION 17 :-Find and delete the bad mrp data (like mrp = 0)?  

Query :-
     delete from  zepto   
     where mrp = 0;

QUESTION 18 :- How would you calculate the correct discountedsellingprice using mrp and discountpercent?
 
Query :- 
      select mrp,discountpercent,discountedSellingprice
      from zepto
      where discountedsellingprice = mrp - (mrp * discountpercent / 100);

QUESTION 19:- which category gives the Highest average discount and how would you find it ?

Query :-
      select category,round(avg(discountpercent),2) as avg_discount
      from zepto
      group by category
      order by avg_discount desc
	  limit 1;
 
QUESTION 20:- Identify products that are OutOfStock but still have availableQuantity > 0. What does this indicate?
 
 Query :-
       select count(*) as inconsistent_products
       from zepto
       where outOfStock = "TRUE" and availableQuantity > 0;

STEP 9 :- SAVE THE SQL FILE : Now I'm saving all queries as one project file.
          1.File -> Save Script As
          2.File Name -> Zepto_analysis.sql
          
        * This file can be reused,shared,or uploaded to Github. 

STEP 10 :- PROJECT SUMMARY:
          1.Imported Zepto product data into MySql
          2.Cleaned invalid pricing records
          3.Analyzed discounts, inventory, and category performance
          4.Identified data inconsistencies and pricing patterns.
