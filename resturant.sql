-- CREATE TABLE restaurant(
--   id SERIAL NOT NULL PRIMARY KEY,
--   name TEXT NOT NULL,
--   distance REAL,
--   stars INTEGER,
--   category VARCHAR(10),
--   "chefs-favorite" TEXT,
--   "does takeout?" BOOLEAN,
--   "last time you ate there" DATE
-- )


INSERT INTO restaurant VALUES ('Casa Maria', 125.0, 5, 'Mexican', 'Enchilladas', TRUE, '2017-12-03');

INSERT INTO restaurant VALUES (91, 'Moon Tower', 0.3, 3 'Bar Food', 'Burgers', FALSE, '2018-03-14');

INSERT INTO restaurant VALUES (32, 'Taco Bell', 12.1, 5, 'Tex-Mex', 'Chalupa', FALSE, '2018-03-27');

-- Write queries to get
--The names of the restaurants that you gave a 5 stars to
SELECT name FROM restaurant WHERE stars = 5; --Casa Maria and Taco Bell

-- The favorite dishes of all 5-star restaurants
SELECT name, restaurant."chefs-favorite" FROM restaurant WHERE stars = 5;

-- The the id of a restaurant by a specific restaurant name, say 'Moon Tower'
SELECT id FROM restaurant WHERE name = 'Moon Tower';

--restaurants in a category
SELECT name FROM restaurant WHERE category = 'Tex-Mex';

-- restaurants that do take out
SELECT name FROM restaurant WHERE restaurant."does takeout?" = TRUE AND category = 'Mexican';

--restaurants within 2 miles
SELECT name, distance FROM restaurant WHERE distance < 2;

-- restaurants you haven't ate at in the last week
SELECT name, restaurant."last time you ate there" FROM restaurant WHERE restaurant."last time you ate there" NOT BETWEEN (NOW() - INTERVAL '14 day') AND NOW();

--restaurants you haven't ate at in the last week and has 5 stars
SELECT name, restaurant."last time you ate there" FROM restaurant WHERE restaurant."last time you ate there" NOT BETWEEN (NOW() - INTERVAL '14 day') AND NOW() AND stars = 5;



SELECT name, distance FROM restaurant ORDER by distance
