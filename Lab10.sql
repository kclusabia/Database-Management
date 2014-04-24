----------------------------------------------------------------------------------------
-- Kara Lusabia
-- Lab 10 - Stored Procedures
-- Tested on Postgres 9.3.2
----------------------------------------------------------------------------------------

-- 1. Returns the immediate pre-requisites for the passed-in course number.
CREATE or replace FUNCTION PreReqsFor(integer, refcursor)
RETURNS refcursor AS $$
  DECLARE
    courseNum integer := $1;
    resultset refcursor := $2;
  BEGIN
  open resultset for
    select p.preReqNum
    from Prerequisites as p, Courses as c
    where c.num = p.courseNum
    and p.courseNum = $1;
    RETURN resultset;
  END; 
  $$ language plpgsql;

select PreReqsFor(499, 'results');
fetch all from results;


-- 2. Returns the courses for which the passed-in course number is an immediate pre-requisite.
CREATE or replace FUNCTION PreReqFor(integer, refcursor)
RETURNS refcursor AS $$
  DECLARE
    preReq integer := $1;
    resultset refcursor := $2;
  BEGIN
  open resultset for
    select p.courseNum
    from Prerequisites as p, Courses as c
    where c.num = p.preReqNum
    and c.num = $1;
    RETURN resultset;
  END; 
  $$ language plpgsql;
  
select PreReqFor(120, 'results');
fetch all from results;