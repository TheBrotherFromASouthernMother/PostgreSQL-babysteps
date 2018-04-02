-- CREATE TABLE author (
--   id SERIAL PRIMARY KEY,
--   name VARCHAR(15)
-- );
--
-- CREATE TABLE article (
--   id SERIAL PRIMARY KEY,
--   title TEXT,
--   author_id INTEGER REFERENCES author (id)
-- );
--
-- INSERT INTO author VALUES(1, 'Christian');
--
-- INSERT INTO author VALUES(2, 'Lehidy');
--
-- INSERT INTO author VALUES(3, 'Yoli');
--
-- INSERT INTO author VALUES(4, 'Chelsea');
--
-- INSERT INTO article VALUES(1, 'The wind and the river', 2);
--
-- INSERT INTO article VALUES(2, 'The king and the poor man', 1);
--
-- INSERT INTO article VALUES(3, 'No one knocks the door', 2);
--
-- SELECT * FROM article, author
--   WHERE article.author_id = author.id;

SELECT * FROM article
  RIGHT OUTER JOIN author
    ON article.author_id = author.id;
