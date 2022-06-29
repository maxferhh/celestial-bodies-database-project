--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_type character varying(40),
    age_in_billions_of_years numeric(5,2),
    distance_from_earth_mly numeric(5,3),
    description text
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
    name character varying(40) NOT NULL,
    moon_type character varying(40),
    diameter_km numeric(12,2),
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_type character varying(40) NOT NULL,
    jupiter_mass numeric(4,2) NOT NULL,
    orbital_period_years numeric(6,2) NOT NULL,
    is_habitable boolean NOT NULL,
    has_moons boolean,
    star_id integer
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
    name character varying(40) NOT NULL,
    star_type character varying(40),
    age_in_billions_of_years numeric(5,2),
    surface_temperature_in_kelvin integer,
    number_planets_in_orbit integer,
    galaxy_id integer NOT NULL
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, '1P/Halley', 6);
INSERT INTO public.comet VALUES (2, '2I/Borisov', 6);
INSERT INTO public.comet VALUES (3, '19P/Borrelly', 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Messier 31', 'Spiral', 10.01, 2.500, 'Famously known as Andromeda galaxy');
INSERT INTO public.galaxy VALUES (2, 'Messier 64', 'Spiral', 13.28, 17.000, 'First discovered by Edward Pigott in March 1779. Also known as Black Eye galaxy.');
INSERT INTO public.galaxy VALUES (3, 'Messier 81', 'Spiral', 13.31, 11.600, 'Discovered by Johann Elert Bode in 1774, Bodes galaxy is one of the brightest in the sky');
INSERT INTO public.galaxy VALUES (4, 'Messier 82', 'Irregular', 13.30, 12.000, 'Called the Cigar galaxy was discovered by Johann Elert Bode in 1774');
INSERT INTO public.galaxy VALUES (5, 'Abell 2667', 'Spiral', NULL, 3.200, 'Detected by the Hubble Space Telescope on March 2007 is also called the Comet galaxy.');
INSERT INTO public.galaxy VALUES (6, 'The Milky Way', 'Spiral', 13.61, 0.027, 'The galaxy that includes our solar system');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Titan', 'Icy Moon', 5149.20, 1);
INSERT INTO public.moon VALUES (2, 'Enceladus', 'Icy Moon', 504.00, 1);
INSERT INTO public.moon VALUES (3, 'Dione', 'Icy Moon', 1120.00, 1);
INSERT INTO public.moon VALUES (4, 'Hyperion', 'Irregular Moon', 270.00, 1);
INSERT INTO public.moon VALUES (5, 'Lapetus', 'Icy Moon', 1472.00, 1);
INSERT INTO public.moon VALUES (6, 'Mimas', 'Icy Moon', 396.00, 1);
INSERT INTO public.moon VALUES (7, 'Rhea', 'Icy Moon', 1528.00, 1);
INSERT INTO public.moon VALUES (8, 'Despina', 'Irregular Moon', 160.00, 2);
INSERT INTO public.moon VALUES (9, 'Triton', 'Icy Moon', 2400.00, 2);
INSERT INTO public.moon VALUES (10, 'Proteus', 'Irregular Moon', 425.00, 2);
INSERT INTO public.moon VALUES (12, 'Naiad', 'Irregular Moon', 65.00, 2);
INSERT INTO public.moon VALUES (13, 'Galatea', 'Irregular Moon', 90.30, 2);
INSERT INTO public.moon VALUES (14, 'Ariel', 'Rock & Icy Moon', 1055.00, 3);
INSERT INTO public.moon VALUES (15, 'Oberon', 'Rock & Icy Moon', 1423.00, 3);
INSERT INTO public.moon VALUES (16, 'Rosalind', 'Irregular Moon', 64.00, 3);
INSERT INTO public.moon VALUES (17, 'Titania', 'Rock & Icy Moon', 1596.00, 3);
INSERT INTO public.moon VALUES (18, 'Umbriel', 'Icy Moon', 1200.00, 3);
INSERT INTO public.moon VALUES (19, 'Miranda', 'Icy Moon', 500.00, 3);
INSERT INTO public.moon VALUES (20, 'Puck', 'Irregular Moon', 150.00, 3);
INSERT INTO public.moon VALUES (11, 'Larissa', 'Irregular Moon', 200.00, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Neptune', 'Ice Giant', 0.05, 165.00, false, true, 5);
INSERT INTO public.planet VALUES (1, 'Saturn', 'Gas Giant', 0.30, 29.40, false, true, 5);
INSERT INTO public.planet VALUES (3, 'Uranus', 'Ice Giant', 0.04, 84.00, false, true, 5);
INSERT INTO public.planet VALUES (4, '55 Cancri d', 'Gas Giant', 3.88, 15.30, false, NULL, 1);
INSERT INTO public.planet VALUES (6, '47 Ursae Majoris b', 'Gas Giant', 2.53, 3.00, false, NULL, 2);
INSERT INTO public.planet VALUES (7, '47 Ursae Majoris d', 'Gas Giant', 1.64, 38.40, false, NULL, 2);
INSERT INTO public.planet VALUES (5, '55 Cancri b', 'Gas Giant', 0.83, 0.04, false, NULL, 1);
INSERT INTO public.planet VALUES (8, '61 Virginis d', 'Neptune-like', 0.07, 0.35, false, NULL, 4);
INSERT INTO public.planet VALUES (9, '24 Sextantis b', 'Gas Giant', 1.99, 452.80, false, NULL, 3);
INSERT INTO public.planet VALUES (10, '24 Sextantis c', 'Gas Giant', 0.86, 2.40, false, NULL, 3);
INSERT INTO public.planet VALUES (11, '7 Canis Majoris b', 'Gas Giant', 1.85, 2.00, false, NULL, 6);
INSERT INTO public.planet VALUES (12, '7 Canis Majoric c', 'Gas Giant', 0.87, 2.70, false, NULL, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, '55 Cancri A', 'G8V', 5.50, 5240, 4, 6);
INSERT INTO public.star VALUES (2, '47 Ursae Majoris', 'G1V', 6.03, 5740, 3, 6);
INSERT INTO public.star VALUES (3, '24 Sextantis', 'K0 IV', 2.80, 5098, 2, 6);
INSERT INTO public.star VALUES (4, '61 Virginis', 'G7V', 6.60, 5538, 3, 6);
INSERT INTO public.star VALUES (5, 'Sun', 'G2V', 4.60, 5778, 8, 6);
INSERT INTO public.star VALUES (6, '7 Canis Majoris', 'K1 IV', 4.60, 4790, 2, 6);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: comet comet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

