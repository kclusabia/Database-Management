-- Kara Lusabia
-- Lab 3: Getting Started with SQL Queries 
-- Due Date: 2/7/14

-- 1. List the name and city of agents named Smith.
select name, city
from agents
where name = 'Smith'

-- 2. List pid, name, and quantity of products costing more than US$1.25.
select pid, name, quantity
from products
where priceUSD > 1.25

-- 3. List the ordno and aid of all orders.
select ordno, aid
from orders

-- 4. List the names and cities of customers in Dallas.
select name, city
from customers
where city = 'Dallas'

-- 5. List the names of agents not in New York and not in Newark.
select name
from agents
where city <> 'New York'
AND city <> 'Newark'

-- 6. List all data for products not in New York or Newark that cost US$1 or more.
select *
from products
where city NOT IN ('New York', 'Newark')
AND priceUSD >= 1.00

-- 7. List all data for orders in January or March.
select *
from orders
where mon = 'jan' OR mon = 'mar'

-- 8. List all data for orders in February less than US$100.
select *
from orders
where mon = 'feb'
AND dollars < 100

-- 9. List all orders from the customer whose cid is C001.
select ordno
from orders
where cid = 'c001'