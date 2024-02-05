--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2024-02-05 13:47:32

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

--
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- TOC entry 3 (class 3079 OID 16434)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 65619)
-- Name: bloc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bloc (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    type integer,
    name character varying(30) NOT NULL,
    description character varying(500),
    logo character varying(500)
);


ALTER TABLE public.bloc OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 40998)
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    quantity smallint NOT NULL,
    "user" character varying(30) NOT NULL,
    product character varying(30) NOT NULL,
    details character varying(400) NOT NULL
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 40961)
-- Name: categorie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorie (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.categorie OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 57436)
-- Name: commande; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commande (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    date date NOT NULL,
    useruuid character varying NOT NULL,
    etat character varying,
    products text[] DEFAULT '{}'::text[]
);


ALTER TABLE public.commande OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 57427)
-- Name: contenu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contenu (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(30) NOT NULL,
    valeur character varying(30),
    type integer,
    description character varying(500),
    contenu character varying(100000),
    page character varying(30),
    "order" integer,
    photo boolean,
    image text[] DEFAULT '{}'::text[],
    removable boolean
);


ALTER TABLE public.contenu OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24576)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(30),
    prix double precision,
    categorieuuid uuid NOT NULL,
    description character varying(100000),
    image text[] DEFAULT '{}'::text[],
    idapistripe character varying(100),
    ancienprixpromo double precision
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16456)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    email character varying(40) NOT NULL,
    password character varying NOT NULL,
    adress character varying(40) NOT NULL,
    username character varying(30) NOT NULL,
    role smallint NOT NULL,
    code character varying(6),
    activated boolean DEFAULT false NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 41018)
-- Name: variation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.variation (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    stock integer NOT NULL,
    name character varying(30) NOT NULL,
    productuuid uuid NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.variation OWNER TO postgres;

--
-- TOC entry 4905 (class 0 OID 65619)
-- Dependencies: 224
-- Data for Name: bloc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bloc (uuid, type, name, description, logo) FROM stdin;
a76a9a82-6b4b-4cbe-809e-806962e880e5	1	Texte	\N	mdi-format-color-text
ed0b9ce0-7829-40d7-8def-f0c8dc2dba89	2	Image	\N	mdi-image-multiple-outline
3eb5ca3c-a5a9-43df-a48a-ad68cc7955c8	4	Bouton	\N	mdi-button-pointer
\.


--
-- TOC entry 4901 (class 0 OID 40998)
-- Dependencies: 220
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (uuid, quantity, "user", product, details) FROM stdin;
\.


--
-- TOC entry 4900 (class 0 OID 40961)
-- Dependencies: 219
-- Data for Name: categorie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorie (uuid, name) FROM stdin;
b0615e09-c59d-4999-a622-5f863bc164d5	Veste chauffante
c59486b1-dadf-4d1f-85ea-9623af432a0d	Gilet chauffant
\.


--
-- TOC entry 4904 (class 0 OID 57436)
-- Dependencies: 223
-- Data for Name: commande; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commande (uuid, date, useruuid, etat, products) FROM stdin;
\.


--
-- TOC entry 4903 (class 0 OID 57427)
-- Dependencies: 222
-- Data for Name: contenu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contenu (uuid, name, valeur, type, description, contenu, page, "order", photo, image, removable) FROM stdin;
8c603b66-6f77-4ca4-81de-851d92bb171d	Bandeau 1	photo-bandeau-site	2	Bandeau 1 accueil	\N	accueil	1	t	{890a6ea3-73c2-4e1d-9bc3-b011c6ed8637}	t
d186ad48-fa81-4e80-b115-18c4c4d3d8dd	Premier encart texte	premier-encart-texte	1	premier-encart-texte	<h1 class="heading h1" style="text-align: center;">VESTE CHAUFFANTE</h1>\n<p>&nbsp;</p>\n<div class="rte">\n<p>Vous avez constamment froid en hiver&thinsp;? La&nbsp;<strong>veste chauffante</strong>&nbsp;est faite pour vous&thinsp;! Gr&acirc;ce &agrave; un syst&egrave;me de r&eacute;sistances int&eacute;gr&eacute;es, vous n&rsquo;aurez plus jamais froid. Chasseur, motard, amateur de sports de glisse ou simplement frileux, la doudoune chauffante deviendra vite un indispensable de votre garde-robe en hiver.</p>\n</div>	accueil	2	\N	{}	\N
85ad1038-d8f1-4d5a-af2d-16d31b09dc90	Image		2	\N	\N	accueil	0	\N	{}	t
66443192-e0c1-4273-8e83-7231e25b34f6	Couleur du site	couleur-site	3	Couleur principale du site	#D32F2F	Général	1	\N	{}	f
5a87f592-8e18-4f54-bc54-228b133b34a9	Bandeau	message-bandeau-haut	1	Texte bandeau noir en haut du site	<p>aaa</p>	Général	2	\N	{}	f
\.


--
-- TOC entry 4899 (class 0 OID 24576)
-- Dependencies: 218
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (uuid, name, prix, categorieuuid, description, image, idapistripe, ancienprixpromo) FROM stdin;
2b9207e2-1a45-4370-b774-cc2938f4c345	Veste chauffante Noire	65.5	b0615e09-c59d-4999-a622-5f863bc164d5	<h2>PROT&Eacute;GEZ-VOUS DU FROID AVEC LA VESTE CHAUFFANTE NOIRE</h2>\n<p>&Ccedil;a vous dirait de faire du ski avec des amis ou avec les membres de votre famille pour passer un bon moment de d&eacute;tente ? Certainement oui ! Mais il fait un&nbsp;<strong>temps glacial</strong>&nbsp;dehors. Eh bien, sachez que tout n'est pas perdu, car il existe une veste chauffante particuli&egrave;rement adapt&eacute;e au froid hivernal et con&ccedil;ue pour vous&nbsp;<strong>prot&eacute;ger contre ce froid</strong>. Il s'agit de la splendide Veste Chauffante Noire pour passer d'agr&eacute;ables moments sous le froid. Gr&acirc;ce &agrave; cette veste chauffante, vous avez la possibilit&eacute; d'&ecirc;tre au chaud en appuyant tout simplement le bouton qui s'y trouve. Selon le temps qu'il fait, vous pouvez opter pour une temp&eacute;rature douce, classique ou &eacute;lev&eacute;e.&nbsp; La&nbsp;<strong>chaleur diffus&eacute;e</strong>&nbsp;&agrave; partir du dos, du buste ou de la nuque est vraiment exquise.</p>\n<p>La veste doit &ecirc;tre&nbsp;<strong>branch&eacute;e &agrave; une batterie externe</strong>&nbsp;pour fonctionner. Elle a un port USB d&eacute;di&eacute; &agrave; la batterie, alors n'oubliez pas d'acqu&eacute;rir notre batterie externe&nbsp;<strong>en option</strong>&nbsp;pour une utilisation optimale.</p>\n<p class="desc-title-1">SP&Eacute;CIFICATION</p>\n<ul>\n<li>Contr&ocirc;le les zones de chauffe</li>\n</ul>\n<ul>\n<li>3 modes disponibles (25&deg;C &agrave; 45 &deg;C)</li>\n</ul>\n<ul>\n<li>21 zones de chauffe</li>\n</ul>\n<ul>\n<li>Autonomie de&nbsp;4 &agrave; 8 heures avec notre batterie externe</li>\n</ul>\n<ul>\n<li>Mat&eacute;riau : Coton + Polyester</li>\n</ul>\n<ul>\n<li>Lavable en machine (&agrave; froid)</li>\n</ul>\n<p class="desc-title-2">GUIDE DES TAILLES</p>\n<p><img src="https://cdn.shopify.com/s/files/1/0646/6030/8205/files/Guide-Taille.png?v=1654271305" alt="" /></p>\n<div><em><strong>Ne s&eacute;lectionnez pas directement selon vos habitudes. Veuillez vous r&eacute;f&eacute;rencer &agrave; notre guide de taille et nous vous conseillons fortement de choisir&nbsp;une taille au-dessus !</strong></em></div>	{}	\N	\N
2448e21e-5804-46ff-949b-66142496767c	Veste chauffante Noire	65.5	b0615e09-c59d-4999-a622-5f863bc164d5	<h2>PROT&Eacute;GEZ-VOUS DU FROID AVEC LA VESTE CHAUFFANTE NOIRE</h2>\n<p>&Ccedil;a vous dirait de faire du ski avec des amis ou avec les membres de votre famille pour passer un bon moment de d&eacute;tente ? Certainement oui ! Mais il fait un&nbsp;<strong>temps glacial</strong>&nbsp;dehors. Eh bien, sachez que tout n'est pas perdu, car il existe une veste chauffante particuli&egrave;rement adapt&eacute;e au froid hivernal et con&ccedil;ue pour vous&nbsp;<strong>prot&eacute;ger contre ce froid</strong>. Il s'agit de la splendide Veste Chauffante Noire pour passer d'agr&eacute;ables moments sous le froid. Gr&acirc;ce &agrave; cette veste chauffante, vous avez la possibilit&eacute; d'&ecirc;tre au chaud en appuyant tout simplement le bouton qui s'y trouve. Selon le temps qu'il fait, vous pouvez opter pour une temp&eacute;rature douce, classique ou &eacute;lev&eacute;e.&nbsp; La&nbsp;<strong>chaleur diffus&eacute;e</strong>&nbsp;&agrave; partir du dos, du buste ou de la nuque est vraiment exquise.</p>\n<p>La veste doit &ecirc;tre&nbsp;<strong>branch&eacute;e &agrave; une batterie externe</strong>&nbsp;pour fonctionner. Elle a un port USB d&eacute;di&eacute; &agrave; la batterie, alors n'oubliez pas d'acqu&eacute;rir notre batterie externe&nbsp;<strong>en option</strong>&nbsp;pour une utilisation optimale.</p>\n<p class="desc-title-1">SP&Eacute;CIFICATION</p>\n<ul>\n<li>Contr&ocirc;le les zones de chauffe</li>\n</ul>\n<ul>\n<li>3 modes disponibles (25&deg;C &agrave; 45 &deg;C)</li>\n</ul>\n<ul>\n<li>21 zones de chauffe</li>\n</ul>\n<ul>\n<li>Autonomie de&nbsp;4 &agrave; 8 heures avec notre batterie externe</li>\n</ul>\n<ul>\n<li>Mat&eacute;riau : Coton + Polyester</li>\n</ul>\n<ul>\n<li>Lavable en machine (&agrave; froid)</li>\n</ul>\n<p class="desc-title-2">GUIDE DES TAILLES</p>\n<p><img src="https://cdn.shopify.com/s/files/1/0646/6030/8205/files/Guide-Taille.png?v=1654271305" alt="" /></p>\n<div><em><strong>Ne s&eacute;lectionnez pas directement selon vos habitudes. Veuillez vous r&eacute;f&eacute;rencer &agrave; notre guide de taille et nous vous conseillons fortement de choisir&nbsp;une taille au-dessus !</strong></em></div>	{}	\N	\N
8d692ec2-bc0b-46c4-aaa7-80373cde8ea3	Veste chauffante Noire	65.5	b0615e09-c59d-4999-a622-5f863bc164d5	<h2>PROT&Eacute;GEZ-VOUS DU FROID AVEC LA VESTE CHAUFFANTE NOIRE</h2>\n<p>&Ccedil;a vous dirait de faire du ski avec des amis ou avec les membres de votre famille pour passer un bon moment de d&eacute;tente ? Certainement oui ! Mais il fait un&nbsp;<strong>temps glacial</strong>&nbsp;dehors. Eh bien, sachez que tout n'est pas perdu, car il existe une veste chauffante particuli&egrave;rement adapt&eacute;e au froid hivernal et con&ccedil;ue pour vous&nbsp;<strong>prot&eacute;ger contre ce froid</strong>. Il s'agit de la splendide Veste Chauffante Noire pour passer d'agr&eacute;ables moments sous le froid. Gr&acirc;ce &agrave; cette veste chauffante, vous avez la possibilit&eacute; d'&ecirc;tre au chaud en appuyant tout simplement le bouton qui s'y trouve. Selon le temps qu'il fait, vous pouvez opter pour une temp&eacute;rature douce, classique ou &eacute;lev&eacute;e.&nbsp; La&nbsp;<strong>chaleur diffus&eacute;e</strong>&nbsp;&agrave; partir du dos, du buste ou de la nuque est vraiment exquise.</p>\n<p>La veste doit &ecirc;tre&nbsp;<strong>branch&eacute;e &agrave; une batterie externe</strong>&nbsp;pour fonctionner. Elle a un port USB d&eacute;di&eacute; &agrave; la batterie, alors n'oubliez pas d'acqu&eacute;rir notre batterie externe&nbsp;<strong>en option</strong>&nbsp;pour une utilisation optimale.</p>\n<p class="desc-title-1">SP&Eacute;CIFICATION</p>\n<ul>\n<li>Contr&ocirc;le les zones de chauffe</li>\n</ul>\n<ul>\n<li>3 modes disponibles (25&deg;C &agrave; 45 &deg;C)</li>\n</ul>\n<ul>\n<li>21 zones de chauffe</li>\n</ul>\n<ul>\n<li>Autonomie de&nbsp;4 &agrave; 8 heures avec notre batterie externe</li>\n</ul>\n<ul>\n<li>Mat&eacute;riau : Coton + Polyester</li>\n</ul>\n<ul>\n<li>Lavable en machine (&agrave; froid)</li>\n</ul>\n<p class="desc-title-2">GUIDE DES TAILLES</p>\n<p><img src="https://cdn.shopify.com/s/files/1/0646/6030/8205/files/Guide-Taille.png?v=1654271305" alt="" /></p>\n<div><em><strong>Ne s&eacute;lectionnez pas directement selon vos habitudes. Veuillez vous r&eacute;f&eacute;rencer &agrave; notre guide de taille et nous vous conseillons fortement de choisir&nbsp;une taille au-dessus !</strong></em></div>	{}	\N	\N
\.


--
-- TOC entry 4898 (class 0 OID 16456)
-- Dependencies: 217
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (uuid, email, password, adress, username, role, code, activated) FROM stdin;
42ed1c58-7cf5-4eaf-bca0-b6be3ca5850e	admin@admin.fr	admin	admin	admin	1	289211	f
\.


--
-- TOC entry 4902 (class 0 OID 41018)
-- Dependencies: 221
-- Data for Name: variation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.variation (uuid, stock, name, productuuid, "order") FROM stdin;
8a039889-f4a3-4bb7-9753-64bac6e20e4f	50	L	b3b31d89-102f-4ad3-863b-eed305751b57	0
9e13ee66-526c-4515-a38f-d990e848492a	40	M	b3b31d89-102f-4ad3-863b-eed305751b57	1
3d3ad427-6693-426c-8e51-75bbdada7e44	7	S	55ae63fd-f900-4d52-acd4-503d8964f277	0
5fbdcfcf-5af8-433a-97ac-d72dbfc28b2f	4	M	55ae63fd-f900-4d52-acd4-503d8964f277	1
89b31d38-77c5-460e-ae30-a1f1a3348843	2	L	55ae63fd-f900-4d52-acd4-503d8964f277	2
fef9f400-c2d0-4307-81f2-c46316c006ac	30	S	2448e21e-5804-46ff-949b-66142496767c	0
e2eac15f-01a1-4547-91f2-132fa1900fdc	45	M	2448e21e-5804-46ff-949b-66142496767c	1
c2877c92-004f-4637-b8f4-733fe08c2496	50	L	2448e21e-5804-46ff-949b-66142496767c	2
\.


--
-- TOC entry 4742 (class 2606 OID 41074)
-- Name: product PK_1442fd7cb5e0b32ff5d0b6c13d0; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "PK_1442fd7cb5e0b32ff5d0b6c13d0" PRIMARY KEY (uuid);


--
-- TOC entry 4752 (class 2606 OID 57444)
-- Name: commande PK_341218ebcdb301605edf9a47b83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT "PK_341218ebcdb301605edf9a47b83" PRIMARY KEY (uuid);


--
-- TOC entry 4744 (class 2606 OID 40966)
-- Name: categorie PK_35c423cbd23d6245fe4287a7e26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT "PK_35c423cbd23d6245fe4287a7e26" PRIMARY KEY (uuid);


--
-- TOC entry 4748 (class 2606 OID 41023)
-- Name: variation PK_5f5488d6dbbd2bfd2d5ef8970d9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variation
    ADD CONSTRAINT "PK_5f5488d6dbbd2bfd2d5ef8970d9" PRIMARY KEY (uuid);


--
-- TOC entry 4754 (class 2606 OID 65626)
-- Name: bloc PK_74816c2ebf722f8a75b2eebb4c9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bloc
    ADD CONSTRAINT "PK_74816c2ebf722f8a75b2eebb4c9" PRIMARY KEY (uuid);


--
-- TOC entry 4746 (class 2606 OID 41003)
-- Name: cart PK_7fec7d177c5c8d93ea9916ac46d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "PK_7fec7d177c5c8d93ea9916ac46d" PRIMARY KEY (uuid);


--
-- TOC entry 4740 (class 2606 OID 16463)
-- Name: user PK_a95e949168be7b7ece1a2382fed; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_a95e949168be7b7ece1a2382fed" PRIMARY KEY (uuid);


--
-- TOC entry 4750 (class 2606 OID 57435)
-- Name: contenu PK_ef008cb9a9e5b44cce93f8efd4c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenu
    ADD CONSTRAINT "PK_ef008cb9a9e5b44cce93f8efd4c" PRIMARY KEY (uuid);


-- Completed on 2024-02-05 13:47:33

--
-- PostgreSQL database dump complete
--

