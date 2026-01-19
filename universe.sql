--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(30) NOT NULL,
    star character varying(30) NOT NULL,
    life boolean
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
    name character varying(30),
    stars character varying(30),
    diameter_km integer NOT NULL,
    weight_kg integer NOT NULL
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
    name character varying(30),
    life boolean,
    diameter_km integer NOT NULL,
    weight_kg integer NOT NULL,
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
    name character varying(30),
    moons character varying(30),
    diameter_km integer NOT NULL,
    weight_kg integer NOT NULL,
    number_to_star numeric,
    description text,
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
    name character varying(30),
    planets character varying(30),
    diameter_km integer NOT NULL,
    weight_kg integer NOT NULL,
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

INSERT INTO public.comet VALUES (1, 'comet name10', 'star_name 1', NULL);
INSERT INTO public.comet VALUES (2, 'comet name20', 'star_name 2', NULL);
INSERT INTO public.comet VALUES (3, 'comet name30', 'star_name 3', NULL);
INSERT INTO public.comet VALUES (4, 'comet name40', 'star_name 4', NULL);
INSERT INTO public.comet VALUES (5, 'comet name50', 'star_name 5', NULL);
INSERT INTO public.comet VALUES (6, 'comet name60', 'star_name 6', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'name 1', '4', 530000, 120000);
INSERT INTO public.galaxy VALUES (2, 'name 2', '2', 560000, 140000);
INSERT INTO public.galaxy VALUES (3, 'name 3', '7', 590000, 160000);
INSERT INTO public.galaxy VALUES (4, 'name 4', '5', 620000, 180000);
INSERT INTO public.galaxy VALUES (5, 'name 5', '2', 650000, 200000);
INSERT INTO public.galaxy VALUES (6, 'name 6', '9', 680000, 220000);
INSERT INTO public.galaxy VALUES (7, 'name 7', '8', 710000, 240000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'name1', false, 1000, 1000000, 1);
INSERT INTO public.moon VALUES (2, 'name2', false, 1000, 1000000, 1);
INSERT INTO public.moon VALUES (3, 'name3', false, 1000, 1000000, 4);
INSERT INTO public.moon VALUES (4, 'name4', false, 1000, 1000000, 4);
INSERT INTO public.moon VALUES (5, 'name5', false, 1000, 1000000, 1);
INSERT INTO public.moon VALUES (6, 'name6', false, 1000, 1000000, 2);
INSERT INTO public.moon VALUES (7, 'name7', false, 1000, 1000000, 3);
INSERT INTO public.moon VALUES (8, 'name8', false, 1000, 1000000, 2);
INSERT INTO public.moon VALUES (9, 'name9', false, 1000, 1000000, 1);
INSERT INTO public.moon VALUES (10, 'name10', false, 1000, 1000000, 5);
INSERT INTO public.moon VALUES (11, 'name11', false, 1000, 1000000, 1);
INSERT INTO public.moon VALUES (13, 'name15', false, 1000, 1000000, 2);
INSERT INTO public.moon VALUES (14, 'name17', false, 1000, 1000000, 2);
INSERT INTO public.moon VALUES (15, 'name19', false, 1000, 1000000, 4);
INSERT INTO public.moon VALUES (16, 'name33', false, 1000, 1000000, 3);
INSERT INTO public.moon VALUES (17, 'name191', false, 1000, 1000000, 3);
INSERT INTO public.moon VALUES (18, 'name22', false, 1000, 1000000, 1);
INSERT INTO public.moon VALUES (19, 'name92', false, 1000, 1000000, 5);
INSERT INTO public.moon VALUES (20, 'name93', false, 1000, 1000000, 2);
INSERT INTO public.moon VALUES (21, 'name94', false, 1000, 1000000, 2);
INSERT INTO public.moon VALUES (22, 'name95', false, 1000, 1000000, 5);
INSERT INTO public.moon VALUES (23, 'name96', false, 1000, 1000000, 2);
INSERT INTO public.moon VALUES (24, 'name97', false, 1000, 1000000, 4);
INSERT INTO public.moon VALUES (25, 'name98', false, 1000, 1000000, 5);
INSERT INTO public.moon VALUES (26, 'name99', false, 1000, 1000000, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'name 1', 'moon 1', 3000, 150, NULL, NULL, 5);
INSERT INTO public.planet VALUES (2, 'name 2', 'moon 2', 4000, 200, NULL, NULL, 4);
INSERT INTO public.planet VALUES (3, 'name 3', 'moon 3', 5000, 250, NULL, NULL, 1);
INSERT INTO public.planet VALUES (4, 'name 4', 'moon 4', 6000, 300, NULL, NULL, 4);
INSERT INTO public.planet VALUES (5, 'name 5', 'moon 5', 7000, 350, NULL, NULL, 4);
INSERT INTO public.planet VALUES (6, 'name 6', 'moon 6', 8000, 400, NULL, NULL, 4);
INSERT INTO public.planet VALUES (7, 'name 7', 'moon 7', 9000, 450, NULL, NULL, 1);
INSERT INTO public.planet VALUES (8, 'name 8', 'moon 8', 10000, 500, NULL, NULL, 1);
INSERT INTO public.planet VALUES (9, 'name 9', 'moon 9', 11000, 550, NULL, NULL, 5);
INSERT INTO public.planet VALUES (10, 'name 10', 'moon 10', 12000, 600, NULL, NULL, 2);
INSERT INTO public.planet VALUES (11, 'name 11', 'moon 11', 13000, 650, NULL, NULL, 5);
INSERT INTO public.planet VALUES (12, 'name 12', 'moon 12', 14000, 700, NULL, NULL, 2);
INSERT INTO public.planet VALUES (13, 'name 13', 'moon 13', 15000, 750, NULL, NULL, 5);
INSERT INTO public.planet VALUES (14, 'name 14', 'moon 14', 16000, 800, NULL, NULL, 2);
INSERT INTO public.planet VALUES (15, 'name 15', 'moon 15', 17000, 850, NULL, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'name 1', NULL, 60000, 6000, 1);
INSERT INTO public.star VALUES (2, 'name 2', NULL, 70000, 11000, 1);
INSERT INTO public.star VALUES (3, 'name 3', NULL, 80000, 16000, 1);
INSERT INTO public.star VALUES (4, 'name 4', NULL, 90000, 21000, 1);
INSERT INTO public.star VALUES (5, 'name 5', NULL, 100000, 26000, 1);
INSERT INTO public.star VALUES (6, 'name 6', NULL, 110000, 31000, 1);
INSERT INTO public.star VALUES (7, 'name 7', NULL, 120000, 36000, 1);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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

