CREATE DATABASE IF NOT EXISTS apple_sales;  /* as apple sales databse already exist*/
USE apple_sales;
SHOW TABLES;
/* apple retail sales project-1M sales datasets */

/*first we see the rows of all the table*/
SELECT * FROM category;
SELECT * FROM products;
SELECT * FROM  sales;
SELECT * FROM  stores;
SELECT * FROM  warranty;

/*now we are going to see different types of repair status in th ewarranty table */
SELECT DISTINCT repair_status FROM warranty;
/* now we are going to count the sales data set */
SELECT COUNT(*) FROM sales;

/* now we will see that in sales table sales are there with same produuct id */
select *from sales where product_id="p-57";
/* now we will do indexing to the product_id taki similar na ho jaye */
CREATE INDEX sales_product_id ON sales(product_id(20));


select *from sales where store_id="ST-14";
/*ab ham store_id ki indexing karne jaa rhe hai */

CREATE INDEX sales_store_id ON sales(store_id(20)) ;


/*****************BUSINESS PROBLEM*********************************/
/*Ques 1)FInd the number of stores in each country */
SELECT country,count(Store_Name)
FROM stores
group by country;

/*Ques 2)calculate the total number of units sold by each store */
SELECT store_id, SUM(quantity) 
FROM sales
GROUP BY store_id;

/*ques 3 -identify how many sales occured in december 2023*/
SELECT COUNT(sale_id) 
FROM sales
where sale_date BETWEEN 01-12-2023 AND 31-12-2023;

/*ques 4-determine how many stores have never had a warranty claim filed */
select *
from sales as s 
right join warranty as w
on s.sale_id=w.sale_id;

select distinct store_id
from sales as s 
right join warranty as w
on s.sale_id=w.sale_id;


/*ques 5-calculate the percentage of warranty claims marked as "pending" */
/*percnetage formula =(number of claim that as pending/total repair_status)*100*/

select distinct repair_status from warranty;

/* step 1-first find the number of repair status who are pending and the answer is 65 */
select count(*) from warranty 
where repair_status="pending";

/* step 2- now find the total number of repair status and the answ4r is 226*/
select count(*) from warranty; 

/* step 3 -now write it all together and multiply by 100 */
select count(*)/ (select count(*) from warranty)*100
from warranty 
where repair_status="pending";

/*if you want the answer in round off 2 values  then use round function*/
select round( count(*)/ (select count(*) from warranty)*100,2)
from warranty 
where repair_status="pending";

/*ques 6-identify which store had the highest total units sold in the last year i.e 2024 */ 
select store_id from sales
where sale_date  between '01-01-2024' and '31-12-2024';/* sale id me date ki jo data type hai vo DATE data type ki hai to hamne dates ko ' ' ke andar rakha hai */
/* abhi ye hamne check kiy a tha ki kun se year tak ke liye hai data ...now solution --------------*/

select store_id, sum(quantity)
from sales 
where sale_date  between '01-01-2024' and '31-12-2024'
group by store_id
order by sum(quantity) desc
limit 1;

/* ques 7-count the number of unique products sold in the last year */
SELECT count( Distinct product_id) as unique_product
from sales
where sale_date  between '01-01-2024' and '31-12-2024';

/*ques 8-find the average price of products in each category */
SELECT Category_ID, round(avg(Price),2)
FROM products
group by  Category_ID;

/*ques-9 how many warranty claims were filed in 2020*/

select count(claim_id)
from warranty
where YEAR(claim_date)=2020;

/*ques-10 for each store find out the best selling day based on the highest quantity sold*/
/* to hame store_id chahiye ,day name chahiye ki us tarik ko kaun sa dya rhega,and sum(quantity) chahiye----so for this first add another column 
named as day_name that represents the day of a particular date */

select *,TO_CHAR(sale_date,'day_name')
from sales;
DESC sales;


