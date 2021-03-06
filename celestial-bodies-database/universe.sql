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
    galaxy_id numeric NOT NULL,
    galaxy_types_id numeric NOT NULL,
    name character varying,
    is_spherical boolean,
    age_in_million_of_years integer,
    distance_from_earth integer,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id numeric NOT NULL,
    name character varying,
    count_galaxy integer,
    description text NOT NULL
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id numeric NOT NULL,
    planet_id numeric NOT NULL,
    name character varying,
    size integer,
    age_in_million_of_years integer,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id numeric NOT NULL,
    star_id numeric NOT NULL,
    name character varying,
    has_life boolean,
    size integer,
    count_moon integer,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id numeric NOT NULL,
    name character varying,
    count_planet integer,
    description text NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id numeric NOT NULL,
    galaxy_id numeric NOT NULL,
    name character varying,
    age_in_million_of_years integer,
    distance_from_earth integer,
    size integer,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 2, 'Млечный путь', true, 2000, 0, 'Это наша галактика.');
INSERT INTO public.galaxy VALUES (2, 2, 'Большое Магелланово Облако', true, 2100, 700, 'Видима только в Южном полушарии');
INSERT INTO public.galaxy VALUES (3, 2, 'Малое Магелланово Облако', true, 2030, 2700, 'Видима только в южном полушарии');
INSERT INTO public.galaxy VALUES (4, 2, 'Галактика Андромеды', true, 2050, 3400, 'Также называется Туманностью Андромеды. Находится в созвездии Андромеды');
INSERT INTO public.galaxy VALUES (5, 2, 'Омега Центавра', true, 2350, 3700, 'Не рассматривается как самостоятельная галактика. В скором времени будет поглощена Млечным Путем');
INSERT INTO public.galaxy VALUES (6, 2, 'Галактика Треугольника', true, 2040, 5700, 'Наблюдение невооруженным глазом очень затруднено');


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Эллиптическая', 22, 'имееет форму эллипса');
INSERT INTO public.galaxy_types VALUES (2, 'Спиральная', 70, 'имеет форму спирали с перемычкой в центре');
INSERT INTO public.galaxy_types VALUES (3, 'Неправильная', 8, 'имеет неправильную форму');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Луна', 5, 2030, 'есть невидимая сторона');
INSERT INTO public.moon VALUES (2, 4, 'Фобос', 3, 2021, 'маленькое пугало');
INSERT INTO public.moon VALUES (3, 2, '2002 VE', 1, 89, 'дружит с Венерой');
INSERT INTO public.moon VALUES (4, 3, '2004 GU', 1, 23, 'может сбить МКС');
INSERT INTO public.moon VALUES (5, 3, '2006 FV', 1, 89, 'передает привет пингвинам');
INSERT INTO public.moon VALUES (6, 3, '2013 LX', 1, 23, 'дружит с космонавтом');
INSERT INTO public.moon VALUES (7, 3, '2014 OL', 1, 89, 'дружит с Луной');
INSERT INTO public.moon VALUES (8, 3, '2016 HO3', 1, 23, 'хочет солнечные очки');
INSERT INTO public.moon VALUES (9, 3, 'Круитини', 1, 12, 'мечтает о французсой булочке');
INSERT INTO public.moon VALUES (10, 3, '2010 TK', 1, 23, 'вулкан на орбите');
INSERT INTO public.moon VALUES (11, 4, '1999 UJ', 1, 87, 'отдых после дефолта');
INSERT INTO public.moon VALUES (12, 4, 'Эврика', 1, 32, 'видел Архимеда в ванной');
INSERT INTO public.moon VALUES (13, 4, '1998 VF', 1, 1, 'дефолтный год');
INSERT INTO public.moon VALUES (14, 4, '2007 NS', 1, 9, 'мюнхен');
INSERT INTO public.moon VALUES (15, 4, '2001 DH', 1, 3, 'море голубое');
INSERT INTO public.moon VALUES (16, 4, '2011 SC', 1, 2, 'гаваи');
INSERT INTO public.moon VALUES (17, 4, '2011l SC', 1, 3, 'рубль');
INSERT INTO public.moon VALUES (18, 4, '2011 SL', 1, 2, 'КВН');
INSERT INTO public.moon VALUES (19, 5, 'Европа', 1, 4, 'юпитер');
INSERT INTO public.moon VALUES (20, 5, 'Карме', 1, 5, 'электроника');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Меркурий', false, 382, 0, 'первая планета Солнечной системы и наиболее экстремальный мир');
INSERT INTO public.planet VALUES (2, 1, 'Венера', false, 949, 0, 'самая горячая планета Солнечной системы');
INSERT INTO public.planet VALUES (3, 1, 'Земля', true, 1, 1, 'наша планета');
INSERT INTO public.planet VALUES (4, 1, 'Марс', false, 53, 2, 'второе имя Красная планета');
INSERT INTO public.planet VALUES (5, 1, 'Церера', false, 7, 0, 'расположена в поясе астероидов Марса и Юпитера');
INSERT INTO public.planet VALUES (6, 1, 'Юпитер', false, 112, 67, 'год длится 11.8 лет');
INSERT INTO public.planet VALUES (7, 1, 'Сатурн', false, 94, 62, 'оборот вокруг своей оси делает за 10.5 часов');
INSERT INTO public.planet VALUES (8, 1, 'Уран', false, 39, 27, 'год длится 84 лет');
INSERT INTO public.planet VALUES (9, 1, 'Нептун', false, 38, 14, 'атмосфера наполнена водородом, гелием, метаном');
INSERT INTO public.planet VALUES (10, 1, 'Плутон', false, 9, 5, 'наибольшая карликовая планета');
INSERT INTO public.planet VALUES (11, 1, 'Хаумеда', false, 38, 2, 'названа в честь гавайской богини');
INSERT INTO public.planet VALUES (12, 1, 'Макемаке', false, 3, 0, 'второе имя Пасхальный Заяц');


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Земные планеты', 4, 'скалистая поверхность');
INSERT INTO public.planet_types VALUES (2, 'Газовые планеты', 4, 'состоят из газа');
INSERT INTO public.planet_types VALUES (3, 'Карликовые планеты', 5, 'малы по размеру и встречаются различные объекты на их пути');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Солнце', 2040, 158, 600, 'видно невооруженным взглядом');
INSERT INTO public.star VALUES (2, 1, 'Сириус Большого Пса', 2040, 86000, 700, 'Видна в Южном получшарии');
INSERT INTO public.star VALUES (3, 1, 'Канопус Киля', 2035, 310000, 460, 'Видна в Южном полушарии');
INSERT INTO public.star VALUES (4, 1, 'Толиман', 2030, 43, 21, 'Видна в Южном полушарии');
INSERT INTO public.star VALUES (5, 1, 'Арктур', 2030, 340, 21, 'Видна в Северном полушарии');
INSERT INTO public.star VALUES (6, 1, 'Вега', 2002, 250, 34, 'Видна в Северном полушарии');


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
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


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

