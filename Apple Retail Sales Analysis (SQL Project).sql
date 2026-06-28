CREATE DATABASE IF NOT EXISTS apple_sales;  /* as apple sales databse already exist*/
USE apple_sales;

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
/*ab ham store_id ki indexing karne jaa rhe hai /*/
CREATE INDEX sales_store_id ON sales(store_id(20)) ;


/*****************BUSINESS PROBLEM*********************************/

