--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17 (Homebrew)
-- Dumped by pg_dump version 17.0

-- Started on 2025-05-17 11:16:49 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: dawidkostka
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO dawidkostka;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16757)
-- Name: cache; Type: TABLE; Schema: public; Owner: dawidkostka
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO dawidkostka;

--
-- TOC entry 216 (class 1259 OID 16764)
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: dawidkostka
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO dawidkostka;

--
-- TOC entry 227 (class 1259 OID 16815)
-- Name: categories; Type: TABLE; Schema: public; Owner: dawidkostka
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.categories OWNER TO dawidkostka;

--
-- TOC entry 226 (class 1259 OID 16814)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: dawidkostka
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO dawidkostka;

--
-- TOC entry 3912 (class 0 OID 0)
-- Dependencies: 226
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dawidkostka
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 223 (class 1259 OID 16801)
-- Name: cities; Type: TABLE; Schema: public; Owner: dawidkostka
--

CREATE TABLE public.cities (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.cities OWNER TO dawidkostka;

--
-- TOC entry 222 (class 1259 OID 16800)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: dawidkostka
--

CREATE SEQUENCE public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cities_id_seq OWNER TO dawidkostka;

--
-- TOC entry 3913 (class 0 OID 0)
-- Dependencies: 222
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dawidkostka
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- TOC entry 221 (class 1259 OID 16789)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: dawidkostka
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO dawidkostka;

--
-- TOC entry 220 (class 1259 OID 16788)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: dawidkostka
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO dawidkostka;

--
-- TOC entry 3914 (class 0 OID 0)
-- Dependencies: 220
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dawidkostka
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 219 (class 1259 OID 16781)
-- Name: job_batches; Type: TABLE; Schema: public; Owner: dawidkostka
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO dawidkostka;

--
-- TOC entry 218 (class 1259 OID 16772)
-- Name: jobs; Type: TABLE; Schema: public; Owner: dawidkostka
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO dawidkostka;

--
-- TOC entry 217 (class 1259 OID 16771)
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: dawidkostka
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO dawidkostka;

--
-- TOC entry 3915 (class 0 OID 0)
-- Dependencies: 217
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dawidkostka
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- TOC entry 229 (class 1259 OID 16822)
-- Name: meetup_locations; Type: TABLE; Schema: public; Owner: dawidkostka
--

CREATE TABLE public.meetup_locations (
    id bigint NOT NULL,
    address character varying(255) NOT NULL,
    city_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.meetup_locations OWNER TO dawidkostka;

--
-- TOC entry 228 (class 1259 OID 16821)
-- Name: meetup_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: dawidkostka
--

CREATE SEQUENCE public.meetup_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.meetup_locations_id_seq OWNER TO dawidkostka;

--
-- TOC entry 3916 (class 0 OID 0)
-- Dependencies: 228
-- Name: meetup_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dawidkostka
--

ALTER SEQUENCE public.meetup_locations_id_seq OWNED BY public.meetup_locations.id;


--
-- TOC entry 231 (class 1259 OID 16834)
-- Name: meetups; Type: TABLE; Schema: public; Owner: dawidkostka
--

CREATE TABLE public.meetups (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    date timestamp(0) without time zone NOT NULL,
    organizer_id bigint,
    location_id bigint NOT NULL,
    category_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.meetups OWNER TO dawidkostka;

--
-- TOC entry 230 (class 1259 OID 16833)
-- Name: meetups_id_seq; Type: SEQUENCE; Schema: public; Owner: dawidkostka
--

CREATE SEQUENCE public.meetups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.meetups_id_seq OWNER TO dawidkostka;

--
-- TOC entry 3917 (class 0 OID 0)
-- Dependencies: 230
-- Name: meetups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dawidkostka
--

ALTER SEQUENCE public.meetups_id_seq OWNED BY public.meetups.id;


--
-- TOC entry 210 (class 1259 OID 16724)
-- Name: migrations; Type: TABLE; Schema: public; Owner: dawidkostka
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO dawidkostka;

--
-- TOC entry 209 (class 1259 OID 16723)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: dawidkostka
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO dawidkostka;

--
-- TOC entry 3918 (class 0 OID 0)
-- Dependencies: 209
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dawidkostka
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 225 (class 1259 OID 16808)
-- Name: organizers; Type: TABLE; Schema: public; Owner: dawidkostka
--

CREATE TABLE public.organizers (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.organizers OWNER TO dawidkostka;

--
-- TOC entry 224 (class 1259 OID 16807)
-- Name: organizers_id_seq; Type: SEQUENCE; Schema: public; Owner: dawidkostka
--

CREATE SEQUENCE public.organizers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.organizers_id_seq OWNER TO dawidkostka;

--
-- TOC entry 3919 (class 0 OID 0)
-- Dependencies: 224
-- Name: organizers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dawidkostka
--

ALTER SEQUENCE public.organizers_id_seq OWNED BY public.organizers.id;


--
-- TOC entry 213 (class 1259 OID 16741)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: dawidkostka
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO dawidkostka;

--
-- TOC entry 214 (class 1259 OID 16748)
-- Name: sessions; Type: TABLE; Schema: public; Owner: dawidkostka
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO dawidkostka;

--
-- TOC entry 212 (class 1259 OID 16731)
-- Name: users; Type: TABLE; Schema: public; Owner: dawidkostka
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO dawidkostka;

--
-- TOC entry 211 (class 1259 OID 16730)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: dawidkostka
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO dawidkostka;

--
-- TOC entry 3920 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dawidkostka
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3702 (class 2604 OID 16818)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 3700 (class 2604 OID 16804)
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- TOC entry 3698 (class 2604 OID 16792)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 3697 (class 2604 OID 16775)
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 3703 (class 2604 OID 16825)
-- Name: meetup_locations id; Type: DEFAULT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.meetup_locations ALTER COLUMN id SET DEFAULT nextval('public.meetup_locations_id_seq'::regclass);


--
-- TOC entry 3704 (class 2604 OID 16837)
-- Name: meetups id; Type: DEFAULT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.meetups ALTER COLUMN id SET DEFAULT nextval('public.meetups_id_seq'::regclass);


--
-- TOC entry 3695 (class 2604 OID 16727)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3701 (class 2604 OID 16811)
-- Name: organizers id; Type: DEFAULT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.organizers ALTER COLUMN id SET DEFAULT nextval('public.organizers_id_seq'::regclass);


--
-- TOC entry 3696 (class 2604 OID 16734)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3889 (class 0 OID 16757)
-- Dependencies: 215
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: dawidkostka
--



--
-- TOC entry 3890 (class 0 OID 16764)
-- Dependencies: 216
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: dawidkostka
--



--
-- TOC entry 3901 (class 0 OID 16815)
-- Dependencies: 227
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: dawidkostka
--

INSERT INTO public.categories VALUES (1, 'programming', '2025-05-17 08:50:42', '2025-05-17 08:50:42');
INSERT INTO public.categories VALUES (2, 'other', '2025-05-17 08:50:42', '2025-05-17 08:50:42');
INSERT INTO public.categories VALUES (3, 'business', '2025-05-17 08:50:42', '2025-05-17 08:50:42');
INSERT INTO public.categories VALUES (4, 'marketing', '2025-05-17 08:50:42', '2025-05-17 08:50:42');
INSERT INTO public.categories VALUES (5, 'design', '2025-05-17 08:57:18', '2025-05-17 08:57:18');


--
-- TOC entry 3897 (class 0 OID 16801)
-- Dependencies: 223
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: dawidkostka
--

INSERT INTO public.cities VALUES (1, 'Warsaw', '2025-05-17 08:50:42', '2025-05-17 08:50:42');
INSERT INTO public.cities VALUES (2, 'Krakow', '2025-05-17 08:50:42', '2025-05-17 08:50:42');
INSERT INTO public.cities VALUES (3, 'Wroclaw', '2025-05-17 08:50:42', '2025-05-17 08:50:42');
INSERT INTO public.cities VALUES (4, 'Burlington', '2025-05-17 08:50:42', '2025-05-17 08:50:42');
INSERT INTO public.cities VALUES (6, 'dsads', '2025-05-17 08:57:18', '2025-05-17 08:57:18');
INSERT INTO public.cities VALUES (7, 'dsadsa', '2025-05-17 09:16:07', '2025-05-17 09:16:07');


--
-- TOC entry 3895 (class 0 OID 16789)
-- Dependencies: 221
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: dawidkostka
--



--
-- TOC entry 3893 (class 0 OID 16781)
-- Dependencies: 219
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: dawidkostka
--



--
-- TOC entry 3892 (class 0 OID 16772)
-- Dependencies: 218
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: dawidkostka
--



--
-- TOC entry 3903 (class 0 OID 16822)
-- Dependencies: 229
-- Data for Name: meetup_locations; Type: TABLE DATA; Schema: public; Owner: dawidkostka
--

INSERT INTO public.meetup_locations VALUES (1, 'Google Campus Warsaw', 1, '2025-05-17 08:50:42', '2025-05-17 08:50:42');
INSERT INTO public.meetup_locations VALUES (2, 'Planty Park', 2, '2025-05-17 08:50:42', '2025-05-17 08:50:42');
INSERT INTO public.meetup_locations VALUES (3, 'Business Garden', 3, '2025-05-17 08:50:42', '2025-05-17 08:50:42');
INSERT INTO public.meetup_locations VALUES (4, '2024-09-12 09:27:34', 4, '2025-05-17 08:50:42', '2025-05-17 08:50:42');
INSERT INTO public.meetup_locations VALUES (5, 'adsa', 6, '2025-05-17 08:57:18', '2025-05-17 08:57:18');
INSERT INTO public.meetup_locations VALUES (6, '2024-05-26 08:06:42', 7, '2025-05-17 09:16:07', '2025-05-17 09:16:07');


--
-- TOC entry 3905 (class 0 OID 16834)
-- Dependencies: 231
-- Data for Name: meetups; Type: TABLE DATA; Schema: public; Owner: dawidkostka
--

INSERT INTO public.meetups VALUES (1, 'Angular 19 Deep Dive', 'Explore the latest features of Angular 19 including signals, deferrable views, and more.', '2024-07-15 18:00:00', 1, 1, 1, '2025-05-17 08:50:42', '2025-05-17 08:50:42');
INSERT INTO public.meetups VALUES (3, 'Startup Networking Breakfast', 'Connect with fellow entrepreneurs over coffee and pastries. Pitch your ideas and find collaborators.', '2024-07-12 08:00:00', 3, 3, 3, '2025-05-17 08:50:42', '2025-05-17 08:50:42');
INSERT INTO public.meetups VALUES (4, 'Lead Accounts Representative', 'Doloremque similique iusto aperiam dicta minima ex.', '2025-03-18 20:46:34', 4, 4, 4, '2025-05-17 08:50:42', '2025-05-17 08:50:42');
INSERT INTO public.meetups VALUES (2, 'Jazz in the Park', 'An evening of smooth jazz under the stars. Bring your own blanket and refreshments', '2024-07-20 19:30:00', 2, 2, 2, '2025-05-17 08:50:42', '2025-05-17 09:15:05');


--
-- TOC entry 3884 (class 0 OID 16724)
-- Dependencies: 210
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: dawidkostka
--

INSERT INTO public.migrations VALUES (1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO public.migrations VALUES (2, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO public.migrations VALUES (3, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO public.migrations VALUES (4, '2025_05_17_083801_create_cities_table', 1);
INSERT INTO public.migrations VALUES (5, '2025_05_17_083801_create_organizers_table', 1);
INSERT INTO public.migrations VALUES (6, '2025_05_17_083802_create_categories_table', 1);
INSERT INTO public.migrations VALUES (7, '2025_05_17_083802_create_meetup_locations_table', 1);
INSERT INTO public.migrations VALUES (8, '2025_05_17_083802_create_meetups_table', 1);


--
-- TOC entry 3899 (class 0 OID 16808)
-- Dependencies: 225
-- Data for Name: organizers; Type: TABLE DATA; Schema: public; Owner: dawidkostka
--

INSERT INTO public.organizers VALUES (1, 'Angular Community Poland', '2025-05-17 08:50:42', '2025-05-17 08:50:42');
INSERT INTO public.organizers VALUES (2, 'City Cultural Department', '2025-05-17 08:50:42', '2025-05-17 08:50:42');
INSERT INTO public.organizers VALUES (3, 'Startup Hub', '2025-05-17 08:50:42', '2025-05-17 08:50:42');
INSERT INTO public.organizers VALUES (4, 'Lydia_DAmore', '2025-05-17 08:50:42', '2025-05-17 08:50:42');
INSERT INTO public.organizers VALUES (6, 'dsadsadsa', '2025-05-17 08:57:18', '2025-05-17 08:57:18');
INSERT INTO public.organizers VALUES (7, 'Christophe_Douglas', '2025-05-17 09:16:06', '2025-05-17 09:16:06');


--
-- TOC entry 3887 (class 0 OID 16741)
-- Dependencies: 213
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: dawidkostka
--



--
-- TOC entry 3888 (class 0 OID 16748)
-- Dependencies: 214
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: dawidkostka
--



--
-- TOC entry 3886 (class 0 OID 16731)
-- Dependencies: 212
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dawidkostka
--

INSERT INTO public.users VALUES (1, 'Test User', 'test@example.com', '2025-05-17 08:50:42', '$2y$12$NWMQ9RaB2OKPzIuv4D6vB.00LXdNbQ8eosJ0g5VpOuCxo0s4JF.gG', '7oSubCHUkS', '2025-05-17 08:50:42', '2025-05-17 08:50:42');


--
-- TOC entry 3921 (class 0 OID 0)
-- Dependencies: 226
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dawidkostka
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- TOC entry 3922 (class 0 OID 0)
-- Dependencies: 222
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dawidkostka
--

SELECT pg_catalog.setval('public.cities_id_seq', 7, true);


--
-- TOC entry 3923 (class 0 OID 0)
-- Dependencies: 220
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dawidkostka
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 3924 (class 0 OID 0)
-- Dependencies: 217
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dawidkostka
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- TOC entry 3925 (class 0 OID 0)
-- Dependencies: 228
-- Name: meetup_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dawidkostka
--

SELECT pg_catalog.setval('public.meetup_locations_id_seq', 6, true);


--
-- TOC entry 3926 (class 0 OID 0)
-- Dependencies: 230
-- Name: meetups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dawidkostka
--

SELECT pg_catalog.setval('public.meetups_id_seq', 6, true);


--
-- TOC entry 3927 (class 0 OID 0)
-- Dependencies: 209
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dawidkostka
--

SELECT pg_catalog.setval('public.migrations_id_seq', 8, true);


--
-- TOC entry 3928 (class 0 OID 0)
-- Dependencies: 224
-- Name: organizers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dawidkostka
--

SELECT pg_catalog.setval('public.organizers_id_seq', 7, true);


--
-- TOC entry 3929 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dawidkostka
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- TOC entry 3720 (class 2606 OID 16770)
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- TOC entry 3718 (class 2606 OID 16763)
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- TOC entry 3735 (class 2606 OID 16820)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3731 (class 2606 OID 16806)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 3727 (class 2606 OID 16797)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3729 (class 2606 OID 16799)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 3725 (class 2606 OID 16787)
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 3722 (class 2606 OID 16779)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3737 (class 2606 OID 16827)
-- Name: meetup_locations meetup_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.meetup_locations
    ADD CONSTRAINT meetup_locations_pkey PRIMARY KEY (id);


--
-- TOC entry 3739 (class 2606 OID 16841)
-- Name: meetups meetups_pkey; Type: CONSTRAINT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.meetups
    ADD CONSTRAINT meetups_pkey PRIMARY KEY (id);


--
-- TOC entry 3706 (class 2606 OID 16729)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3733 (class 2606 OID 16813)
-- Name: organizers organizers_pkey; Type: CONSTRAINT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.organizers
    ADD CONSTRAINT organizers_pkey PRIMARY KEY (id);


--
-- TOC entry 3712 (class 2606 OID 16747)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 3715 (class 2606 OID 16754)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 3708 (class 2606 OID 16740)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 3710 (class 2606 OID 16738)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3723 (class 1259 OID 16780)
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: dawidkostka
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- TOC entry 3713 (class 1259 OID 16756)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: dawidkostka
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 3716 (class 1259 OID 16755)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: dawidkostka
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- TOC entry 3740 (class 2606 OID 16828)
-- Name: meetup_locations meetup_locations_city_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.meetup_locations
    ADD CONSTRAINT meetup_locations_city_id_foreign FOREIGN KEY (city_id) REFERENCES public.cities(id) ON DELETE CASCADE;


--
-- TOC entry 3741 (class 2606 OID 16852)
-- Name: meetups meetups_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.meetups
    ADD CONSTRAINT meetups_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE SET NULL;


--
-- TOC entry 3742 (class 2606 OID 16847)
-- Name: meetups meetups_location_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.meetups
    ADD CONSTRAINT meetups_location_id_foreign FOREIGN KEY (location_id) REFERENCES public.meetup_locations(id) ON DELETE CASCADE;


--
-- TOC entry 3743 (class 2606 OID 16842)
-- Name: meetups meetups_organizer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dawidkostka
--

ALTER TABLE ONLY public.meetups
    ADD CONSTRAINT meetups_organizer_id_foreign FOREIGN KEY (organizer_id) REFERENCES public.organizers(id) ON DELETE SET NULL;


--
-- TOC entry 3911 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: dawidkostka
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2025-05-17 11:16:49 CEST

--
-- PostgreSQL database dump complete
--

