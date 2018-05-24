CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT d.name, s.size
  FROM dogs AS d, sizes AS s
  WHERE d.height > s.min AND
        d.height <= s.max;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_height AS
  SELECT cd.name
  FROM dogs AS cd, dogs AS pd, parents AS p
  WHERE cd.name = p.child AND
        pd.name = p.parent
  ORDER BY pd.height DESC;

-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT f.child AS first, s.child as second
  FROM parents AS f, parents AS s
  WHERE f.parent = s.parent AND
        f.child < s.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT fd.name || ' and ' || sd.name || ' are ' || fd.size || ' siblings'
  FROM siblings AS d, size_of_dogs AS fd, size_of_dogs AS sd
  WHERE d.first = fd.name AND
        d.second = sd.name AND
        fd.size = sd.size;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height);

-- Add your INSERT INTOs here

INSERT INTO stacks_helper(dogs, stack_height, last_height)
SELECT a.name || ", " || b.name || ", " || c.name || ", " || d.name,
      a.height + b.height + c.height + d.height,
      d.height
FROM dogs as a, dogs as b, dogs as c, dogs as d
WHERE a.height < b.height AND
      b.height < c.height AND
      c.height < d.height;


CREATE TABLE stacks AS
  SELECT h.dogs, h.stack_height
  FROM stacks_helper as h
  WHERE h.stack_height > 170
  ORDER BY h.stack_height;
