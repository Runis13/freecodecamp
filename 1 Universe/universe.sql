--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: animal; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.animal (
    animal_id integer NOT NULL,
    name character varying(30) NOT NULL,
    place character varying(30)
);


ALTER TABLE public.animal OWNER TO freecodecamp;

--
-- Name: animal_animal_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.animal_animal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.animal_animal_id_seq OWNER TO freecodecamp;

--
-- Name: animal_animal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.animal_animal_id_seq OWNED BY public.animal.animal_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    center_core_distance_to_earth integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric(30,1),
    was_visited boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: person; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.person (
    person_id integer NOT NULL,
    name character varying(30) NOT NULL,
    place character varying(30)
);


ALTER TABLE public.person OWNER TO freecodecamp;

--
-- Name: person_person_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.person_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_person_id_seq OWNER TO freecodecamp;

--
-- Name: person_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.person_person_id_seq OWNED BY public.person.person_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric(30,1),
    distance_to_earth integer,
    star_id integer,
    is_habitable boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_to_sun integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: animal animal_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.animal ALTER COLUMN animal_id SET DEFAULT nextval('public.animal_animal_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: person person_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.person ALTER COLUMN person_id SET DEFAULT nextval('public.person_person_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: animal; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.animal VALUES (1, 'John Doe', 'New York');
INSERT INTO public.animal VALUES (2, 'Jane Smith', 'Los Angeles');
INSERT INTO public.animal VALUES (3, 'Alice Johnson', 'Chicago');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy containing the Solar System', 13000, 25000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy to Milky Way', 14000, 22000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral galaxy in the Local Group', 13000, 19000);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical galaxy in the Virgo Cluster', 60000, 54000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral galaxy undergoing a merger', 20000, 31000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral galaxy with a prominent dust lane', 80000, 41000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Earth''s only natural satellite', 4500.1, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Larger and innermost of the two natural satellites of Mars', 4520.8, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller and outermost of the two natural satellites of Mars', 4520.8, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Innermost of the four Galilean moons of Jupiter', 4600.3, false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Second-closest of the Galilean moons to Jupiter', 4600.3, false, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest and most massive of Jupiter''s moons', 4600.3, false, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Second-largest of Jupiter''s moons', 4600.3, false, 5);
INSERT INTO public.moon VALUES (8, 'Mimas', 'Smallest and innermost of Saturn''s major moons', 4595.7, false, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Second-largest moon of Saturn', 4595.7, false, 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 'Saturn''s fifth-largest moon', 4595.7, false, 6);
INSERT INTO public.moon VALUES (11, 'Titan', 'Largest moon of Saturn', 4595.7, true, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 'Second-largest moon of Saturn after Titan', 4595.7, false, 6);
INSERT INTO public.moon VALUES (13, 'Titania', 'Largest moon of Uranus', 4560.6, false, 7);
INSERT INTO public.moon VALUES (14, 'Oberon', 'Second-largest moon of Uranus', 4560.6, false, 7);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Smallest and innermost of Uranus''s five major moons', 4560.6, false, 7);
INSERT INTO public.moon VALUES (16, 'Triton', 'Largest natural satellite of Neptune', 4542.1, false, 8);
INSERT INTO public.moon VALUES (17, 'Nereid', 'Third-largest moon of Neptune', 4542.1, false, 8);
INSERT INTO public.moon VALUES (18, 'Charon', 'Largest moon of Pluto', 4589.2, true, 9);
INSERT INTO public.moon VALUES (19, 'Hydra', 'Small, irregularly shaped moon of Pluto', 4589.2, false, 9);
INSERT INTO public.moon VALUES (20, 'Styx', 'Innermost and second smallest moon of Pluto', 4589.2, false, 9);


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.person VALUES (1, 'John Doe', 'New York');
INSERT INTO public.person VALUES (2, 'Jane Smith', 'Los Angeles');
INSERT INTO public.person VALUES (3, 'Alice Johnson', 'Chicago');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Smallest planet in the Solar System', 4540.5, 77, 1, false);
INSERT INTO public.planet VALUES (2, 'Venus', 'Second planet from the Sun', 4500.1, 38, 1, false);
INSERT INTO public.planet VALUES (3, 'Earth', 'Third planet from the Sun', 4500.1, 0, 1, true);
INSERT INTO public.planet VALUES (4, 'Mars', 'Fourth planet from the Sun', 4520.8, 54, 1, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Fifth planet from the Sun and the largest in the Solar System', 4600.3, 628, 1, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Sixth planet from the Sun and the second-largest in the Solar System', 4595.7, 1279, 1, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Seventh planet from the Sun', 4560.6, 2722, 1, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Eighth and farthest known Solar planet from the Sun', 4542.1, 4345, 1, false);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf planet in the Kuiper belt', 4589.2, 5073, 1, false);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 'Exoplanet orbiting Proxima Centauri', 1300.8, 4, 2, true);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', 'Exoplanet orbiting within the habitable zone of the Sun-like star Kepler-22', 1514.7, 587, 2, true);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 'First exoplanet to be discovered transiting in front of its parent star', 2021.5, 159, 3, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Main sequence star', 4600, 0, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 'Binary star system', 6000, 4, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'Binary star system', 240, 9, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red supergiant star', 10, 640, 2);
INSERT INTO public.star VALUES (5, 'Vega', 'Main sequence star', 455, 25, 3);
INSERT INTO public.star VALUES (6, 'Antares', 'Red supergiant star', 12, 550, 4);


--
-- Name: animal_animal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.animal_animal_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: person_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.person_person_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: animal animal_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.animal
    ADD CONSTRAINT animal_pkey PRIMARY KEY (animal_id);


--
-- Name: animal animal_place_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.animal
    ADD CONSTRAINT animal_place_key UNIQUE (place);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (person_id);


--
-- Name: person person_place_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_place_key UNIQUE (place);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

