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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_types character varying(50),
    description text,
    number_of_stars character varying(50)
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
    is_spherical boolean,
    has_atmosphere boolean,
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_types character varying(30),
    has_life boolean,
    number_of_satellites integer,
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
    name character varying(30) NOT NULL,
    diameter numeric,
    star_type character varying(30),
    temperature_in_k integer,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sb', 'The term of Milky Way is a translation of the Latin via lactea', '100-500 billion');
INSERT INTO public.galaxy VALUES (2, 'Small Magellanic Cloud', 'SB(s)m pec', 'SMC is a dwarf galaxy near Milky Way', '3 billion');
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'SB(s)m', 'LMC is a sattellite galaxy of the Milky Way', '20 billion');
INSERT INTO public.galaxy VALUES (4, 'Malin 1', 'SB0a', 'Malin 1 is a giant low surface brightness spiral galaxy', 'hundreds of billions');
INSERT INTO public.galaxy VALUES (5, 'Andromeda Galaxy', 'SA(s)b', 'Andromeda Galaxy is a barred spiral galaxy', '~1 trillion');
INSERT INTO public.galaxy VALUES (6, 'Hercules A', 'cD; E3', 'a bright astronomical radio source corresponding to the galaxy 3C 348', 'NA');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', true, false, 9);
INSERT INTO public.moon VALUES (2, 'Phobos', false, false, 10);
INSERT INTO public.moon VALUES (3, 'Deimos', false, false, 10);
INSERT INTO public.moon VALUES (4, 'Io', true, true, 9);
INSERT INTO public.moon VALUES (5, 'Europa', true, true, 9);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, true, 9);
INSERT INTO public.moon VALUES (7, 'Callisto', true, true, 9);
INSERT INTO public.moon VALUES (8, 'Titan', true, true, 12);
INSERT INTO public.moon VALUES (9, 'Enceladus', true, false, 12);
INSERT INTO public.moon VALUES (10, 'Mimas', true, false, 12);
INSERT INTO public.moon VALUES (11, 'Rhea', true, true, 12);
INSERT INTO public.moon VALUES (12, 'Dione', true, true, 12);
INSERT INTO public.moon VALUES (13, 'Tethys', true, true, 12);
INSERT INTO public.moon VALUES (14, 'Hyperion', false, true, 12);
INSERT INTO public.moon VALUES (15, 'Phoebe', false, true, 12);
INSERT INTO public.moon VALUES (16, 'Charon', true, true, 6);
INSERT INTO public.moon VALUES (17, 'Nix', false, true, 6);
INSERT INTO public.moon VALUES (18, 'Hydra', false, true, 6);
INSERT INTO public.moon VALUES (19, 'Ariel', true, true, 9);
INSERT INTO public.moon VALUES (20, 'Umbriel', true, false, 9);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Eagle Nebula', 1);
INSERT INTO public.nebula VALUES (2, 'Ring Nebula', 5);
INSERT INTO public.nebula VALUES (3, 'Tarantula Nebula', 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Betelgeuse b', 'rocky', false, 0, 2);
INSERT INTO public.planet VALUES (2, 'Sirius B b', 'gas giant', false, 4, 1);
INSERT INTO public.planet VALUES (3, 'Betelgeuse A b', 'ice giant', false, 2, 1);
INSERT INTO public.planet VALUES (4, 'Rigel A c', 'rocky', false, 1, 3);
INSERT INTO public.planet VALUES (5, 'Andromeda XXVIII d', 'rocky', false, 0, 5);
INSERT INTO public.planet VALUES (6, 'Sol d', 'rocky', true, 1, 7);
INSERT INTO public.planet VALUES (7, 'Mercury', 'rocky', false, 0, 7);
INSERT INTO public.planet VALUES (8, 'Venus', 'rocky', false, 0, 7);
INSERT INTO public.planet VALUES (9, 'Earth', 'rocky', true, 1, 7);
INSERT INTO public.planet VALUES (10, 'Mars', 'rocky', false, 2, 7);
INSERT INTO public.planet VALUES (11, 'Jupiter', 'gas giant', false, 79, 7);
INSERT INTO public.planet VALUES (12, 'Saturn', 'gas giant', false, 82, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1.7, 'A1V', 9940, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1180, 'M1-2la-lab', 3600, 1);
INSERT INTO public.star VALUES (3, 'Rigel', 70, 'B8la', 11000, 1);
INSERT INTO public.star VALUES (4, 'R136a1', 36.4, 'Wolf-Rayet', 53000, 3);
INSERT INTO public.star VALUES (5, 'Andromeda XXVIII', 9.4, 'K', 5700, 5);
INSERT INTO public.star VALUES (6, 'Polaris', 5.4, 'F7lb-ll', 3600, 1);
INSERT INTO public.star VALUES (7, 'Sun', 1, 'G2V', 5700, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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
-- Name: nebula nebula_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

