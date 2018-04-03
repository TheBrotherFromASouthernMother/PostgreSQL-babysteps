-- CREATE SEQUENCE album_id_seqs;
CREATE TABLE music (
  id INTEGER DEFAULT NEXTVAL('album_id_seqs'),
  album_name VARCHAR,
  album_year VARCHAR
);
