-- Kara Lusabia
-- Due Date: 2/28
-- Lab 6: Really Interesting Queries 

-- 1. Get the name and city of customers who live in a city where the most number of products are made.
select products.city, customers.name
from products left outer join customers
on products.city=customers.city
group by products.city, customers.name
order by count(products.name) desc
limit 2;

-- 2. Get the name and city of customers who live in any city where the most number of products are made.
select products.city, customers.name, (coalesce (customers.name, 'null'))
from products left outer join customers
on products.city=customers.city
group by products.city, customers.name
order by count(products.name) desc
limit 3;

-- 3. List the products whose priceUSD is above the average priceUSD.
select name as "prod_name"
from products
where priceUSD > (select avg(priceUSD)
from products)
order by prod_name asc;

-- 4. Show the customer name, pid ordered, and the dollars for all customer orders, sorted by dollars from high to low.
select customers.name, orders.pid, orders.dollars
from customers,
     orders
where customers.cid = orders.cid
order by orders.dollars desc;

-- 5. Show all customer names (in order) and their total ordered, and nothing more. Use coalesce to avoid showing NULLs.
select customers.name, (coalesce (sum(orders.qty), 0) )		--was confused whether total was dollars or quantity
from customers LEFT OUTER JOIN orders					--Quantity 
on customers.cid=orders.cid
group by customers.name

select customers.name, (coalesce (sum(orders.dollars), 0) )		--Dollars
from customers LEFT OUTER JOIN orders
on customers.cid=orders.cid
group by customers.name

-- 6. Show the names of all customers who bought products from agents based in New York along with the names of the products 
--    they ordered, and the names of the agents who sold it to them.
select customers.name as "cust_name", agents.name as "agent_name", products.name "prod_name"
from customers,
     agents,
     orders,
     products
where customers.cid=orders.cid
and agents.aid=orders.aid
and orders.pid=products.pid
and agents.city = 'New York'
order by cust_name asc;

-- 7. Write a query to check the accuracy of the dollars column in the Orders table. This means calculating Orders.dollars from 
--    other data in other tables and then comparing those values to the values in Orders.dollars.
create view calc_dollars
as
select customers.discount as "cust_discount", agents.percent as "agents_per", orders.qty as "ord_qty", 
       orders.dollars as "ord_dollars", products.priceUSD as "prod_price"
from customers, agents, orders, products
where customers.cid=orders.cid
and agents.aid=orders.aid
and products.pid=orders.pid

--select sum (subq.multiplied_col)
--from (select orders.qty * products.priceUSD as multiplied_col
--from calc_dollars)
--as subq
--from (select orders.qty) as "ord_qty", products.priceUSD, (orders.qty * products.priceUSD)
--from calc_dollars)

select *
from calc_dollars

drop view calc_dollars