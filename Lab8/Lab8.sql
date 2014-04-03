-- Kara Lusabia
-- Lab 8: Normalization Two
-- You have been hired as a database consultant by EON productions to work in the casting department 
-- for the next James Bond Nilm. They need a new Bond because he-who-must-not‐be‐named is clearly not working out. 
-- They want a database of actors, the movies in which they have appeared, and the director of those movies.
------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS directors;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS movie_sales;
DROP TABLE IF EXISTS auditions;

-- People table --
CREATE TABLE people (
  pid		char(2) not null,
  last_name	text,
  first_name	text,
  home_address	text,				
 primary key(pid)
);

-- Actors table --
CREATE TABLE actors (
  actor_id	char(2) not null,
  birthday	date not null,
  hair_color	text,
  eye_color	text,
  height_inch	decimal(4,2),
  weight_lbs	decimal(4,1),
  guild_date	date,
 primary key(actor_id)
);

-- Directors table --
CREATE TABLE directors (
  dir_id	char(2) not null,
  school_attend	text,
  guild_date	date,
 primary key(dir_id)
);

-- Movies table --
CREATE TABLE movies (
  movie_id	char(3) not null,
  movie_name	text,
  year_rel	char(4),
 primary key(movie_id)
);

-- Movie_Sales table --
CREATE TABLE movie_sales (
  movie_id	  char(3) not null references movies(movie_id),
  dom_sales_USD	  integer,
  for_sales_USD	  integer,
  disk_sales_USD  integer,
 primary key(movie_id)
);

-- Auditions table --
CREATE TABLE auditions (
  actor_id	char(2) not null references actors(actor_id),
  dir_id	char(2) not null references directors(dir_id),
  movie_id	char(4) not null references movies(movie_id),
 primary key(actor_id, dir_id)
);


-- SQL statements for loading data in the database of EON Productions

-- People --
INSERT INTO people(pid, last_name, first_name, home_address)
	    VALUES(1, 'LaBeouf', 'Shia', '72 Chestnut Road Suite 9');

INSERT INTO people(pid, last_name, first_name, home_address)
	    VALUES(2, 'Hanks', 'Tom', '26 Greenhills Avenue');

INSERT INTO people(pid, last_name, first_name, home_address)
	   VALUES (3, 'Connery', 'Sean', '104 Orchard Lane');
	   
INSERT INTO people(pid, last_name, first_name, home_address)
	   VALUES (4, 'Norrington', 'Stephen', '19 Sunset Boulevard');

INSERT INTO people(pid, last_name, first_name, home_address)
	   VALUES (5, 'Bay', 'Michael', '113 Madison Avenue'); 

INSERT INTO people(pid, last_name, first_name, home_address)
	   VALUES (6, 'Chechik', 'Jeremiah', '30 Wolfe Drive');

-- Actors --
INSERT INTO actors (actor_id, birthday, hair_color, eye_color, height_inch, weight_lbs, guild_date)
	     VALUES(1, '06-11-1986', 'black', 'hazel', 67.20, 130.0, '05-20-2010'); 
	     
INSERT INTO actors (actor_id, birthday, hair_color, eye_color, height_inch, weight_lbs, guild_date)
	     VALUES(2, '07-09-1956', 'light brown', 'brown', 68.40, 159.0, '06-14-1995');
	     
INSERT INTO actors (actor_id, birthday, hair_color, eye_color, height_inch, weight_lbs, guild_date)
	     VALUES(3, '08-25-1930', 'black', 'brown', 68.70, 152.5, '04-28-1983'); 

-- Directors --
INSERT INTO directors (dir_id, school_attend, guild_date)
		VALUES(1, 'University of Santa Barbara', '07-13-2012');
		
INSERT INTO directors (dir_id, school_attend, guild_date)
		VALUES(2, 'Chabot College', '06-21-1995');
		
INSERT INTO directors (dir_id, school_attend, guild_date)
		VALUES(4, 'University of Cambridge', '02-25-1990');

INSERT INTO directors (dir_id, school_attend, guild_date)
		VALUES(5, 'Wesleyan University', '05-18-2011'); 
		
INSERT INTO directors (dir_id, school_attend, guild_date)
		VALUES(6, 'McGill University', '06-23-2000');		

-- Movies --
INSERT INTO movies(movie_id, movie_name, year_rel)
	    VALUES(101, 'Transformers: Dark of the Moon', 2011);	-- shia and bay
	    
INSERT INTO movies(movie_id, movie_name, year_rel)
	    VALUES(102, 'Larry Crowne', 2011);		-- hanks act direct
	    
INSERT INTO movies(movie_id, movie_name, year_rel)
	    VALUES(103, 'The League of Extraordinary Gentlemen', 2003);	-- connery & norrington
	    
INSERT INTO movies(movie_id, movie_name, year_rel)
	    VALUES(104, 'The Avengers', 1998);	-- connery and chechik

-- Movie Sales --
INSERT INTO movie_sales(movie_id, dom_sales_USD, for_sales_USD, disk_sales_USD)
		 VALUES(101, 352390543, 771403533, 48491274);

INSERT INTO movie_sales(movie_id, dom_sales_USD, for_sales_USD, disk_sales_USD)
		 VALUES(102, 35608245, 25840890, 6829361);
	   
INSERT INTO movie_sales(movie_id, dom_sales_USD, for_sales_USD, disk_sales_USD)
		 VALUES(103, 66465204, 112800000, 36400000);
	   
INSERT INTO movie_sales(movie_id, dom_sales_USD, for_sales_USD, disk_sales_USD)
		 VALUES(104, 23385416, 25200000, 42596350);

-- Auditions --
INSERT INTO auditions(actor_id, dir_id, movie_id)
	       VALUES(1, 5, 101);

INSERT INTO auditions(actor_id, dir_id, movie_id)
	       VALUES(2, 2, 102);

INSERT INTO auditions(actor_id, dir_id, movie_id)
	       VALUES(3, 4, 103);

INSERT INTO auditions(actor_id, dir_id, movie_id)
	       VALUES(3, 6, 104);

-- 5. Write a SQL query to return all the directors with whom actor “Sean Connery” has worked.
select people.first_name as "dir_firstName", people.last_name as "dir_lastName"
from auditions left outer join people
on people.pid = auditions.dir_id
where auditions.actor_id = '3'
order by people.last_name;