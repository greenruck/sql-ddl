-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE travelers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT ,
  last_name TEXT,
  birth_date int,
);

INSERT INTO travlers
(first_name, last_name)
VALUES
('Jenifer', 'Finch'),
('Thadeus', 'Gathercoal'),
('Sonja', 'Pauley'),
('Waneta', 'Skeleton'),
('Berkie', 'Wycliff'),
('Alvin', 'Leathes'),
('Cory', 'Squibbes');

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO airlines
(name)
VALUES
('United'),
('British Airways'),
('Delta'),
('TUI FLy Belgium'),
('Air China'),
('United'),
('American Airlines'),
('Avianca Brasil');

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO countries
(name)
VALUES
('United States'),
('Japan'),
('United Kingdom'),
('Mexico'),
('France'),
('Moroco'),
('UAE'),
('China'),
('Brasil'),
('Chile');

CREATE TABLE locations
(
  id SERIAL PRIMARY KEY,
  city text NOT NULL,
  country int REFERENCES countries (id),
)

INSERT INTO cities
(city, country)
VALUES
('Washington D.C.', 1),
('Seatle', 1),
('Tokyo', 2),
('London', 3),
('Los Angeles', 1),
('Los Vegas', 1),
('Mexico City', 4),
('Paris', 5),
('Casablanca', 6),
('Dubai', 7),
('Beijing', 8),
('New York', 1),
('Charlotte', 1),
('Cedar Rapids', 1),
('Chicago', 1),
('New Orleans', 1),
('Sao Paolo', 9),
('Santiago', 10);


CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline int REFERENCES airlines(id),
  from_city int REFERENCES cities(id),
  from_country int REFERENCES countries(id),
  to_city int REFERENCES cities(id),
  to_country int REFERENCES countries(id),

);

INSERT INTO flights
(departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 2, 1),
('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 2, 4, 3),
('2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 1, 6, 1),
('2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 1, 7, 4),
('2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 5, 9, 6),
('2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 7, 11, 8),
('2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 1, 13, 1),
('2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 1, 15, 1),
('2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 1, 16, 1),
('2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 9, 18, 10);


CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  fist_name int REFERENCES travelers (id),
  last_name int REFERENCES travelers (id),
  seat TEXT NOT NULL,
  departure int REFERENCES flights(id),
  arrival int REFERENCES flights(id),
  airline int REFERENCES airlines(id),
  from_city int REFERENCES cities(id),
  from_country Tint REFERENCES countries(id),
  to_city int REFERENCES cities(id)L,
  to_country int REFERENCES countries(id)
);

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  (1, 1, '33B', 1, 1, 1, 1, 1, 2, 1),
  (2, 2, '8A', 2, 2, 2, 3, 2, 4, 3),
  (3, 3, '12F', 3, 3, 3, 5, 1, 6, 1),
  (1, 1, '20A', 4, 4, 3, 2, 1, 7, 4),
  (4, 4, '23D', 5, 5, 4, 8, 5, 9, 6),
  (2, 2, '18C', 6, 6, 5, 10, 7, 11, 8),
  (5, 5, '9E', 7, 7, 1, 12, 1, 13, 1),
  (6, 6, '1A', 8, 8, 6, 14, 1, 15, 1),
  (5, 5, '32B', 9, 9, 6, 13, 1, 16, 1),
  (7, 7, '10D', 10, 10, 7, 17, 9, 18, 10);