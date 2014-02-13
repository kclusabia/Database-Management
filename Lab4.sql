-- Kara Lusabia
-- Due Date: 2/14
-- Lab 4: SQL Queries-The Sequel

-- 1. Get the cities of agents booking an order for customer “Basics”.
select city
from agents
where aid in (select aid
	      from orders
	      where cid in (select cid		-- use in instead of = to make sure other cid's with customer Basics are included
			    from customers
			    where name = 'Basics'))
order by city asc;

-- 2. Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto.
--    (This is not the same as asking for pids of products ordered by a customer in Kyoto.)
select distinct pid
from orders
where aid in (select aid
	      from orders
	      where cid in (select cid
			    from customers
			    where city = 'Kyoto'))
order by pid;
-----DO NOT DO THIS!-----
select pid
from orders
where cid in (select cid
from customers
where city = 'Kyoto')
-------------------------

-- 3. Find the cids and names of customers who never placed an order through agent a03.
select cid, name
from customers
where cid in (select cid
	      from orders
	      where aid <> 'a03')
order by cid;

-- 4. EDIT Get the cids and names of customers who ordered both product p01 and p07.
select cid, name
from customers
where cid in (select cid
	      from orders
	      where pid = 'p07')
and cid in (select cid
	    from orders
	    where pid = 'p01')
order by cid;

-- 5. Get the pids of products ordered by any customers who ever placed an order through agent a03.
select distinct pid
from orders
where aid = 'a03'
order by pid;

-- 6. Get the names and discounts of all customers who place orders through agents in Dallas or Duluth.
select name, discount
from customers
where cid in (select cid
	      from orders
	      where aid in (select aid
			    from agents
			    where city in ('Dallas', 'Duluth')))
order by name;

-- 7. Find all customers who have the same discount as that of any customers in Dallas or Kyoto.
select name, discount
from customers
where discount in (select discount
		   from customers
		   where city in ('Dallas', 'Kyoto'))
order by name;