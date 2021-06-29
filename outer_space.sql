DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets (
    planet_id SERIAL PRIMARY KEY,
    planet_name TEXT   NOT NULL
);

CREATE TABLE orbit (
    id SERIAL PRIMARY KEY,
    orbital_period_in_years FLOAT   NOT NULL,
    orbits_around TEXT   NOT NULL,
    orbit_id INT REFERENCES planets ON DELETE CASCADE
);

CREATE TABLE facts (
    id SERIAL PRIMARY KEY,
    galaxy TEXT   NOT NULL,
    moons TEXT[],
    fact_id INT REFERENCES planets ON DELETE CASCADE
);

INSERT INTO planets
  (planet_name)
VALUES
  ('Earth'),
  ('Mars'),
  ('Venus'),
  ('Neptune'),
  ('Proxima Centauri b'),
  ('Gliese 876 b');

INSERT INTO orbit
  (orbital_period_in_years, orbits_around)
VALUES
  (1.00, 'The Sun'),
  (1.88, 'The Sun'),
  (0.62, 'The Sun'),
  (164.8, 'The Sun'),
  (0.03, 'Proxima Centauri'),
  (0.23, 'Gliese 876');

INSERT INTO facts
  (galaxy, moons)
VALUES
  ('Milky Way', '{"The Moon"}'),
  ('Milky Way', '{"Phobos", "Deimos"}'),
  ('Milky Way', '{}'),
  ('Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Milky Way', '{}'),
  ('Milky Way', '{}');


