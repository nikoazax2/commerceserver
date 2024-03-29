--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.0

-- Started on 2024-02-26 21:47:38

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
-- TOC entry 220 (class 1259 OID 41184)
-- Name: contenu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contenu (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(30) NOT NULL,
    valeur character varying(30),
    type integer,
    description character varying(500),
    contenu json,
    page character varying(30),
    "order" integer,
    photo boolean,
    removable boolean,
    image text[] DEFAULT '{}'::text[],
    espacement json
);


ALTER TABLE public.contenu OWNER TO postgres;

--
-- TOC entry 4862 (class 0 OID 41184)
-- Dependencies: 220
-- Data for Name: contenu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contenu (uuid, name, valeur, type, description, contenu, page, "order", photo, removable, image, espacement) FROM stdin;
76bbc3b6-88c7-46d2-b821-9fde94302b1a	Bandeau critères dessus footer	criteres-dessus-footer	7	\N	false	Général	6	\N	\N	{}	\N
e3ca2b1e-a7e7-41cd-a6d3-3568247000f5	Tags SEO	tags	1	\N	"<p>Mirco chanteur pop Grenoble Artiste Mirco musique pop Chanteur Mirco&nbsp; Grenoble Musique pop Mirco artiste Mirco artiste chanteur pop Grenoble Chanson pop Mirco &agrave; Grenoble Nouveau single Mirco chanteur pop Concert Mirco &agrave; Grenoble Mirco talentueux chanteur pop Populaire artiste Mirco Grenoble Mirco voix unique musique pop Sc&egrave;ne musicale Grenoble Mirco Mirco performances live pop Mirco passionn&eacute; de musique pop Mirco sensation pop Grenoble Mirco artiste &eacute;mergent pop Mirco nouvel album pop Mirco passion musique pop Mirco chanteur charismatique pop Mirco talent prometteur pop Mirco concerts en r&eacute;gion Grenoble Mirco ambiance pop en concert Mirco artiste local pop Mirco album studio pop Mirco musique entrainante pop Mirco artiste solo pop Mirco paroles captivantes pop Mirco m&eacute;lodies accrocheuses pop Mirco rythmes entra&icirc;nants pop Mirco voix envo&ucirc;tante pop Mirco sonorit&eacute;s pop modernes Mirco inspiration musicale pop Mirco compositions originales pop Mirco singles &agrave; succ&egrave;s pop Mirco passion</p>"	Général	10	\N	\N	{}	\N
3c1c3db9-5b50-4d09-a5f9-87b261504049	Page meilleures ventes	page-meilleures-ventes	7	\N	false	Général	9	\N	\N	{}	\N
880e68ef-e1b3-4d4e-b4fe-c9e29acd6c53	Logo du site	logo-site	2	\N	[{"unique":true},{"url":"","titre":""},{"url":"","titre":""},{"url":"","titre":""},{"url":"","titre":""},{"url":"","titre":""}]	Général	7	\N	\N	{0384b574-697e-4871-a670-d9d162fa68cf}	\N
270dfac8-e4b1-4203-ab05-8197b690ae23	Articles		5	\N	{"nombre":5,"categories":["4967aea9-803c-4a30-9847-bab67a1d99ba","7674fd39-cbcf-4831-9abf-7c3567cb3f30"]}	accueil	2	\N	t	{}	{"top":0,"bottom":"100","left":0,"right":0}
4c59774e-166e-4601-bc62-be9874c64aee	Pages	pages	8	\N	[{"name":"A propos","groupes":[1]}]	Général	1	\N	\N	{}	\N
7422b2c4-1838-4148-92f5-6cd9f8d1c0f7	Logo du site Pied	logo-site-footer	2	\N	[{"unique":true},{"url":"","titre":""},{"url":"","titre":""},{"url":"","titre":""},{"url":"","titre":""}]	Général	8	\N	\N	{e2a9376c-46f8-486d-8022-eae5befa3296}	\N
2a990218-8494-4356-b134-f4b05a0fd8b7	Image		2	\N	[{"url":"http://localhost:8080/product/list?categorie=4967aea9-803c-4a30-9847-bab67a1d99ba","titre":"<p><span style=\\"font-size: 12pt; color: #7e8c8d;\\">WOMEN</span></p>\\n<p><span style=\\"font-size: 24pt;\\"><strong>Slick. Modern. Awesome.</strong></span></p>","position":4,"style":{"color":"#212121","shadow":false,"bold":true,"fontSize":"30px"},"percent":"5200"}]	accueil	0	\N	t	{8e7cbd83-65a1-4b64-b879-2079a379b0eb}	{"top":0,"bottom":0,"left":0,"right":0}
65e0afc4-beec-477a-8f4b-6dde79bfb62a	Nom de site	nom-site	9	\N	"T-shirts"	Général	11	\N	\N	{}	\N
cca1f19b-75de-4e52-a496-a4b6689acc34	Couleur du site	couleur-site	3	\N	{"color":"#212121"}	Général	2	\N	\N	{768c618e-8673-43a6-966e-d203f950774f,6e844538-39a6-4a57-9ed5-b87bf55391da}	\N
a052dc7b-7816-428b-93f6-47eceff39815	Texte		1	\N	{"texte":"<p style=\\"text-align: center;\\"><span style=\\"font-size: 8pt; font-family: arial, helvetica, sans-serif;\\">SUMMER COLLECTION </span></p>\\n<p style=\\"text-align: center;\\"><span style=\\"font-size: 18pt; font-family: arial, helvetica, sans-serif;\\"><strong>Popular T-Shirts</strong></span></p>","style":{"color":"#212121","shadow":false,"bold":true,"fontSize":"28px"}}	accueil	1	\N	t	{}	{"top":"0","bottom":0,"left":0,"right":0}
1aaeb62a-a911-412f-9e15-0d2f3153097d	Message bandeau du haut	message-bandeau-haut	1	\N	{"texte":"<p><span style=\\"font-size: 14pt;\\">Slick. Modern. Awesome.</span></p>","color":"#000000"}	Général	4	\N	\N	{}	\N
8684a4d6-9892-4419-93a5-271b8b25393a	Image		2	\N	[{"url":"","titre":"<p style=\\"text-align: center;\\"><span style=\\"font-size: 18pt; color: #ecf0f1; text-shadow: none;\\">NEW COLLECTION</span></p>\\n<p style=\\"text-align: center;\\"><strong><span style=\\"font-size: 24pt; color: #ecf0f1; text-shadow: none;\\">Be different in your own way! </span></strong></p>\\n<p style=\\"text-align: center;\\"><span style=\\"font-size: 24pt; color: #ecf0f1; text-shadow: none;\\">Find your unique style.</span></p>","position":5,"percent":"50","opacity":"","darker":"80","parallax":true}]	accueil	3	\N	t	{4230fdbd-6f9d-48c3-8f0a-5d71274625b7}	{"top":0,"bottom":0,"left":0,"right":0}
\.


--
-- TOC entry 4718 (class 2606 OID 41192)
-- Name: contenu PK_ef008cb9a9e5b44cce93f8efd4c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenu
    ADD CONSTRAINT "PK_ef008cb9a9e5b44cce93f8efd4c" PRIMARY KEY (uuid);


-- Completed on 2024-02-26 21:47:38

--
-- PostgreSQL database dump complete
--

