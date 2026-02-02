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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (64, 'user_1770071833324', 2, 127);
INSERT INTO public.players VALUES (75, 'user_1770072597934', 2, 296);
INSERT INTO public.players VALUES (63, 'user_1770071833325', 5, 479);
INSERT INTO public.players VALUES (74, 'user_1770072597935', 5, 175);
INSERT INTO public.players VALUES (66, 'user_1770071867516', 2, 65);
INSERT INTO public.players VALUES (65, 'user_1770071867517', 5, 97);
INSERT INTO public.players VALUES (77, 'user_1770072759529', 2, 59);
INSERT INTO public.players VALUES (76, 'user_1770072759530', 5, 295);
INSERT INTO public.players VALUES (68, 'user_1770072093524', 2, 648);
INSERT INTO public.players VALUES (67, 'user_1770072093525', 5, 169);
INSERT INTO public.players VALUES (70, 'user_1770072154326', 2, 260);
INSERT INTO public.players VALUES (79, 'user_1770072773797', 2, 320);
INSERT INTO public.players VALUES (69, 'user_1770072154327', 5, 328);
INSERT INTO public.players VALUES (71, 'w', 2, 9);
INSERT INTO public.players VALUES (78, 'user_1770072773798', 5, 188);
INSERT INTO public.players VALUES (73, 'user_1770072558840', 2, 472);
INSERT INTO public.players VALUES (72, 'user_1770072558841', 5, 312);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 79, true);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- PostgreSQL database dump complete
--

