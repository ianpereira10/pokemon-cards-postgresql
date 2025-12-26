--
-- PostgreSQL database dump
--

\restrict LcufxmQUGvFeDd3cDU24zJ9b0ZKXdfu3jlaOOKNeA6ArTKG0W01AK3zSSwsFd9l

-- Dumped from database version 16.11
-- Dumped by pg_dump version 16.11

-- Started on 2025-12-25 14:45:12

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
-- TOC entry 222 (class 1259 OID 16502)
-- Name: tbl_cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_cards (
    id integer NOT NULL,
    hp smallint,
    name character varying(80) NOT NULL,
    info character varying(255),
    attack character varying(100),
    dammage character varying(20),
    weak character varying(30),
    ressis character varying(30),
    retreat character varying(20),
    cardnumberincollection smallint,
    collection_id integer NOT NULL,
    type_id integer NOT NULL,
    stage_id integer NOT NULL
);


ALTER TABLE public.tbl_cards OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16501)
-- Name: tbl_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_cards_id_seq OWNER TO postgres;

--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 221
-- Name: tbl_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_cards_id_seq OWNED BY public.tbl_cards.id;


--
-- TOC entry 216 (class 1259 OID 16477)
-- Name: tbl_collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_collections (
    id integer NOT NULL,
    collectionsetname character varying(100) NOT NULL,
    releasedate date NOT NULL,
    totalcardsincollection smallint NOT NULL
);


ALTER TABLE public.tbl_collections OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16476)
-- Name: tbl_collections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_collections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_collections_id_seq OWNER TO postgres;

--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 215
-- Name: tbl_collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_collections_id_seq OWNED BY public.tbl_collections.id;


--
-- TOC entry 220 (class 1259 OID 16493)
-- Name: tbl_stages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_stages (
    id integer NOT NULL,
    stagename character varying(20) NOT NULL
);


ALTER TABLE public.tbl_stages OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16492)
-- Name: tbl_stages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_stages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_stages_id_seq OWNER TO postgres;

--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 219
-- Name: tbl_stages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_stages_id_seq OWNED BY public.tbl_stages.id;


--
-- TOC entry 218 (class 1259 OID 16484)
-- Name: tbl_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_types (
    id integer NOT NULL,
    typename character varying(30) NOT NULL
);


ALTER TABLE public.tbl_types OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16483)
-- Name: tbl_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_types_id_seq OWNER TO postgres;

--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 217
-- Name: tbl_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_types_id_seq OWNED BY public.tbl_types.id;


--
-- TOC entry 223 (class 1259 OID 24576)
-- Name: vw_cards_detalhado; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_cards_detalhado AS
 SELECT c.id,
    c.hp,
    c.name,
    c.info,
    c.attack,
    c.dammage,
    c.weak,
    c.ressis,
    c.retreat,
    c.cardnumberincollection,
    col.collectionsetname AS collection_name,
    col.releasedate AS collection_release_date,
    col.totalcardsincollection AS collection_total_cards,
    t.typename AS type_name,
    s.stagename AS stage_name
   FROM (((public.tbl_cards c
     JOIN public.tbl_collections col ON ((c.collection_id = col.id)))
     JOIN public.tbl_types t ON ((c.type_id = t.id)))
     JOIN public.tbl_stages s ON ((c.stage_id = s.id)));


ALTER VIEW public.vw_cards_detalhado OWNER TO postgres;

--
-- TOC entry 4757 (class 2604 OID 16505)
-- Name: tbl_cards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_cards ALTER COLUMN id SET DEFAULT nextval('public.tbl_cards_id_seq'::regclass);


--
-- TOC entry 4754 (class 2604 OID 16480)
-- Name: tbl_collections id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_collections ALTER COLUMN id SET DEFAULT nextval('public.tbl_collections_id_seq'::regclass);


--
-- TOC entry 4756 (class 2604 OID 16496)
-- Name: tbl_stages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_stages ALTER COLUMN id SET DEFAULT nextval('public.tbl_stages_id_seq'::regclass);


--
-- TOC entry 4755 (class 2604 OID 16487)
-- Name: tbl_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_types ALTER COLUMN id SET DEFAULT nextval('public.tbl_types_id_seq'::regclass);


--
-- TOC entry 4924 (class 0 OID 16502)
-- Dependencies: 222
-- Data for Name: tbl_cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_cards (id, hp, name, info, attack, dammage, weak, ressis, retreat, cardnumberincollection, collection_id, type_id, stage_id) FROM stdin;
1	60	Bulbasaur	Seed Pokémon	Vine Whip	20	Fire ×2	None	1 Colorless	44	1	1	1
2	50	Charmander	Lizard Pokémon	Ember	30	Water ×2	None	1 Colorless	46	1	2	1
3	50	Squirtle	Tiny Turtle Pokémon	Bubble	10	Lightning ×2	None	1 Colorless	63	1	3	1
4	90	Pikachu	Mouse Pokémon	Thunder Jolt	30	Fighting ×2	None	1 Colorless	58	1	4	1
5	60	Jigglypuff	Balloon Pokémon	Lullaby	—	Psychic ×2	None	1 Colorless	54	2	7	1
6	100	Snorlax	Sleeping Pokémon	Body Slam	30	Fighting ×2	Psychic -30	4 Colorless	11	2	7	1
7	80	Haunter	Gas Pokémon	Nightmare	10	Psychic ×2	None	1 Colorless	8	3	5	2
8	60	Bulbasaur	Seed Pokémon	Vine Whip	20	Fire ×2	None	1 Colorless	44	1	1	1
9	50	Charmander	Lizard Pokémon	Ember	30	Water ×2	None	1 Colorless	46	1	2	1
10	50	Squirtle	Tiny Turtle Pokémon	Bubble	10	Lightning ×2	None	1 Colorless	63	1	3	1
11	90	Pikachu	Mouse Pokémon	Thunder Jolt	30	Fighting ×2	None	1 Colorless	58	1	4	1
12	80	Ivysaur	Seed Pokémon	Razor Leaf	30	Fire ×2	None	2 Colorless	30	1	1	2
13	90	Charmeleon	Flame Pokémon	Flamethrower	50	Water ×2	None	2 Colorless	24	1	2	2
14	100	Wartortle	Turtle Pokémon	Water Gun	40	Lightning ×2	None	2 Colorless	42	1	3	2
15	120	Venusaur	Seed Pokémon	Solarbeam	60	Fire ×2	None	3 Colorless	15	1	1	3
16	120	Charizard	Flame Pokémon	Fire Spin	100	Water ×2	None	3 Colorless	4	1	2	3
17	100	Blastoise	Shellfish Pokémon	Hydro Pump	60	Lightning ×2	None	3 Colorless	2	1	3	3
18	60	Jigglypuff	Balloon Pokémon	Lullaby	—	Psychic ×2	None	1 Colorless	54	2	7	1
19	100	Snorlax	Sleeping Pokémon	Body Slam	30	Fighting ×2	Psychic -30	4 Colorless	11	2	7	1
20	70	Meowth	Scratch Cat Pokémon	Pay Day	20	Fighting ×2	None	1 Colorless	56	2	7	1
21	80	Persian	Classy Cat Pokémon	Slash	30	Fighting ×2	None	1 Colorless	42	2	7	2
22	80	Hitmonlee	Kicking Pokémon	Stretch Kick	30	Psychic ×2	None	1 Colorless	7	2	6	1
23	90	Hitmonchan	Punching Pokémon	Special Punch	40	Psychic ×2	None	2 Colorless	8	2	6	1
24	80	Haunter	Gas Pokémon	Nightmare	10	Psychic ×2	None	1 Colorless	8	3	5	2
25	120	Gengar	Shadow Pokémon	Dark Mind	60	Psychic ×2	None	2 Colorless	5	3	5	3
26	70	Kabuto	Shellfish Pokémon	Scratch	20	Grass ×2	None	1 Colorless	9	3	6	1
27	100	Kabutops	Shellfish Pokémon	Slash	50	Grass ×2	None	2 Colorless	6	3	6	2
28	70	Oddish	Weed Pokémon	Absorb	10	Fire ×2	None	1 Colorless	58	2	1	1
29	80	Gloom	Weed Pokémon	Poisonpowder	20	Fire ×2	None	2 Colorless	42	2	1	2
30	100	Vileplume	Flower Pokémon	Petal Dance	40x	Fire ×2	None	2 Colorless	15	2	1	3
31	60	Eevee	Evolution Pokémon	Quick Attack	10+	Fighting ×2	None	1 Colorless	55	2	7	1
32	70	Flareon	Flame Pokémon	Flamethrower	50	Water ×2	None	2 Colorless	12	2	2	2
33	70	Vaporeon	Bubble Jet Pokémon	Water Gun	30+	Lightning ×2	None	2 Colorless	28	2	3	2
34	80	Jolteon	Lightning Pokémon	Pin Missile	20x	Fighting ×2	None	1 Colorless	20	2	4	2
35	90	Scyther	Mantis Pokémon	Slash	30	Fire ×2	Fighting -30	1 Colorless	10	2	1	1
36	100	Kangaskhan	Parent Pokémon	Comet Punch	20x	Fighting ×2	None	3 Colorless	5	2	7	1
37	80	Electrode	Ball Pokémon	Explosion	80	Fighting ×2	None	1 Colorless	21	2	4	2
38	60	Zubat	Bat Pokémon	Leech Life	10	Psychic ×2	None	1 Colorless	57	3	5	1
39	70	Golbat	Bat Pokémon	Wing Attack	30	Psychic ×2	None	1 Colorless	25	3	5	2
40	90	Muk	Sludge Pokémon	Sludge	30	Psychic ×2	None	2 Colorless	13	3	5	2
41	100	Ditto	Transform Pokémon	Transform	—	Fighting ×2	None	1 Colorless	18	3	7	1
42	70	Geodude	Rock Pokémon	Tackle	10	Grass ×2	None	1 Colorless	46	3	6	1
43	80	Graveler	Rock Pokémon	Rock Throw	40	Grass ×2	None	2 Colorless	36	3	6	2
44	100	Golem	Megaton Pokémon	Selfdestruct	100	Grass ×2	None	4 Colorless	26	3	6	3
45	60	Omanyte	Spiral Pokémon	Water Gun	10+	Grass ×2	None	1 Colorless	52	3	3	1
46	80	Omastar	Spiral Pokémon	Spike Cannon	30x	Grass ×2	None	2 Colorless	26	3	3	2
47	70	Aerodactyl	Fossil Pokémon	Wing Attack	30	Grass ×2	None	2 Colorless	1	3	6	1
48	90	Articuno	Freeze Pokémon	Blizzard	50	Metal ×2	Fighting -30	2 Colorless	2	3	3	1
49	90	Zapdos	Electric Pokémon	Thunderstorm	40	Fighting ×2	None	3 Colorless	15	3	4	1
50	90	Moltres	Flame Pokémon	Dive Bomb	80	Water ×2	None	2 Colorless	12	3	2	1
51	120	Dragonite	Dragon Pokémon	Slam	40x	Colorless ×2	None	2 Colorless	4	3	7	3
52	70	Magmar	Spitfire Pokémon	Smokescreen	10	Water ×2	None	1 Colorless	36	3	2	1
53	80	Lapras	Transport Pokémon	Water Gun	10+	Lightning ×2	None	2 Colorless	10	3	3	1
54	60	Krabby	River Crab Pokémon	Vice Grip	10	Lightning ×2	None	1 Colorless	51	3	3	1
55	80	Kingler	Pincer Pokémon	Crabhammer	40	Lightning ×2	None	2 Colorless	34	3	3	2
56	70	Horsea	Dragon Pokémon	Smokescreen	10	Lightning ×2	None	1 Colorless	49	3	3	1
57	90	Seadra	Dragon Pokémon	Water Gun	20+	Lightning ×2	None	2 Colorless	22	3	3	2
58	60	Nidoran♀	Poison Pin Pokémon	Scratch	10	Psychic ×2	None	1 Colorless	57	2	5	1
59	70	Nidorina	Poison Pin Pokémon	Double Kick	30x	Psychic ×2	None	2 Colorless	36	2	5	2
60	90	Nidoqueen	Drill Pokémon	Mega Punch	40	Psychic ×2	None	3 Colorless	7	2	5	3
61	60	Nidoran♂	Poison Pin Pokémon	Horn Attack	20	Psychic ×2	None	1 Colorless	56	2	5	1
62	80	Nidorino	Poison Pin Pokémon	Horn Drill	50	Psychic ×2	None	2 Colorless	37	2	5	2
63	100	Nidoking	Drill Pokémon	Thrash	30+	Psychic ×2	None	3 Colorless	11	2	5	3
64	70	Rhyhorn	Spikes Pokémon	Horn Attack	30	Grass ×2	None	2 Colorless	61	2	6	1
65	100	Rhydon	Drill Pokémon	Horn Drill	50	Grass ×2	None	3 Colorless	45	2	6	2
66	60	Cubone	Lonely Pokémon	Bone Club	20	Grass ×2	None	1 Colorless	50	3	6	1
67	80	Marowak	Bone Keeper Pokémon	Bonemerang	30x	Grass ×2	None	2 Colorless	26	3	6	2
68	70	Sandshrew	Mouse Pokémon	Scratch	20	Grass ×2	None	1 Colorless	60	2	6	1
69	80	Sandslash	Mouse Pokémon	Slash	40	Grass ×2	None	2 Colorless	32	2	6	2
70	60	Machop	Superpower Pokémon	Low Kick	20	Psychic ×2	None	1 Colorless	52	3	6	1
71	80	Machoke	Superpower Pokémon	Karate Chop	50	Psychic ×2	None	2 Colorless	34	3	6	2
72	100	Machamp	Superpower Pokémon	Seismic Toss	60	Psychic ×2	None	3 Colorless	8	3	6	3
73	60	Gastly	Gas Pokémon	Lick	10	Psychic ×2	None	1 Colorless	33	3	5	1
74	80	Drowzee	Hypnosis Pokémon	Pound	10	Psychic ×2	None	1 Colorless	49	2	5	1
75	90	Hypno	Hypnosis Pokémon	Prophecy	—	Psychic ×2	None	2 Colorless	23	2	5	2
76	60	Abra	Psi Pokémon	Psyshock	10	Psychic ×2	None	1 Colorless	43	1	5	1
77	70	Kadabra	Psi Pokémon	Recover	—	Psychic ×2	None	2 Colorless	32	1	5	2
78	100	Alakazam	Psi Pokémon	Confuse Ray	30	Psychic ×2	None	3 Colorless	1	1	5	3
79	60	Poliwag	Tadpole Pokémon	Water Gun	10+	Lightning ×2	None	1 Colorless	59	1	3	1
80	80	Poliwhirl	Tadpole Pokémon	Amnesia	20	Lightning ×2	None	2 Colorless	36	1	3	2
81	100	Poliwrath	Tadpole Pokémon	Water Gun	30+	Lightning ×2	None	3 Colorless	13	1	3	3
82	60	Tentacool	Jellyfish Pokémon	Acid	10	Lightning ×2	None	1 Colorless	62	3	3	1
83	80	Tentacruel	Jellyfish Pokémon	Supersonic	—	Lightning ×2	None	2 Colorless	43	3	3	2
84	70	Seel	Sea Lion Pokémon	Headbutt	10	Lightning ×2	None	1 Colorless	58	3	3	1
85	90	Dewgong	Sea Lion Pokémon	Aurora Beam	50	Lightning ×2	None	3 Colorless	17	3	3	2
86	60	Magnemite	Magnet Pokémon	Thunder Wave	10	Fighting ×2	None	1 Colorless	54	1	4	1
87	80	Magneton	Magnet Pokémon	Selfdestruct	80	Fighting ×2	None	2 Colorless	9	1	4	2
\.


--
-- TOC entry 4918 (class 0 OID 16477)
-- Dependencies: 216
-- Data for Name: tbl_collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_collections (id, collectionsetname, releasedate, totalcardsincollection) FROM stdin;
1	Base Set	1999-01-09	102
2	Jungle	1999-06-16	64
3	Fossil	1999-10-10	62
\.


--
-- TOC entry 4922 (class 0 OID 16493)
-- Dependencies: 220
-- Data for Name: tbl_stages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_stages (id, stagename) FROM stdin;
1	Basic
2	Stage 1
3	Stage 2
\.


--
-- TOC entry 4920 (class 0 OID 16484)
-- Dependencies: 218
-- Data for Name: tbl_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_types (id, typename) FROM stdin;
1	Grass
2	Fire
3	Water
4	Lightning
5	Psychic
6	Fighting
7	Colorless
\.


--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 221
-- Name: tbl_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_cards_id_seq', 87, true);


--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 215
-- Name: tbl_collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_collections_id_seq', 3, true);


--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 219
-- Name: tbl_stages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_stages_id_seq', 3, true);


--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 217
-- Name: tbl_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_types_id_seq', 7, true);


--
-- TOC entry 4769 (class 2606 OID 16509)
-- Name: tbl_cards tbl_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_cards
    ADD CONSTRAINT tbl_cards_pkey PRIMARY KEY (id);


--
-- TOC entry 4759 (class 2606 OID 16482)
-- Name: tbl_collections tbl_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_collections
    ADD CONSTRAINT tbl_collections_pkey PRIMARY KEY (id);


--
-- TOC entry 4765 (class 2606 OID 16498)
-- Name: tbl_stages tbl_stages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_stages
    ADD CONSTRAINT tbl_stages_pkey PRIMARY KEY (id);


--
-- TOC entry 4767 (class 2606 OID 16500)
-- Name: tbl_stages tbl_stages_stagename_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_stages
    ADD CONSTRAINT tbl_stages_stagename_key UNIQUE (stagename);


--
-- TOC entry 4761 (class 2606 OID 16489)
-- Name: tbl_types tbl_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_types
    ADD CONSTRAINT tbl_types_pkey PRIMARY KEY (id);


--
-- TOC entry 4763 (class 2606 OID 16491)
-- Name: tbl_types tbl_types_typename_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_types
    ADD CONSTRAINT tbl_types_typename_key UNIQUE (typename);


--
-- TOC entry 4770 (class 2606 OID 16510)
-- Name: tbl_cards fk_collection; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_cards
    ADD CONSTRAINT fk_collection FOREIGN KEY (collection_id) REFERENCES public.tbl_collections(id) ON DELETE CASCADE;


--
-- TOC entry 4771 (class 2606 OID 16520)
-- Name: tbl_cards fk_stage; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_cards
    ADD CONSTRAINT fk_stage FOREIGN KEY (stage_id) REFERENCES public.tbl_stages(id) ON DELETE RESTRICT;


--
-- TOC entry 4772 (class 2606 OID 16515)
-- Name: tbl_cards fk_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_cards
    ADD CONSTRAINT fk_type FOREIGN KEY (type_id) REFERENCES public.tbl_types(id) ON DELETE RESTRICT;


-- Completed on 2025-12-25 14:45:13

--
-- PostgreSQL database dump complete
--

\unrestrict LcufxmQUGvFeDd3cDU24zJ9b0ZKXdfu3jlaOOKNeA6ArTKG0W01AK3zSSwsFd9l

