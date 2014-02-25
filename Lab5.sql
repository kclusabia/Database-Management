-- Kara Lusabia
-- Due Date: 2/21/14
-- Lab 5: SQL Queries - The Three-quel

-- 1. Get the cities of agents booking an order for customer “Basics”. This time use joins; no subqueries.
select agents.city AS "city_agent"	
from customers,
     orders,
     agents
where customers.cid=orders.cid
AND agents.aid = orders.aid
AND customers.name = 'Basics'
order by agents.city asc;

-- 2. Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto. 
--    Use joins this time; no subqueries.
select distinct orders.pid
from orders,
     customers,
     agents
where orders.aid = agents.aid 
and customers.cid=orders.cid
and customers.city='Kyoto'
order by orders.pid asc;

-- 3. Get the names of customers who have never placed an order. Use a subquery.
select name AS "customer_name"
from customers
where customers.cid NOT IN (select cid
			    from orders)
order by name asc;

-- 4. Get the names of customers who have never placed an order. Use an outer join.
select customers.name AS "customer_name"
from customers LEFT OUTER JOIN orders
on customers.cid = orders.cid
where orders.cid is null
order by customers.name asc;

-- 5. Get the names of customers who placed at least one order through an agent in their city, along with those agent(s’) names.
select c.name AS "customer_name", a.name AS "agent_name", c.city		-- do not make distinct; could have same name and diff
from customers AS c,								-- agent name.
     agents AS a,
     orders AS o
where c.cid = o.cid
AND a.aid = o.aid
AND c.city = a.city
order by c.name asc;

-- 6. Get the names of customers and agents in the same city, along with the name of the city, regardless of whether or not 
--    the customer has ever placed an order with that agent.
select c.name AS "customer_name", a.name AS "agent_name", c.city
from customers AS c,
     agents AS a
where c.city = a.city
order by c.name asc;

-- 7. Get the name and city of customers who live in the city where the least number of products are made.
select city, sum(quantity) as "sum_prod_qty"	-- answer; add customer's city
from products
group by city
order by sum_prod_qty asc
limit 1	