-- Connect to universe database
\c universe

-- Galaxy table
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT NOT NULL,
    diameter_in_light_years NUMERIC NOT NULL,
    star_count NUMERIC NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);

-- Star table
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    galaxy_id INT NOT NULL,
    mass_in_solar_masses NUMERIC NOT NULL,
    age_in_millions_of_years INT NOT NULL,
    is_main_sequence BOOLEAN NOT NULL,
    has_planets BOOLEAN NOT NULL,
    FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
);

-- Planet table
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    star_id INT NOT NULL,
    distance_from_star_in_au NUMERIC NOT NULL,
    diameter_in_km INT NOT NULL,
    is_habitable BOOLEAN NOT NULL,
    has_life BOOLEAN NOT NULL,
    orbital_period_in_days INT NOT NULL,
    FOREIGN KEY (star_id) REFERENCES star(star_id)
);

-- Moon table
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    planet_id INT NOT NULL,
    diameter_in_km INT NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    orbital_period_in_days NUMERIC NOT NULL,
    FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
);

-- Additional table to meet the "at least 5 tables" requirement
CREATE TABLE satellite (
    satellite_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    planet_id INT NOT NULL,
    satellite_type VARCHAR(50) NOT NULL,
    discovery_year INT NOT NULL,
    is_artificial BOOLEAN NOT NULL,
    FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
);

-- Insert Galaxy data (at least 6 rows)
INSERT INTO galaxy (name, description, diameter_in_light_years, star_count, is_active) VALUES
('Milky Way', 'Our home galaxy', 100000, 100000000, TRUE),
('Andromeda', 'Nearest major galaxy to the Milky Way', 220000, 1000000000, TRUE),
('Triangulum', 'Third largest galaxy in the Local Group', 60000, 40000000, TRUE),
('Sagittarius Dwarf', 'Dwarf elliptical galaxy merging with the Milky Way', 16000, 3000000, FALSE),
('Centaurus A', 'Giant elliptical galaxy with a supermassive black hole', 130000, 100000000, TRUE),
('Whirlpool Galaxy', 'Grand design spiral galaxy with beautiful arms', 145000, 200000000, TRUE);

-- Insert Star data (at least 6 rows)
INSERT INTO star (name, galaxy_id, mass_in_solar_masses, age_in_millions_of_years, is_main_sequence, has_planets) VALUES
('Sun', 1, 1.0, 4600, TRUE, TRUE),
('Sirius', 1, 2.02, 300, TRUE, FALSE),
('Proxima Centauri', 1, 0.120, 4850, TRUE, TRUE),
('Betelgeuse', 1, 16.5, 8000, FALSE, FALSE),
('Alpha Centauri A', 1, 1.1, 4500, TRUE, TRUE),
('Vega', 1, 2.135, 400, TRUE, FALSE),
('Andromeda Star A', 2, 1.5, 3000, TRUE, TRUE),
('Triangulum Star A', 3, 0.9, 5000, TRUE, TRUE);

-- Insert Planet data (at least 12 rows)
INSERT INTO planet (name, star_id, distance_from_star_in_au, diameter_in_km, is_habitable, has_life, orbital_period_in_days) VALUES
('Mercury', 1, 0.39, 4879, FALSE, FALSE, 88),
('Venus', 1, 0.72, 12104, FALSE, FALSE, 225),
('Earth', 1, 1.0, 12742, TRUE, TRUE, 365),
('Mars', 1, 1.52, 6779, FALSE, FALSE, 687),
('Jupiter', 1, 5.2, 139820, FALSE, FALSE, 4333),
('Saturn', 1, 9.5, 116460, FALSE, FALSE, 10759),
('Sirius B Companion', 2, 20.0, 12000, FALSE, FALSE, 50),
('Proxima b', 3, 0.048, 12500, TRUE, FALSE, 11),
('Alpha A Planet 1', 5, 1.2, 13000, TRUE, FALSE, 400),
('Vega Planet 1', 6, 2.5, 18000, FALSE, FALSE, 600),
('Andromeda Planet A', 7, 0.9, 11000, TRUE, FALSE, 300),
('Triangulum Planet A', 8, 1.5, 14000, FALSE, FALSE, 450),
('Kepler-452 b', 1, 1.5, 13000, TRUE, FALSE, 385),
('TRAPPIST-1 e', 1, 0.29, 9300, TRUE, FALSE, 6);

-- Insert Moon data (at least 20 rows)
INSERT INTO moon (name, planet_id, diameter_in_km, is_spherical, orbital_period_in_days) VALUES
('Moon', 3, 3474, TRUE, 27.3),
('Phobos', 4, 22, FALSE, 0.3),
('Deimos', 4, 12, FALSE, 1.26),
('Io', 5, 3660, TRUE, 1.77),
('Europa', 5, 3122, TRUE, 3.55),
('Ganymede', 5, 5268, TRUE, 7.15),
('Callisto', 5, 4821, TRUE, 16.69),
('Mimas', 6, 416, TRUE, 0.942),
('Enceladus', 6, 504, TRUE, 1.37),
('Tethys', 6, 1060, TRUE, 1.888),
('Dione', 6, 1123, TRUE, 2.74),
('Rhea', 6, 1527, TRUE, 4.52),
('Titan', 6, 5150, TRUE, 15.95),
('Iapetus', 6, 1470, TRUE, 79.33),
('Ariel', 8, 1158, TRUE, 2.52),
('Umbriel', 8, 1170, TRUE, 4.14),
('Titania', 8, 1578, TRUE, 8.71),
('Oberon', 8, 1523, TRUE, 13.46),
('Triton', 14, 2707, TRUE, 5.88),
('Charon', 14, 1212, TRUE, 6.39),
('Miranda', 8, 471, FALSE, 1.41),
('Phebe', 6, 220, FALSE, 549);

-- Insert Satellite data (for the 5th table requirement)
INSERT INTO satellite (name, planet_id, satellite_type, discovery_year, is_artificial) VALUES
('Hubble Space Telescope', 3, 'Space Observatory', 1990, TRUE),
('ISS', 3, 'Space Station', 1998, TRUE),
('Geostationary Satellite 1', 3, 'Communications', 1965, TRUE),
('Sputnik 1', 3, 'Historical', 1957, TRUE),
('Voyager 1', 5, 'Space Probe', 1977, TRUE);
