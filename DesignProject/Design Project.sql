-- Kara Lusabia
-- Design Project
-- Due Date: 4/25/2015
-- Port Codd Palace

drop table customers;
drop table accommodations;
drop table room_type;
drop table accom_and_room;
drop table accommodation_payments;
drop table accom_all_cust;
drop table restaurants;
drop table restaurant_reservations;
drop table activities;
drop table act_with_lessons;
drop table activity_payments;
drop table appointments;

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
  cust_ID	char(7) not null,
  first_name	text,
  last_name	text,
  curr_age	integer,
  phone_num	text,
  arrival_date	date,
  depart_date	date,
 primary key(cust_ID)
);
INSERT INTO customers (cust_ID, first_name, last_name, curr_age, phone_num, arrival_date, depart_date)
  VALUES('AB20000', 'Alexis', 'Davis', 24, '917-083-6882', '03-23-2012', '03-25-2012');
INSERT INTO customers (cust_ID, first_name, last_name, curr_age, phone_num, arrival_date, depart_date)
  VALUES('AB20001', 'Alley', 'Davis', 22, '917-759-2551', '03-23-2012', '03-25-2012');
------
INSERT INTO customers (cust_ID, first_name, last_name, curr_age, phone_num, arrival_date, depart_date)
  VALUES('AB20002', 'John', 'Smith', 36, '845-892-1398', '03-23-2014', '03-28-2014');
INSERT INTO customers (cust_ID, first_name, last_name, curr_age, phone_num, arrival_date, depart_date)
  VALUES('AB20003', 'Leslie', 'Smith', 35, '845-231-6393', '03-23-2014', '03-28-2014');
INSERT INTO customers (cust_ID, first_name, last_name, curr_age, phone_num, arrival_date, depart_date)
  VALUES('AB20004', 'Cassandra', 'Smith', 12, '845-231-6393', '03-23-2014', '03-28-2014');
INSERT INTO customers (cust_ID, first_name, last_name, curr_age, phone_num, arrival_date, depart_date)
  VALUES('AB20005', 'Logan', 'Smith', 14, '845-231-6393', '03-23-2014', '03-28-2014');
---- 
INSERT INTO customers (cust_ID, first_name, last_name, curr_age, phone_num, arrival_date, depart_date)
  VALUES('AB20006', 'Derek', 'Anderson', 25, '845-239-2144', '07-04-2013', '07-07-2013');
INSERT INTO customers (cust_ID, first_name, last_name, curr_age, phone_num, arrival_date, depart_date)
  VALUES('AB20007', 'Katie', 'Ford', 26, '845-237-9030', '07-04-2013', '07-07-2013');
----  
INSERT INTO customers (cust_ID, first_name, last_name, curr_age, phone_num, arrival_date, depart_date)
  VALUES('AB20008', 'Thomas', 'Stone', 27, '922-421-5569', '04-12-2014', '04-16-2014');
INSERT INTO customers (cust_ID, first_name, last_name, curr_age, phone_num, arrival_date, depart_date)
  VALUES('AB20009', 'Alvin', 'Norris', 24, '922-750-2190', '04-12-2014', '04-14-2014');
INSERT INTO customers (cust_ID, first_name, last_name, curr_age, phone_num, arrival_date, depart_date)
  VALUES('AB20010', 'Sam', 'Norris', 24, '922-671-2330', '04-12-2014', '04-16-2014');
----
INSERT INTO customers (cust_ID, first_name, last_name, curr_age, phone_num, arrival_date, depart_date)
  VALUES('AB20011', 'Cheska', 'Lopez', 20, '522-659-2757', '06-04-2014', '06-04-2014');
INSERT INTO customers (cust_ID, first_name, last_name, curr_age, phone_num, arrival_date, depart_date)
  VALUES('AB20012', 'Mackenzie', 'Dean', 21, '593-425-1241', '06-04-2014', '06-04-2014');
---- no accomodations Cheska Mackenzie --
INSERT INTO customers (cust_ID, first_name, last_name, curr_age, phone_num, arrival_date, depart_date)
  VALUES('AB20013', 'Hailey', 'Crawford', 23, '722-390-2134', '07-04-2013', '07-04-2013');
INSERT INTO customers (cust_ID, first_name, last_name, curr_age, phone_num, arrival_date, depart_date)
  VALUES('AB20014', 'Juliana', 'Crawford', 25, '722-117-7181', '07-04-2013', '07-04-2013');
-- END CUSTOMERS ------------------------------------------------------------------------

DROP TABLE IF EXISTS accommodations;
CREATE TABLE accommodations (
  accom_name	text not null,
  description	text,
 primary key(accom_name)
);
INSERT INTO accommodations (accom_name, description)
  VALUES('Royal Escapade', 'Great view of the beach');
INSERT INTO accommodations (accom_name, description)
  VALUES('Grand Villa', 'Best place to stay in with the kids');
INSERT INTO accommodations (accom_name, description)
  VALUES('Royal Park', 'Close distance to restaurant and bars');
INSERT INTO accommodations (accom_name, description)
  VALUES('Bel-air', 'Located at the centermost of the resort');
-- END ACCOMODATIONS -----------------------------------------------------

DROP TABLE IF EXISTS room_type;
CREATE TABLE room_type (
  room_name	text not null,
  description	text,
 primary key(room_name)
);
INSERT INTO room_type (room_name, description)
  VALUES('Double Standard', 'Queen size bed with one bathroom');
INSERT INTO room_type (room_name, description)
  VALUES('Upper Standard', '2 queen size beds with a kitchen and a bathroom');
INSERT INTO room_type (room_name, description)
  VALUES('Family Suite', '2 bedrooms each having a queen sized bed. Also has a common kitchen and 2 bathrooms');
INSERT INTO room_type (room_name, description)
  VALUES('Executive Suite', '2 bedrooms each having a queen sized bed. Also has a common kitchen, living room and 2 bathrooms');
-- END ROOM_TYPE ----------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS accom_and_room;
CREATE TYPE reply AS ENUM ('yes', 'no');
CREATE TABLE accom_and_room (
  room_num		char(5) not null,
  accom_name		text references accommodations(accom_name),
  room_name		text references room_type(room_name),
  per_night_costUSD	real,
  smoke_free		reply,
 primary key(room_num)
);
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('RE101', 'Royal Escapade', 'Double Standard', 99.00, 'yes');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('RE102', 'Royal Escapade', 'Double Standard', 99.00, 'no');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('RE103', 'Royal Escapade', 'Upper Standard', 110.00, 'yes');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('RE104', 'Royal Escapade', 'Upper Standard', 110.00, 'no');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('RE201', 'Royal Escapade', 'Family Suite', 125.00, 'yes');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('RE202', 'Royal Escapade', 'Family Suite', 125.00, 'no');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('RE203', 'Royal Escapade', 'Executive Suite', 150.00, 'yes'); 
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('RE204', 'Royal Escapade', 'Executive Suite', 150.00, 'no');
  
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('GV101', 'Grand Villa', 'Upper Standard', 110.00, 'yes');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('GV102', 'Grand Villa', 'Family Suite', 125.00, 'yes');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('GV103', 'Grand Villa', 'Family Suite', 125.00, 'yes');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('GV201', 'Grand Villa', 'Executive Suite', 150.00, 'yes');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('GV202', 'Grand Villa', 'Executive Suite', 150.00, 'yes');
  
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('RP101', 'Royal Park', 'Double Standard', 99.00, 'yes');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('RP102', 'Royal Park', 'Double Standard', 99.00, 'no');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('RP103', 'Royal Park', 'Upper Standard', 110.00, 'yes');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('RP104', 'Royal Park', 'Upper Standard', 110.00, 'no');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('RP201', 'Royal Park', 'Family Suite', 125.00, 'yes');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('RP202', 'Royal Park', 'Family Suite', 125.00, 'no');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('RP203', 'Royal Park', 'Executive Suite', 150.00, 'yes');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('RP204', 'Royal Park', 'Executive Suite', 150.00, 'no');

INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('BA101', 'Bel-air', 'Double Standard', 110.00, 'yes');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('BA102', 'Bel-air', 'Double Standard', 110.00, 'no');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('BA103', 'Bel-air', 'Upper Standard', 120.00, 'yes');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('BA104', 'Bel-air', 'Upper Standard', 120.00, 'no');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('BA201', 'Bel-air', 'Family Suite', 135.00, 'yes');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('BA202', 'Bel-air', 'Family Suite', 135.00, 'no');  
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('BA203', 'Bel-air', 'Executive Suite', 160.00, 'yes');
INSERT INTO accom_and_room (room_num, accom_name, room_name, per_night_costUSD, smoke_free)
  VALUES('BA204', 'Bel-air', 'Executive Suite', 160.00, 'no');       
-- END ACCOM_AND_ROOM -----------------------------------------------------

DROP TABLE IF EXISTS accommodation_payments;
CREATE TABLE accommodation_payments (
  payment_ID	integer not null,
  cust_ID	char(7) not null references customers(cust_ID),
  room_num	char(5) references accom_and_room(room_num),
  num_people	integer,
  email		text,
  total_costUSD	real,
  request	text,
  primary key(payment_ID, cust_ID)
);
INSERT INTO accommodation_payments (payment_ID, cust_ID, room_num, num_people, email, total_costUSD, request)
  VALUES(1, 'AB20002', 'GV102', 4, 'jsmith163@gmail.com', 540.62, 'none');  -- family
INSERT INTO accommodation_payments (payment_ID, cust_ID, room_num, num_people, email, total_costUSD, request)
  VALUES(2, 'AB20000', 'RE104', 1, 'alexisdavis112@yahoo.com', 54.47, 'none');
INSERT INTO accommodation_payments (payment_ID, cust_ID, room_num, num_people, email, total_costUSD, request)
  VALUES(2, 'AB20001', 'RE104', 1, 'alleydavis213@yahoo.com', 54.47, 'none');
  delete from accommodation_payments where accommodation_payments.payment_ID = 3
INSERT INTO accommodation_payments (payment_ID, cust_ID, room_num, num_people, email, total_costUSD, request)
  VALUES(3, 'AB20006', 'RP103', 2, 'andersond115@gmail.com', 237.87, '3rd Anniversary Package');
INSERT INTO accommodation_payments (payment_ID, cust_ID, room_num, num_people, email, total_costUSD, request)
  VALUES(4, 'AB20008', 'BA204', 1, 'stonethomas@verizon.net', 173.00, 'none');
INSERT INTO accommodation_payments (payment_ID, cust_ID, room_num, num_people, email, total_costUSD, request)
  VALUES(4, 'AB20010', 'BA204', 2, 'thesamnorris@gmail.com', 346.00, 'none');
-- END ACCOM_CUST ----------------------------------------------------------------------

DROP TABLE IF EXISTS accom_all_cust;
CREATE TABLE accom_all_cust (
  cust_ID	char(7) not null references customers(cust_ID),
  room_num	char(5) references accom_and_room(room_num),
  primary key(cust_ID)
);
INSERT INTO accom_all_cust (cust_ID, room_num)
  VALUES('AB20000', 'GV102');
INSERT INTO accom_all_cust (cust_ID, room_num)
  VALUES('AB20001', 'GV102');
INSERT INTO accom_all_cust (cust_ID, room_num)
  VALUES('AB20002', 'RE104');
INSERT INTO accom_all_cust (cust_ID, room_num)
  VALUES('AB20003', 'RE104');
INSERT INTO accom_all_cust (cust_ID, room_num)
  VALUES('AB20004', 'RE104');
INSERT INTO accom_all_cust (cust_ID, room_num)
  VALUES('AB20005', 'RE104');
INSERT INTO accom_all_cust (cust_ID, room_num)
  VALUES('AB20006', 'RP103');
INSERT INTO accom_all_cust (cust_ID, room_num)
  VALUES('AB20007', 'RP103');
INSERT INTO accom_all_cust (cust_ID, room_num)
  VALUES('AB20008', 'BA204');
INSERT INTO accom_all_cust (cust_ID, room_num)
  VALUES('AB20009', 'BA204');
INSERT INTO accom_all_cust (cust_ID, room_num)
  VALUES('AB20010', 'BA204');
-- END ACCOM_ALL_CUST -----------------------------------------------------------------------

CREATE TABLE restaurants (
  rest_name	text not null,
  description	text,
  time_open	time,
  time_close	time,
 primary key(rest_name)
);
INSERT INTO restaurants (rest_name, description, time_open, time_close)
  VALUES('7th Note Cafe', 'Coffee and snack area', '7:30', '23:00');
INSERT INTO restaurants (rest_name, description, time_open, time_close)
  VALUES('Sea Breeze Restaurant', 'Mainly seafood and Carribean dishes', '11:00', '23:00');
INSERT INTO restaurants (rest_name, description, time_open, time_close)
  VALUES('Garden & Grill', 'BBQ, smoked and grilled dishes', '10:30', '21:00');
INSERT INTO restaurants (rest_name, description, time_open, time_close)
  VALUES('Yellow Cab', 'American and Italian dishes', '7:30', '22:00');  
INSERT INTO restaurants (rest_name, description, time_open, time_close)
  VALUES('Cowboy Grill', 'BBQ, smoked and grilled dishes', '11:00', '21:30');
INSERT INTO restaurants (rest_name, description, time_open, time_close)
  VALUES('1 Mile Diner', 'Diner with all possible dishes', '6:00', '23:00');
-- END RESTAURANTS ----------------------------------------------------------------------------

CREATE TABLE restaurant_reservations (
  cust_ID	char(7) not null references customers(cust_ID),
  date_in	date,
  time_in	time,
  num_people	integer,
  phone_num	text,
  rest_name	text references restaurants(rest_name),
  reserved	reply,
 primary key(cust_ID, date_in, time_in)
);
INSERT INTO restaurant_reservations (cust_ID,  date_in, time_in, num_people, phone_num, rest_name, reserved)
  VALUES('AB20001', '03-23-2012', '19:15', 2, '917-759-2551', 'Garden & Grill', 'yes'); --dinner
INSERT INTO restaurant_reservations (cust_ID,  date_in, time_in, num_people, phone_num, rest_name, reserved)
  VALUES('AB20000', '03-24-2012', '9:35', 2, '917-083-6882', '7th Note Cafe', 'no');
INSERT INTO restaurant_reservations (cust_ID,  date_in, time_in, num_people, phone_num, rest_name, reserved)
  VALUES('AB20000', '03-24-2012', '18:30', 2, '917-083-6882', 'Sea Breeze Restaurant', 'yes'); --dinner
INSERT INTO restaurant_reservations (cust_ID,  date_in, time_in, num_people, phone_num, rest_name, reserved)
  VALUES('AB20001', '03-25-2012', '10:20', 2, '917-759-2551', '1 Mile Diner','no');
--------------
INSERT INTO restaurant_reservations (cust_ID,  date_in, time_in, num_people, phone_num, rest_name, reserved)
  VALUES('AB20003', '03-23-2014', '19:20', 4, '845-231-6393', 'Cowboy Grill', 'yes');  --dinner
INSERT INTO restaurant_reservations (cust_ID,  date_in, time_in, num_people, phone_num, rest_name, reserved)
  VALUES('AB20003', '03-25-2014', '11:10', 3, '845-231-6393', '1 Mile Diner', 'no');
INSERT INTO restaurant_reservations (cust_ID,  date_in, time_in, num_people, phone_num, rest_name, reserved)
  VALUES('AB20002', '03-25-2014', '20:15', 4, '845-892-1398', 'Garden & Grill', 'yes'); --dinner
INSERT INTO restaurant_reservations (cust_ID,  date_in, time_in, num_people, phone_num, rest_name, reserved)
  VALUES('AB20002', '03-27-2014', '14:30', 4, '845-892-1398', 'Sea Breeze Restaurant', 'yes'); --lunch
INSERT INTO restaurant_reservations (cust_ID,  date_in, time_in, num_people, phone_num, rest_name, reserved)
  VALUES('AB20002', '03-28-2014', '9:30', 4, '845-892-1398', '7th Note Cafe', 'yes');
--------------
INSERT INTO restaurant_reservations (cust_ID,  date_in, time_in, num_people, phone_num, rest_name, reserved)
  VALUES('AB20014', '07-04-2013', '14:30', 4, '722-117-7181', 'Yellow Cab', 'yes'); --lunch with derek & katie
INSERT INTO restaurant_reservations (cust_ID,  date_in, time_in, num_people, phone_num, rest_name, reserved)
  VALUES('AB20006', '07-04-2013', '19:15', 4, '845-231-6393', 'Cowboy Grill', 'yes'); --dinner w/ hailey & juliana
INSERT INTO restaurant_reservations (cust_ID,  date_in, time_in, num_people, phone_num, rest_name, reserved)
  VALUES('AB20006', '07-06-2013', '12:30', 2, '845-231-6393', '1 Mile Diner', 'no');  --lunch
INSERT INTO restaurant_reservations (cust_ID,  date_in, time_in, num_people, phone_num, rest_name, reserved)
  VALUES('AB20007', '07-06-2013', '18:45', 2, '845-237-9030', 'Sea Breeze Restaurant', 'yes'); --dinner
INSERT INTO restaurant_reservations (cust_ID,  date_in, time_in, num_people, phone_num, rest_name, reserved)
  VALUES('AB20007', '07-07-2013', '10:10', 2, '845-237-9030', '7th Note Cafe', 'no');
--------------
INSERT INTO restaurant_reservations (cust_ID,  date_in, time_in, num_people, phone_num, rest_name, reserved)
  VALUES('AB20010', '04-13-2014', '12:30', 3, '922-671-2330', 'Yellow Cab', 'yes');
INSERT INTO restaurant_reservations (cust_ID,  date_in, time_in, num_people, phone_num, rest_name, reserved)
  VALUES('AB20009', '04-14-2014', '11:25', 3, '922-750-2190', 'Sea Breeze Restaurant', 'no');
INSERT INTO restaurant_reservations (cust_ID,  date_in, time_in, num_people, phone_num, rest_name, reserved)
  VALUES('AB20008', '04-14-2014', '19:30', 3, '922-421-5569', 'Cowboy Grill', 'yes');
INSERT INTO restaurant_reservations (cust_ID,  date_in, time_in, num_people, phone_num, rest_name, reserved)
  VALUES('AB20010', '04-16-2014', '9:45', 2, '922-671-2330', '1 Mile Diner', 'no');
----------------
INSERT INTO restaurant_reservations (cust_ID,  date_in, time_in, num_people, phone_num, rest_name, reserved)
  VALUES('AB20011', '06-04-2014', '13:45', 2, '522-659-2757', 'Garden & Grill', 'yes');
INSERT INTO restaurant_reservations (cust_ID,  date_in, time_in, num_people, phone_num, rest_name, reserved)
  VALUES('AB20012', '06-04-2014', '19:30', 2, '593-425-1241', 'Sea Breeze Restaurant', 'yes');
-- END REST_CUSTOMERS ----------------------------------------------------------------------------

CREATE TABLE activities (
  act_name		text,
  costUSD_per_person	real,
  min_age_allowed	integer,
  max_people		integer,
 primary key(act_name)
);
INSERT INTO activities (act_name, costUSD_per_person, min_age_allowed, max_people)
  VALUES('Snorkeling', 45.00, 13, 6);
INSERT INTO activities (act_name, costUSD_per_person, min_age_allowed, max_people)
  VALUES('Parasailing', 35.00, 8, 2);
INSERT INTO activities (act_name, costUSD_per_person, min_age_allowed, max_people)
  VALUES('Wakeboarding', 15.00, 12, 4);
INSERT INTO activities (act_name, costUSD_per_person, min_age_allowed, max_people)
  VALUES('Banana Boat', 15.00, 7, 8);
INSERT INTO activities (act_name, costUSD_per_person, min_age_allowed, max_people)
  VALUES('Windsurfing', 25.00, 12, 3);
INSERT INTO activities (act_name, costUSD_per_person, min_age_allowed, max_people)
  VALUES('Flying Fish', 35.00, 7, 4);
INSERT INTO activities (act_name, costUSD_per_person, min_age_allowed, max_people)
  VALUES('Water Hopper', 35.00, 6, 6);
INSERT INTO activities (act_name, costUSD_per_person, min_age_allowed, max_people)
  VALUES('Water Skiing', 20.00, 7, 8);
-- END ACTIVITIES ------------------------------------------------------------------------

CREATE TABLE activity_payments (
  cust_ID	char(7) not null references customers(cust_ID),
  res_date	date,
  res_time	time,
  act_name	text references activities(act_name),
  num_people	integer,
  total_costUSD	real,
 primary key(cust_ID, res_date, res_time)
);
INSERT INTO activity_payments (cust_ID, res_date, res_time, act_name, num_people, total_costUSD)
  VALUES('AB20000', '03-24-2012', '15:30', 'Parasailing', 2, 70.00);
INSERT INTO activity_payments (cust_ID, res_date, res_time, act_name, num_people, total_costUSD)
  VALUES('AB20001', '03-25-2012', '13:15', 'Flying Fish', 2, 70.00);
---------
INSERT INTO activity_payments (cust_ID, res_date, res_time, act_name, num_people, total_costUSD)
  VALUES('AB20002', '03-23-2014', '14:00', 'Banana Boat', 4, 60.00);
INSERT INTO activity_payments (cust_ID, res_date, res_time, act_name, num_people, total_costUSD)
  VALUES('AB20003', '03-25-2014', '15:30', 'Water Hopper', 4, 140.00);
INSERT INTO activity_payments (cust_ID, res_date, res_time, act_name, num_people, total_costUSD)
  VALUES('AB20002', '03-27-2014', '17:15', 'Water Skiing', 2, 40.00);
----------
INSERT INTO activity_payments (cust_ID, res_date, res_time, act_name, num_people, total_costUSD)
  VALUES('AB20006', '07-04-2013', '17:30', 'Water Hopper', 2, 70.00);
INSERT INTO activity_payments (cust_ID, res_date, res_time, act_name, num_people, total_costUSD)
  VALUES('AB20007', '07-05-2013', '14:30', 'Snorkeling', 2, 45.00);
INSERT INTO activity_payments (cust_ID, res_date, res_time, act_name, num_people, total_costUSD)
  VALUES('AB20013', '07-04-2013', '17:30', 'Water Hopper', 1, 35.00);
INSERT INTO activity_payments (cust_ID, res_date, res_time, act_name, num_people, total_costUSD)
  VALUES('AB20014', '07-04-2013', '17:30', 'Water Hopper', 1, 35.00);
----------
INSERT INTO activity_payments (cust_ID, res_date, res_time, act_name, num_people, total_costUSD)
  VALUES('AB20008', '04-13-2014', '9:30', 'Windsurfing', 1, 25.00);
INSERT INTO activity_payments (cust_ID, res_date, res_time, act_name, num_people, total_costUSD)
  VALUES('AB20009', '04-13-2014', '9:30', 'Windsurfing', 1, 25.00); 
INSERT INTO activity_payments (cust_ID, res_date, res_time, act_name, num_people, total_costUSD)
  VALUES('AB20010', '04-13-2014', '9:30', 'Windsurfing', 1, 25.00);
----------- 
INSERT INTO activity_payments (cust_ID, res_date, res_time, act_name, num_people, total_costUSD)
  VALUES('AB20011', '06-04-2014', '17:30', 'Banana Boat', 1, 15.00);
INSERT INTO activity_payments (cust_ID, res_date, res_time, act_name, num_people, total_costUSD)
  VALUES('AB20012', '06-04-2014', '17:30', 'Banana Boat', 1, 15.00);
-- END ACT_CUSTOMERS ----------------------------------------------------------------------

CREATE TABLE act_with_lessons (
  act_name		text references activities(act_name),
  person_costUSD	real,
  lesson_start		time,
 primary key(act_name)
);
INSERT INTO act_with_lessons (act_name, person_costUSD, lesson_start)
  VALUES('Snorkeling', 75.00, '10:00');
INSERT INTO act_with_lessons (act_name, person_costUSD, lesson_start)
  VALUES('Wakeboarding', 40.00, '09:30');
INSERT INTO act_with_lessons (act_name, person_costUSD, lesson_start)
  VALUES('Windsurfing', 55.00, '13:30');
-- END ACT_WITH_LESSONS ---------------------------------------------------------------------

CREATE TABLE appointments (
  cust_ID	char(7) not null references customers(cust_ID),
  appt_date	date,
  appt_time	time,
  act_name	text references activities (act_name),
 primary key(cust_ID, appt_date, appt_time)
);
INSERT INTO appointments (cust_ID, appt_date, appt_time, act_name)
  VALUES('AB20008', '04-14-2014', '15:00', 'Wakeboarding');
INSERT INTO appointments (cust_ID, appt_date, appt_time, act_name)
  VALUES('AB20009', '04-14-2014', '15:00', 'Wakeboarding');
INSERT INTO appointments (cust_ID, appt_date, appt_time, act_name)
  VALUES('AB20010', '04-14-2014', '15:00', 'Wakeboarding');
-----------
INSERT INTO appointments (cust_ID, appt_date, appt_time, act_name)
  VALUES('AB20002', '03-24-2014', '13:30', 'Windsurfing');
INSERT INTO appointments (cust_ID, appt_date, appt_time, act_name)
  VALUES('AB20003', '03-24-2014', '13:30', 'Windsurfing');



------- VIEWS --------
-- Number of customers who accommodated in the resort in 2014
create view accommodation_customers_2014 as
select c.last_name, c.first_name, c.curr_age, c.arrival_date, a.room_num
from customers as c, accom_all_cust as a, accom_and_room as ac
where c.cust_ID = a.cust_ID
and a.room_num = ac.room_num
and c.arrival_date::text LIKE '2014%'
order by c.last_name
select * from accommodation_customers_2014

-- Gives the maximum number of people that ate at the restaurant in the year of 2014.
create view popular_restaurants_2014 as
select rr.rest_name, sum(rr.num_people)
from restaurants as r, restaurant_reservations as rr
where rr.date_in::text LIKE '2014%'
and r.rest_name = rr.rest_name
group by rr.rest_name
order by sum asc;
select * from popular_restaurants_2014

-- Lists the customers that paid for accommodation and activities starting from the person
-- that spent the most amount of money. 
create view cust_most_expenses as
select c.last_name, c.first_name, ap.cust_ID, sum(acp.total_costUSD + ap.total_costUSD)
from customers as c, activity_payments as acp, accommodation_payments as ap
where c.cust_ID = ap.cust_ID
and c.cust_ID = acp.cust_ID
group by ap.cust_ID, acp.cust_ID,  c.last_name, c.first_name
order by sum desc;

select * from cust_most_expenses



------ QUERIES -----
-- Gives the customers that paid for the room they are staying in, the room number
-- and their location.
select c.last_name, c.first_name, c.cust_ID, ac.room_num
from customers as c, accommodation_payments as ap, accom_all_cust as ac, 
     accommodations as a, accom_and_room as ar
where c.cust_ID = ap.cust_ID	
and c.cust_ID = ac.cust_ID	
and ar.room_num = ap.room_num
and ar.accom_name = a.accom_name
order by c.last_name asc;

-- Gives the number of people that live in a certain room number
select a.accom_name, ap.room_num, sum(ap.num_people)
from room_type as r, accommodations as a, customers as c, accommodation_payments as ap,
     accom_and_room as ar
where c.cust_ID = ap.cust_ID
and ap.room_num = ar.room_num
and r.room_name = ar.room_name
and a.accom_name = ar.accom_name
group by a.accom_name, ap.room_num
order by a.accom_name asc;

-- Customers that had a special request for packages
select c.last_name, c.first_name, a.room_num
from customers as c right outer join accommodation_payments as a
on c.cust_ID = a.cust_ID
where a.request::text LIKE '%Package'
order by c.last_name asc;



----- STORED PROCEDURE ------
-- Total number of activity customers for the specified activity
create or replace function getTotalActivityCust(text, refcursor) returns refcursor as 
$$
declare
   act_name text  := $1;
   resultset refcursor  := $2;
begin
open resultset for
	select sum(ap.num_people) as sum_of_customers
	from activity_payments as ap
	where ap.act_name = $1;
	return resultset;
end;
$$ language plpgsql;

select getTotalActivityCust('Banana Boat', 'results');
fetch all from results;

-- Total number of restaurant customers
create or replace function getTotalRestaurantCust(text, refcursor) returns refcursor as 
$$
declare
   rest_name text  := $1;
   resultset refcursor  := $2;
begin
open resultset for
	select sum(rr.num_people) as sum_of_restaurant_cust
	from restaurant_reservations as rr
	where rr.rest_name = $1;
	return resultset;
end;
$$ language plpgsql;

select getTotalRestaurantCust('Garden & Grill', 'results');
fetch all from results;



---------- SECURITY ---------------
create role instructor; 
grant select, insert, delete, update
on activities, activity_payments, act_with_lessons, appointments
to instructor

create role customers;
grant select
on customers, accommodations, room_type, accom_and_room, restaurants, activities
to customers

create role database_administrator;
grant select, insert, delete, update
on all tables in schema public
to database_administrator