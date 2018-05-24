.read lab12.sql

-- Q5
CREATE TABLE greatstudents AS
  SELECT last.date, last.color, last.pet, this.number, last.number
    FROM fa17students AS last, students AS this
    WHERE last.date = this.date AND
          last.color = this.color AND
          last.pet = this.pet;

-- Q6
CREATE TABLE sevens AS
  SELECT s.seven
    FROM students AS s, checkboxes AS c
    WHERE s.time = c.time AND
          s.number = 7 AND
          c."7" = "True";

-- Q7
CREATE TABLE fa17favnum AS
  SELECT number, count(*) as count
    FROM fa17students
    GROUP BY number
    ORDER BY count DESC
    LIMIT 1;


CREATE TABLE fa17favpets AS
  SELECT pet, count(*) as count
    FROM fa17students
    GROUP BY pet
    ORDER BY count DESC
    LIMIT 10;


CREATE TABLE sp18favpets AS
  SELECT pet, count(*) as count
    FROM students
    GROUP BY pet
    ORDER BY count DESC
    LIMIT 10;


CREATE TABLE sp18dog AS
  SELECT pet, count(*) as count
    FROM students
    WHERE pet = "dog";


CREATE TABLE sp18alldogs AS
  SELECT pet, count(*) as count
    FROM students
    WHERE pet LIKE "%dog%";


CREATE TABLE obedienceimages AS
  SELECT seven, denero, count(*) as count
   FROM students
   WHERE seven = '7'
   GROUP BY denero;

-- Q8
CREATE TABLE smallest_int_count AS
  SELECT smallest, count(*)
    FROM students
    GROUP BY smallest
    ORDER BY smallest;
