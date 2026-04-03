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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('tester', 0, NULL);
INSERT INTO public.users VALUES ('user_1775237233479', 2, 122);
INSERT INTO public.users VALUES ('user_1775237233480', 5, 490);
INSERT INTO public.users VALUES ('user1', 0, NULL);
INSERT INTO public.users VALUES ('user_1775237859385', 2, 34);
INSERT INTO public.users VALUES ('user_1775237307071', 2, 511);
INSERT INTO public.users VALUES ('user_1775237859386', 5, 71);
INSERT INTO public.users VALUES ('user_1775237307072', 5, 272);
INSERT INTO public.users VALUES ('user_1775237367664', 2, 141);
INSERT INTO public.users VALUES ('user_1775237881499', 2, 402);
INSERT INTO public.users VALUES ('user_1775237367665', 5, 35);
INSERT INTO public.users VALUES ('user_1775237881500', 5, 83);
INSERT INTO public.users VALUES ('user_1775237422682', 2, 533);
INSERT INTO public.users VALUES ('user_1775237422683', 5, 35);
INSERT INTO public.users VALUES ('user_1775237433583', 2, 455);
INSERT INTO public.users VALUES ('user_1775237934563', 2, 532);
INSERT INTO public.users VALUES ('user_1775237433584', 5, 25);
INSERT INTO public.users VALUES ('user_1775237934564', 5, 323);
INSERT INTO public.users VALUES ('user_1775237484104', 2, 442);
INSERT INTO public.users VALUES ('user_1775237484105', 5, 265);
INSERT INTO public.users VALUES ('user_1775237944371', 2, 517);
INSERT INTO public.users VALUES ('user_1775237544401', 2, 297);
INSERT INTO public.users VALUES ('user_1775237544402', 5, 15);
INSERT INTO public.users VALUES ('user_1775237944372', 5, 214);
INSERT INTO public.users VALUES ('user_1775237711797', 2, 476);
INSERT INTO public.users VALUES ('user_1775237711798', 5, 23);
INSERT INTO public.users VALUES ('user_1775238004637', 2, 725);
INSERT INTO public.users VALUES ('user_1775238004638', 5, 153);
INSERT INTO public.users VALUES ('user_1775238151943', 2, 108);
INSERT INTO public.users VALUES ('user_1775238151944', 5, 315);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

