create database primeor;
use primeor;
create table sales (
	order_id varchar(50),
    order_date varchar(20),
	ship_mode varchar(100),
	customer_name varchar(100),
	segment varchar(100),
	state varchar(100),
	country varchar(100),
	market	varchar(50),
	region	varchar(50),
    product varchar(100),
	product_id	varchar(100),
	category varchar(50),
	sub_category varchar(50),
	sales int,
	quantity int,
	discount decimal(10,2),
	profit decimal(10,2),
	shipping_cost decimal(10,2),
	order_priority varchar(50),
	year int,
	order_month varchar(20)
    );
           
select sum(sales) as total_sales from sales;

-- Top 10 profitable products 

select  product, sum(profit) as total_profit 
		from sales
		group by product 
		order by total_profit desc  limit 10 ;

-- Top 10 customers by sales

select customer_name , sum(sales) as total_sale
		from sales 
		group by customer_name
        order by total_sale desc limit 10;


-- Region-wise total sales

select  region , sum(sales) as total_sales
		from sales
		group by region
        order by total_sales desc; 


-- Category-wise average profit

select category , avg(profit) as avg_profit 
		from sales
        group by category;.
        


-- Highest discount category

select category , avg(discount) as highest_discount
		from sales
        group by category
        order by highest_discount desc limit 1;


-- Orders with negative profit

select order_id , product, profit 
		from sales 
        where profit < 0
        order by profit asc;


-- Monthly sales trend

select year, order_month,sum(sales) as total_sales
		from sales
        group by year , order_month
        order by year , monthname(order_month);
         

-- Market-wise revenue analysis

select market , sum(sales) as total_revenue
		from sales
        group by market
        order by total_revenue desc;


-- Top-performing sub-categories

select sub_category, sum(sales) as total_sales
		from sales
        group by sub_category
        order by total_sales desc;


-- Ship mode usage analysis

select ship_mode , count(ship_mode)
		from sales
        group by ship_mode;
           



/* 
	#--insights--#
    
	• APAC generates 3581785 revenue which is highest in the all markets.
	• office supplies category is  least profitable  category with 16.572473 avg profit.
	• Standard Class shipping mode is most commonly used to ship orders.
    • Cisco Smart Phone is the most profit making product in the list and then Canon imageCLASS 2200 Advanced Copier comes on second place.
    • central region and south region are on top of the list in terms of region_wise sales.
*/
    
    