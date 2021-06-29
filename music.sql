DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artist (
  artist_id SERIAL PRIMARY KEY,
  artists TEXT[] NOT NULL
);

CREATE TABLE producer (
  producer_id SERIAL PRIMARY KEY,
  producers TEXT [] NOT NULL
);

CREATE TABLE album (
  album_id SERIAL PRIMARY KEY,
  album_name TEXT NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE song_title (
  song_title_id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INT NOT NULL
);


CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  artist INT REFERENCES artist ON DELETE CASCADE,
  producers INT REFERENCES producer ON DELETE CASCADE,
  album_name INT REFERENCES album ON DELETE CASCADE,
  title INT REFERENCES song_title ON DELETE CASCADE
);


INSERT INTO artist
  (artists)
VALUES
  ('{"Hanson"}'),
  ('{"Queen"}'),
  ('{"Mariah Cary", "Boyz II Men"}'),
  ('{"Lady Gaga", "Bradley Cooper"}'),
  ('{"Nickelback"}'),
  ('{"Jay Z", "Alicia Keys"}'),
  ('{"Katy Perry", "Juicy J"}'),        
  ('{"Maroon 5", "Christina Aguilera"}'),
  ('{"Avril Lavigne"}'),
  ('{"Destiny''s Child"}');

INSERT INTO producer
  (producers)
VALUES
  ('{"Dust Brothers", "Stephen Lironi"}'),
  ('{"Roy Thomas Baker"}'),
  ('{"Walter Afanasieff"}'),
  ('{"Benjamin Rice"}'),
  ('{"Rick Parashar"}'),
  ('{"Al Shux"}'),
  ('{"Max Martin", "Cirkut"}'),       
  ('{"Shellback", "Benny Blanco"}'),
  ('{"The Matrix"}'),
  ('{"Darkchild"}');

INSERT INTO album
  (release_date, album_name)
VALUES
  ('04-15-1997', 'Middle of Nowhere'),
  ('10-31-1975', 'A Night at the Opera'),
  ('11-14-1995', 'Daydream'),
  ('09-27-2018', 'A Star Is Born'),
  ('08-21-2001', 'Silver Side Up'),
  ('10-20-2009', 'The Blueprint 3'),
  ('12-17-2013', 'Prism'),
  ('06-21-2011', 'Hands All Over'),
  ('05-14-2002', 'Let Go'),
  ('11-07-1999', 'The Writing''s on the Wall');

INSERT INTO song_title
  (title, duration_in_seconds)
VALUES
  ('MMMBop', 238),
  ('Bohemian Rhapsody', 355),
  ('One Sweet Day', 282),
  ('Shallow', 216),
  ('How You Remind Me', 223),
  ('New York State of Mind', 276),
  ('Dark Horse', 215),
  ('Moves Like Jagger', 201),
  ('Complicated', 244),
  ('Say My Name', 240);

