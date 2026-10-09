Jujutsu Kaisen


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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    hemisphere character varying(20) NOT NULL,
    star_count integer NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.constellation ALTER COLUMN constellation_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.constellation_constellation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    age_million_years integer NOT NULL,
    diameter_ly numeric(12,2),
    has_black_hole boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    surface_description text NOT NULL,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(50) NOT NULL,
    diameter_km integer NOT NULL,
    has_atmosphere boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(50) NOT NULL,
    temperature_k integer NOT NULL,
    is_binary boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation OVERRIDING SYSTEM VALUE VALUES (1, 'Orion', 'Both', 81, 'A prominent constellation containing many bright stars.');
INSERT INTO public.constellation OVERRIDING SYSTEM VALUE VALUES (2, 'Ursa Major', 'Northern', 209, 'A large northern constellation famous for the Big Dipper.');
INSERT INTO public.constellation OVERRIDING SYSTEM VALUE VALUES (3, 'Crux', 'Southern', 49, 'A compact southern constellation known as the Southern Cross.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (1, 'Milky Way', 'Spiral', 13600, 100000.00, true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (2, 'Andromeda', 'Spiral', 10000, 120000.00, true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (3, 'Triangulum', 'Spiral', 8000, 60000.00, true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (4, 'Sombrero', 'Spiral', 9000, 50000.00, true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (5, 'Whirlpool', 'Spiral', 9000, 76000.00, true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (6, 'Large Magellanic Cloud', 'Irregular', 13000, 14000.00, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 'Luna', 3, 3475, 'Rocky highlands and ancient craters', true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 'Phobos', 4, 22, 'Dark irregular rocky surface', false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 'Deimos', 4, 13, 'Small cratered rocky surface', false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 'Io', 5, 3643, 'Volcanic sulfur-rich surface', true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 'Europa', 5, 3122, 'Icy surface with possible subsurface ocean', true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 'Ganymede', 5, 5268, 'Ice and rock with grooved terrain', true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 'Callisto', 5, 4821, 'Ancient heavily cratered surface', true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 'Titan', 6, 5150, 'Icy surface with thick atmosphere', true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 'Rhea', 6, 1528, 'Bright icy cratered surface', true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 'Iapetus', 6, 1469, 'Two-toned icy and rocky surface', true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 'Dione', 6, 1123, 'Bright ice cliffs and cratered terrain', true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 'Triton', 6, 2706, 'Nitrogen ice and cryovolcanic terrain', true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 'Selene', 7, 2900, 'Silver-gray rocky terrain', true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 'Nyx', 7, 1800, 'Dark rocky plains', true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 'Gaia Minor', 8, 2400, 'Mountainous continental surface', true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 'Aster', 8, 950, 'Cratered rocky terrain', true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 'Orpheus', 9, 3100, 'Icy ridges and frozen plains', true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 'Lyra', 10, 1700, 'Blue-white icy surface', true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 'Vesper', 11, 4300, 'Dense cloudy atmosphere and rocky core', true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 'Solara', 12, 5200, 'Rocky surface with vast canyons', true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, 'Mercury', 1, 'Terrestrial', 4879, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (2, 'Venus', 1, 'Terrestrial', 12104, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, 'Earth', 1, 'Terrestrial', 12742, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, 'Mars', 1, 'Terrestrial', 6779, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (5, 'Jupiter', 1, 'Gas Giant', 139820, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 'Saturn', 1, 'Gas Giant', 116460, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, 'Elysia', 2, 'Terrestrial', 9200, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, 'Aurelia', 2, 'Terrestrial', 15000, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 'Novara', 3, 'Ice Giant', 48000, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 'Tethys Prime', 3, 'Terrestrial', 8100, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 'Helios', 4, 'Gas Giant', 98000, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 'Orionis', 5, 'Super Earth', 21000, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 'Sun', 1, 'G-type', 5778, false);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (2, 'Sirius', 1, 'A-type', 9940, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 'Vega', 1, 'A-type', 9602, false);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (4, 'Betelgeuse', 1, 'M-type', 3500, false);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (5, 'Rigel', 1, 'B-type', 11000, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 'Proxima Centauri', 1, 'M-type', 3042, true);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

