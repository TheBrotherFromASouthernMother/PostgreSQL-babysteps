CREATE TABLE restaurant(
  id SERIAL NOT NULL PRIMARY KEY,
  name TEXT NOT NULL,
  distance REAL,
  stars INTEGER,
  category VARCHAR(10),
  "chefs-favorite" TEXT,
  "does takeout?" BOOLEAN,
  "last time you ate there" DATE
)

--
INSERT INTO restaurant VALUES ('Casa Maria', 125.0, 5, 'Mexican', 'Enchilladas', TRUE, '2017-12-03');

INSERT INTO restaurant VALUES (91, 'Moon Tower', 0.3, 3 'Bar Food', 'Burgers', FALSE, '2018-03-14');

INSERT INTO restaurant VALUES (32, 'Taco Bell', 12.1, 5, 'Tex-Mex', 'Chalupa', FALSE, '2018-03-27');
--
-- -- Write queries to get
-- --The names of the restaurants that you gave a 5 stars to
SELECT name FROM restaurant WHERE stars = 5; --Casa Maria and Taco Bell
--
-- -- The favorite dishes of all 5-star restaurants
SELECT name, restaurant."chefs-favorite" FROM restaurant WHERE stars = 5;
--
-- -- The the id of a restaurant by a specific restaurant name, say 'Moon Tower'
SELECT id FROM restaurant WHERE name = 'Moon Tower';
--
-- --restaurants in a category
SELECT name FROM restaurant WHERE category = 'Tex-Mex';
--
-- -- restaurants that do take out
SELECT name FROM restaurant WHERE restaurant."does takeout?" = TRUE AND category = 'Mexican';
--
-- --restaurants within 2 miles
SELECT name, distance FROM restaurant WHERE distance < 2;
--
-- -- restaurants you haven't ate at in the last week
SELECT name, restaurant."last time you ate there" FROM restaurant WHERE restaurant."last time you ate there" NOT BETWEEN (NOW() - INTERVAL '14 day') AND NOW();
--
-- --restaurants you haven't ate at in the last week and has 5 stars
SELECT name, restaurant."last time you ate there" FROM restaurant WHERE restaurant."last time you ate there" NOT BETWEEN (NOW() - INTERVAL '14 day') AND NOW() AND stars = 5;
--
--
-- --list restaurants by the closest distance.
SELECT name, distance FROM restaurant ORDER by distance;
--
-- -- list the top 2 restaurants by distance
SELECT name, distance FROM restaurant ORDER BY distance LIMIT 2;
--
-- --list the top 2 restaurants by stars
SELECT name, stars FROM restaurant WHERE stars = 5 LIMIT 2;
--
-- -- list the top 2 restaurants by stars where the distance is less than 2 miles.
SELECT name FROM restaurant WHERE stars > 1 AND distance < 20 LIMIT 2;
--
-- --count the number of restaurants in the db.
SELECT COUNT(*) FROM restaurant;
--
-- --count the number of restaurants by category.
SELECT COUNT(*) FROM restaurant WHERE category = 'Mexican';
--
-- --get the average stars per restaurant by category.
SELECT AVG(stars) FROM restaurant WHERE category = 'Tex-Mex';
--
-- --get the max stars of a restaurant by category.
SELECT MAX(stars) FROM restaurant WHERE category = 'Tex-Mex';



CREATE TABLE restaurant (
  id serial PRIMARY KEY,
  name varchar,
  address varchar,
  category varchar
);

CREATE TABLE reviewer (
  id serial PRIMARY KEY,
  name varchar,
  email varchar,
  karma integer check (karma >= 0 and karma <= 7)
);

CREATE TABLE review (
  id serial PRIMARY KEY,
  title varchar,
  review varchar,
  stars integer check (stars >= 0 and stars <= 5),
  reviewer_id integer REFERENCES reviewer (id),
  restaurant_id integer REFERENCES restaurant (id)
);

-- --restaurants
INSERT INTO restaurant VALUES (1, 'Casa Maria', '5th street', 'Mexican');

INSERT INTO restaurant VALUES (2, 'Moon Tower', 'Canal Street', 'Bar food');

INSERT INTO restaurant VALUES (3, 'Taco Bell', 'Barker Cypress', 'Tex-Mex');

INSERT INTO restaurant VALUES (4, 'McDonalds', 'Everywhere', 'Fast Food');

INSERT INTO restaurant VALUES (5, 'Insomnia Cook', 'Brown Ave', 'Sweets');


Reviewers
INSERT INTO reviewer VALUES (1, 'Chris', 'bodyinspector@gmail.com', 1);

INSERT INTO reviewer VALUES (2, 'Jen', 'IWentToCollege@yahoo.com', 4);

INSERT INTO reviewer VALUES (3, 'Craig', 'speakGermanToMe@aol.com', 5);

INSERT INTO reviewer VALUES (4, 'Ana Faris', 'meAndChrisPrattGotADivorce@WHYGOD.com', 6);
--
-- --Reviews
INSERT INTO review VALUES (1, 'Terrible Presentation even more Terrible Food', 'This food was bad and you should feel bad', 2, 1, 2);

INSERT INTO review VALUES (2, 'I love tacos but I voted for trump', 'Basically, Im racist', 3, 2, 1);

INSERT INTO review VALUES (3, 'Buy my mixtape otherwise I will countinue to post negative reviews', 'I refer to myself as a rapper but no one else will', 1, 1, 3);

INSERT INTO review VALUES (4, 'Never eaten here', 'Ive obviously never eaten here but I want the karma', 4, 3, 5);

INSERT INTO review VALUES (5, 'Terrible', 'Absolutely terrible', 1, 1, 1);

INSERT INTO review VALUES (6, 'Its pretty good', 'Would Buy Again', 5, 4, 1);


-- List all the reviews for a given restaurant given a specific restaurant ID.
SELECT name, title, review FROM review INNER JOIN restaurant ON review.restaurant_id = restaurant.id WHERE restaurant_id = 1;


-- List all the reviews for a given restaurant, given a specific restaurant name.
SELECT name, title, review FROM review INNER JOIN restaurant ON review.restaurant_id = restaurant.id WHERE name = 'Moon Tower';

--List all the reviews for a given reviewer, given a specific author name.
SELECT * FROM reviewer INNER JOIN review ON reviewer.id = review.reviewer_id WHERE name = 'Chris';

--List all the reviews along with the restaurant they were written for. In the query result, select the restaurant name and the review text.
SELECT name, title, review FROM restaurant INNER JOIN review ON restaurant.id = review.restaurant_id;


--Get the average stars by restaurant. The result should have the restaurant name and its average star rating.
SELECT name, AVG(stars) AS Average_Stars FROM restaurant INNER JOIN review ON restaurant.id = review.restaurant_id GROUP BY name;

--Get the number of reviews written for each restaurant. The result should have the restaurant name and its review count.
SELECT name, COUNT(review) as num_reviews FROM restaurant INNER JOIN review ON restaurant.id = review.restaurant_id GROUP BY name;

-- List all the reviews along with the restaurant, and the reviewer's name. The result should have the restaurant name, the review text, and the reviewer name. Hint: you will need to do a three-way join - i.e. joining all three tables together.
SELECT review, reviewer.name AS reviewer_name, restaurant.name AS restaurant_name FROM review INNER JOIN reviewer ON review.reviewer_id = reviewer.id INNER JOIN restaurant ON review.restaurant_id = restaurant.id;


--Get the average stars given by each reviewer. (reviewer name, average star rating)
SELECT name, AVG(stars) AS Average_Stars FROM review LEFT OUTER JOIN reviewer ON reviewer.id = review.reviewer_id GROUP BY name;

--Get the lowest star rating given by each reviewer. (reviewer name, lowest star rating):
SELECT name, MIN(stars) AS Least_Stars FROM review LEFT OUTER JOIN reviewer ON reviewer.id = review.reviewer_id GROUP BY name;


--Get the number of restaurants in each category. (category name, restaurant count)
SELECT category, COUNT(category) FROM restaurant GROUP BY category;

--Get number of 5 star reviews given by restaurant. (restaurant name, 5-star count)
SELECT restaurant.name AS restaurant_name, stars FROM restaurant JOIN review ON review.restaurant_id = restaurant.id WHERE stars = 5;

-- Get the average star rating for a food category. (category name, average star rating)
SELECT category, AVG(stars) AS Average_Stars FROM restaurant INNER JOIN review ON restaurant.id = review.restaurant_id GROUP BY category;
