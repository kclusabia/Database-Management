-- Kara Lusabia
-- Lab 9: To further develop your facility with the art and science of normalization. You’ve been hired by NASA.
-- Design and document with a fully annotated ER diagram, then build, a relational database for NASA using the following data.
-- You may create primary keys for strong entities.

DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS engineers;
DROP TABLE IF EXISTS astronauts;
DROP TABLE IF EXISTS fc_operators;
DROP TABLE IF EXISTS spacecrafts;
DROP TABLE IF EXISTS crews;
DROP TABLE IF EXISTS systems;
DROP TABLE IF EXISTS sys_crafts;
DROP TABLE IF EXISTS parts;
DROP TABLE IF EXISTS sys_parts;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS catalogs;

-- People --
CREATE TABLE people (
  pid		char(4) not null,
  last_name	text,
  first_name	text,
  current_age	integer,
 primary key(pid)
);
INSERT INTO people (pid, last_name, first_name, current_age)
  VALUES('p100', 'Murrano', 'Charlie', 33);
INSERT INTO people (pid, last_name, first_name, current_age)
  VALUES('p101', 'Cooper', 'Shay', 28);
INSERT INTO people (pid, last_name, first_name, current_age)
  VALUES('p102', 'Smith', 'Greg', 40);
INSERT INTO people (pid, last_name, first_name, current_age)
  VALUES('p103', 'Johnson', 'Alexis', 28);
INSERT INTO people (pid, last_name, first_name, current_age)
  VALUES('p104', 'Miller', 'Ronnie', 30);
INSERT INTO people (pid, last_name, first_name, current_age)
  VALUES('p105', 'Forman', 'John', 35);

-- Engineers --
CREATE TABLE engineers (
  pid		char(4) not null references people(pid),
  highest_deg	text,
  fav_vid_game	text,
 primary key(pid)
);
INSERT INTO engineers (pid, highest_deg, fav_vid_game)
  VALUES('p102', 'MS in Engineering', 'Super Mario Bros.');
INSERT INTO engineers (pid, highest_deg, fav_vid_game)
  VALUES('p104', 'BS in Engineering', 'Need for Speed');
INSERT INTO engineers (pid, highest_deg, fav_vid_game)
  VALUES('p105', 'MS in Aeronautics', 'Halo');

-- Astronauts --
CREATE TABLE astronauts (
  pid		char(4) not null references people(pid),
  yrs_of_fly	real,
  golf_handi	integer,
 primary key(pid)
);
INSERT INTO astronauts (pid, yrs_of_fly, golf_handi)
  VALUES('p100', 4, 03);
INSERT INTO astronauts (pid, yrs_of_fly, golf_handi)
  VALUES('p101', 2, 17);
INSERT INTO astronauts (pid, yrs_of_fly, golf_handi)
  VALUES('p103', 1.5, 14);
INSERT INTO astronauts (pid, yrs_of_fly, golf_handi)
  VALUES('p105', 5, 08);

-- Flight Control Operators --
CREATE TABLE fc_operators (
  pid		char(4) not null references people(pid),
  chair_pref	char(2),
  fav_drink	text,
 primary key(pid)
);
INSERT INTO fc_operators (pid, chair_pref, fav_drink)
  VALUES('p100', 'B2', 'Gatorade');
INSERT INTO fc_operators (pid, chair_pref, fav_drink)
  VALUES('p101', 'A1', 'Monster');
INSERT INTO fc_operators (pid, chair_pref, fav_drink)
  VALUES('p102', 'A2', 'Lipton Iced Tea');
INSERT INTO fc_operators (pid, chair_pref, fav_drink)
  VALUES('p104', 'B1', 'Starbucks');

-- Spacecrafts --
CREATE TABLE spacecrafts (
  tail_num	char(5) not null,
  craft_name	text,
  weight_tons	real,
  fuel_type	text,
  crew_cap	integer,
 primary key(tail_num)
);
INSERT INTO spacecrafts (tail_num, craft_name, weight_tons, fuel_type, crew_cap)
  VALUES('B71F3', 'Explorer', 50, 'BC', 10);
INSERT INTO spacecrafts (tail_num, craft_name, weight_tons, fuel_type, crew_cap)
  VALUES('M52A9', 'Moonraker', 80, 'AD', 20);
INSERT INTO spacecrafts (tail_num, craft_name, weight_tons, fuel_type, crew_cap)
  VALUES('J41K8', 'Orion III', 75, 'CC', 12);

-- Crews --
CREATE TABLE crews (
  pid		char(4) not null references astronauts(pid),
  tail_num	char(5) not null references spacecrafts(tail_num),
 primary key (pid, tail_num)
 );
INSERT INTO crews (pid, tail_num)
  VALUES('p100', 'M52A9');
INSERT INTO crews (pid, tail_num)
  VALUES('p101', 'M52A9');
INSERT INTO crews (pid, tail_num)
  VALUES('p103', 'B71F3');
INSERT INTO crews (pid, tail_num)
  VALUES('p105', 'B71F3');

-- Systems --
CREATE TABLE systems (
  sys_name	text not null,
  sys_descr	text,
 primary key(sys_name)
);
INSERT INTO systems (sys_name, sys_descr)
  VALUES('Sys1', 'Main system');
INSERT INTO systems (sys_name, sys_descr)
  VALUES('Sys2', 'Sub-system');

-- Systems and Spacecrafts
CREATE TABLE sys_crafts (
  tail_num	text not null references spacecrafts(tail_num),
  sys_name	text not null references systems(sys_name),
 primary key(tail_num, sys_name)
);
INSERT INTO sys_crafts (tail_num, sys_name)
  VALUES('B71F3', 'Sys1');
INSERT INTO sys_crafts (tail_num, sys_name)
  VALUES('M52A9','Sys1');
INSERT INTO sys_crafts (tail_num, sys_name)
  VALUES('J41K8', 'Sys2');
INSERT INTO sys_crafts (tail_num, sys_name)
  VALUES('B71F3', 'Sys2');

-- Parts --
CREATE TABLE parts (
  parts_name	text not null,
  parts_descr	text,
 primary key(parts_name)
);
INSERT INTO parts (parts_name, parts_descr)
  VALUES('Engine', 'Front-end');
INSERT INTO parts (parts_name, parts_descr)
  VALUES('Transmitter', 'Middle-end');
INSERT INTO parts (parts_name, parts_descr)
  VALUES('Propellant', 'Back-end');

-- Systems and Parts
CREATE TABLE sys_parts (
  sys_name	text not null references systems(sys_name),
  parts_name	text not null references parts(parts_name),
 primary key(sys_name, parts_name)
);
INSERT INTO sys_parts (sys_name, parts_name)
  VALUES('Sys1', 'Engine');
INSERT INTO sys_parts (sys_name, parts_name)
  VALUES('Sys1', 'Transmitter');
INSERT INTO sys_parts (sys_name, parts_name)
  VALUES('Sys1', 'Propellant');
INSERT INTO sys_parts (sys_name, parts_name)
  VALUES('Sys2', 'Engine');
INSERT INTO sys_parts (sys_name, parts_name)
  VALUES('Sys2', 'Transmitter');

-- Suppliers --
CREATE TABLE suppliers (
  sid		char(4) not null,
  comp_name	text,
  addr		text,
  pay_terms	text check (pay_terms = 'daily' or pay_terms = 'weekly' or pay_terms = 'monthly' or
			    pay_terms = 'yearly' or pay_terms = 'bi-yearly'),
 primary key(sid)
);
INSERT INTO suppliers (sid, comp_name, addr, pay_terms)
  VALUES('s100', 'company100', 'addr100', 'monthly');
INSERT INTO suppliers (sid, comp_name, addr, pay_terms)
  VALUES('s101', 'company101', 'addr101', 'yearly');
INSERT INTO suppliers (sid, comp_name, addr, pay_terms)
  VALUES('s102', 'company102', 'addr102', 'weekly');
 INSERT INTO suppliers (sid, comp_name, addr, pay_terms)
  VALUES('s103', 'company103', 'addr103', 'yearly');

-- Catalogs --
CREATE TABLE catalogs (
  sid		char(4) not null references suppliers(sid),
  parts_name	text references parts(parts_name),
  sys_name	text references systems(sys_name),
 primary key(sid, parts_name, sys_name)
);
INSERT INTO catalogs (sid, parts_name, sys_name)
  VALUES('s100', 'Engine', 'Sys1');
INSERT INTO catalogs (sid, parts_name, sys_name)
  VALUES('s100', 'Engine', 'Sys2');
INSERT INTO catalogs (sid, parts_name, sys_name)
  VALUES('s101', 'Transmitter', 'Sys1');
INSERT INTO catalogs (sid, parts_name, sys_name)
  VALUES('s101', 'Propellant', 'Sys1');
INSERT INTO catalogs (sid, parts_name, sys_name)
  VALUES('s102', 'Propellant', 'Sys2');


-- Test Queries --

-- 1. Determines the systems and the parts within those systems a spacecraft with a tail_num of B71F3 has.
select sys_crafts.tail_num, sys_parts.sys_name, sys_parts.parts_name
from sys_crafts, sys_parts 
where sys_crafts.sys_name = sys_parts.sys_name
and sys_crafts.tail_num = 'B71F3';

-- 2. Determines the engineers using left outer join
select people.first_name, people.last_name
from engineers LEFT OUTER JOIN people
on people.pid = engineers.pid

-- 3. States which company sells propellant for Sys1.
select catalogs.parts_name, suppliers.comp_name
from catalogs, suppliers
where catalogs.sid = suppliers.sid
and catalogs.parts_name = 'Propellant'
and catalogs.sys_name = 'Sys1'