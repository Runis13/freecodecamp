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

DROP DATABASE usernames;
--
-- Name: usernames; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE usernames WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE usernames OWNER TO freecodecamp;

\connect usernames

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 1000
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1717882208079', 2, 71);
INSERT INTO public.users VALUES ('user_1717882208080', 5, 121);
INSERT INTO public.users VALUES ('user_1717882897674', 2, 831);
INSERT INTO public.users VALUES ('user_1717882897675', 5, 497);
INSERT INTO public.users VALUES ('user_1717882298389', 2, 845);
INSERT INTO public.users VALUES ('user_1717882298390', 5, 6);
INSERT INTO public.users VALUES ('user_1717882399296', 2, 10);
INSERT INTO public.users VALUES ('user_1717882399297', 5, 3);
INSERT INTO public.users VALUES ('rui', 2, 6);
INSERT INTO public.users VALUES ('user_1717882444425', 2, 25);
INSERT INTO public.users VALUES ('user_1717882444426', 5, 151);
INSERT INTO public.users VALUES ('user_1717882492581', 2, 182);
INSERT INTO public.users VALUES ('user_1717882492582', 5, 79);
INSERT INTO public.users VALUES ('teste', 0, 1000);
INSERT INTO public.users VALUES ('teste4', 0, 1000);
INSERT INTO public.users VALUES ('user_1717882863169', 2, 432);
INSERT INTO public.users VALUES ('user_1717882863170', 5, 310);
INSERT INTO public.users VALUES ('user_1717882877133', 2, 548);
INSERT INTO public.users VALUES ('user_1717882877134', 5, 61);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

