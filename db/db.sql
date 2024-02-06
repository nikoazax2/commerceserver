--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.0

-- Started on 2024-02-06 12:20:41

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
-- TOC entry 3 (class 3079 OID 16398)
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
-- TOC entry 224 (class 1259 OID 24656)
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
-- TOC entry 220 (class 1259 OID 16432)
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "user" character varying(30) NOT NULL,
    product character varying(30) NOT NULL,
    quantity smallint NOT NULL,
    details character varying(400) NOT NULL
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16417)
-- Name: categorie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorie (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.categorie OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24647)
-- Name: commande; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commande (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    date date NOT NULL,
    useruuid character varying NOT NULL,
    products text[] DEFAULT '{}'::text[],
    etat integer NOT NULL,
    stripeid character varying NOT NULL,
    "shippingAddress" json NOT NULL
);


ALTER TABLE public.commande OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16444)
-- Name: contenu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contenu (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(30) NOT NULL,
    contenu character varying(100000),
    description character varying(500),
    page character varying(30),
    "order" integer,
    valeur character varying(30),
    photo boolean,
    image text[] DEFAULT '{}'::text[],
    type integer,
    removable boolean
);


ALTER TABLE public.contenu OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16423)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    categorieuuid uuid NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    prix double precision,
    name character varying(30),
    description character varying(100000),
    image text[] DEFAULT '{}'::text[],
    idapistripe character varying(100),
    ancienprixpromo double precision
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16409)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    username character varying(30) NOT NULL,
    role smallint NOT NULL,
    adress character varying(40) NOT NULL,
    email character varying(40) NOT NULL,
    password character varying NOT NULL,
    activated boolean DEFAULT false NOT NULL,
    code character varying(9)
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16438)
-- Name: variation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.variation (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    productuuid uuid NOT NULL,
    stock integer NOT NULL,
    name character varying(30) NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.variation OWNER TO postgres;

--
-- TOC entry 4905 (class 0 OID 24656)
-- Dependencies: 224
-- Data for Name: bloc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bloc (uuid, type, name, description, logo) FROM stdin;
a76a9a82-6b4b-4cbe-809e-806962e880e5	1	Texte	\N	mdi-format-color-text
ed0b9ce0-7829-40d7-8def-f0c8dc2dba89	2	Image	\N	mdi-image-multiple-outline
3eb5ca3c-a5a9-43df-a48a-ad68cc7955c8	4	Bouton	\N	mdi-button-pointer
e39c1f6b-d475-4246-a73d-cf263e871a8d	5	Articles	\N	mdi-shopping
\.


--
-- TOC entry 4901 (class 0 OID 16432)
-- Dependencies: 220
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (uuid, "user", product, quantity, details) FROM stdin;
\.


--
-- TOC entry 4899 (class 0 OID 16417)
-- Dependencies: 218
-- Data for Name: categorie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorie (uuid, name) FROM stdin;
f0bf36da-c128-41b2-ac36-7ce18b0a0841	Veste chauffante
\.


--
-- TOC entry 4904 (class 0 OID 24647)
-- Dependencies: 223
-- Data for Name: commande; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commande (uuid, date, useruuid, products, etat, stripeid, "shippingAddress") FROM stdin;
6e2e74e1-8664-4e79-888c-13ff8ca3f4ba	2024-02-01	c8c6d2b1-3e2f-4fd3-8189-4dd0f1841fc7	{}	1	pi_3Of8kYBTmmLQabfn0VrbWdTb	{"address":{"city":"Grenoble","country":"FR","line1":"4 rue jean macé","line2":null,"postal_code":"38000","state":""},"carrier":null,"name":"Nicolas Sage","phone":null,"tracking_number":null}
d300620f-e8cd-4938-8901-58f988d7172b	2024-02-01	c8c6d2b1-3e2f-4fd3-8189-4dd0f1841fc7	{}	1	pi_3Of8yfBTmmLQabfn1V9mQ9ml	{"address":{"city":"Grenoble","country":"FR","line1":"4 rue jean macé","line2":null,"postal_code":"38000","state":""},"carrier":null,"name":"Nicolas Sage","phone":null,"tracking_number":null}
acab087c-8af6-424c-aba3-af0ddf27cccc	2024-02-01	64a7482a-f5e1-42cb-85f4-e3a1495faa56	{}	1	pi_3Of8kYBTmmLQabfn0VrbWdTb	{"address":{"city":"Grenoble","country":"FR","line1":"4 rue jean macé","line2":null,"postal_code":"38000","state":""},"carrier":null,"name":"Nicolas Sage","phone":null,"tracking_number":null}
8aeadcf6-8a63-4a82-80ff-ab7b6a5ed8d6	2024-02-02	64a7482a-f5e1-42cb-85f4-e3a1495faa56	{}	1	pi_3Of8RbBTmmLQabfn2s1JQUHN	{"address":{"city":"Grenoble","country":"FR","line1":"4 rue jean macé","line2":null,"postal_code":"38000","state":""},"carrier":null,"name":"Nicolas Sage","phone":null,"tracking_number":null}
3ea9a733-ca36-41de-829b-a615419729ec	2024-02-02	c8c6d2b1-3e2f-4fd3-8189-4dd0f1841fc7	{}	1	pi_3OfNMjBTmmLQabfn02XyYtyI	{"address":{"city":"fqez","country":"FR","line1":"dza","line2":null,"postal_code":"44422424","state":""},"carrier":null,"name":"dza","phone":null,"tracking_number":null}
\.


--
-- TOC entry 4903 (class 0 OID 16444)
-- Dependencies: 222
-- Data for Name: contenu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contenu (uuid, name, contenu, description, page, "order", valeur, photo, image, type, removable) FROM stdin;
ed320d46-9f57-4456-8600-1c6f8906f488	Texte	<p>ffeazfze</p>	\N	accueil	0		\N	{}	1	t
53e1de49-86f9-47f4-a78d-d35fe4492096	Image	[{"url":"","titre":""}]	\N	accueil	1		\N	{c5836c33-17da-4dac-85c1-c54c558ca840}	2	t
a075e4de-87bb-4aa4-b011-508822587913	Texte	<p>mentions</p>	\N	mentions-legales	0		\N	{}	1	t
1aaeb62a-a911-412f-9e15-0d2f3153097d	Message bandeau du haut	<p>🔥 -20% SUR NOS VESTES CHAUFFANTES (HORS OPTION BATTERIE)</p>	\N	Général	2	message-bandeau-haut	\N	{}	1	\N
5f940d34-fed1-4ef0-b9ff-98c4339d9942	Articles	{"nombre":5,"categories":["f0bf36da-c128-41b2-ac36-7ce18b0a0841"]}	\N	accueil	2		\N	{}	5	t
880e68ef-e1b3-4d4e-b4fe-c9e29acd6c53	Logo du site	[{"url":"","titre":"","unique":true},{"url":"","titre":""},{"url":"","titre":""},{"url":"","titre":""},{"url":"","titre":""},{"url":"","titre":""},{"url":"","titre":""},{"url":"","titre":""}]	\N	Général	0	logo-site	\N	{64940d53-685c-4265-9664-c9b440defe9f}	2	\N
cca1f19b-75de-4e52-a496-a4b6689acc34	Couleur du site	#3F51B5	\N	Général	1	couleur-site	\N	{}	3	\N
\.


--
-- TOC entry 4900 (class 0 OID 16423)
-- Dependencies: 219
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (categorieuuid, uuid, prix, name, description, image, idapistripe, ancienprixpromo) FROM stdin;
f0bf36da-c128-41b2-ac36-7ce18b0a0841	68300a68-5035-4d6b-b4dd-f16e52db17a4	500	Veste chaude	<h2>L'INCONTOURNABLE GILET CHAUFFANT BLEU POUR LUTTER CONTRE LE FROID HIVERNAL</h2>\n<p>Le gilet chauffant bleu vous apporte&nbsp;<strong>confort et chaleur</strong>&nbsp;durant tout l&rsquo;hiver. Ce mod&egrave;le sans manches est id&eacute;al si vous travaillez en ext&eacute;rieur ou que vous avez besoin de rester libre de vos mouvements. Sa coupe ajust&eacute;e et ses diff&eacute;rentes r&eacute;sistances vous prot&egrave;gent du froid. Le gilet chauffant bleu est &eacute;quip&eacute; de&nbsp;<strong>17 r&eacute;sistances chauffantes</strong>&nbsp;situ&eacute;es sur tout le dos, les lombaires, la nuque, les &eacute;paules et le buste. Elles vous permettent de vous r&eacute;chauffer en quelques minutes d&egrave;s que vous en ressentez le besoin. Son utilisation est tr&egrave;s simple, et le gilet chauffant s&rsquo;active simplement avec un bouton de mise en marche situ&eacute; sur le devant de la veste. Vous pouvez s&eacute;lectionner 3 modes d'intensit&eacute; diff&eacute;rents en fonction de vos besoins.</p>\n<p>La veste doit &ecirc;tre&nbsp;<strong>branch&eacute;e &agrave; une batterie externe</strong>&nbsp;pour fonctionner. Elle a un port USB d&eacute;di&eacute; &agrave; la batterie, alors n'oubliez pas d'acqu&eacute;rir notre batterie externe&nbsp;<strong>en option</strong>&nbsp;pour une utilisation optimale.</p>\n<p class="desc-title-1">SP&Eacute;CIFICATION</p>\n<ul>\n<li>Contr&ocirc;le&nbsp;les zones de chauffe</li>\n</ul>\n<ul>\n<li>3 modes disponibles (25&deg;C &agrave; 45 &deg;C)</li>\n</ul>\n<ul>\n<li>17 zones de chauffe</li>\n</ul>\n<ul>\n<li>Autonomie&nbsp;de 4 &agrave; 8 heures avec notre batterie externe</li>\n</ul>\n<ul>\n<li>Mat&eacute;riau : Coton + Polyester</li>\n</ul>\n<ul>\n<li>Lavable en machine (&agrave; froid)</li>\n</ul>\n<p class="desc-title-2">GUIDE DES TAILLES</p>\n<p><img src="https://cdn.shopify.com/s/files/1/0646/6030/8205/files/Guide-Taille.png?v=1654271305" alt="" /></p>\n<div><em><strong>Ne s&eacute;lectionnez pas directement selon vos habitudes. Veuillez vous r&eacute;f&eacute;rencer &agrave; notre guide de taille et nous vous conseillons fortement de choisir&nbsp;une taille au-dessus !</strong></em></div>	{3c5c1511-6704-4a9f-b288-6e9e2edc27e3,6c55a3a1-0d10-47a4-8b03-e9d84904117b}	\N	\N
f0bf36da-c128-41b2-ac36-7ce18b0a0841	e9efb194-b422-41bc-807c-4736ec1b1319	60	Veste chaude	<h2>L'INCONTOURNABLE GILET CHAUFFANT BLEU POUR LUTTER CONTRE LE FROID HIVERNAL</h2>\n<p>Le gilet chauffant bleu vous apporte&nbsp;<strong>confort et chaleur</strong>&nbsp;durant tout l&rsquo;hiver. Ce mod&egrave;le sans manches est id&eacute;al si vous travaillez en ext&eacute;rieur ou que vous avez besoin de rester libre de vos mouvements. Sa coupe ajust&eacute;e et ses diff&eacute;rentes r&eacute;sistances vous prot&egrave;gent du froid. Le gilet chauffant bleu est &eacute;quip&eacute; de&nbsp;<strong>17 r&eacute;sistances chauffantes</strong>&nbsp;situ&eacute;es sur tout le dos, les lombaires, la nuque, les &eacute;paules et le buste. Elles vous permettent de vous r&eacute;chauffer en quelques minutes d&egrave;s que vous en ressentez le besoin. Son utilisation est tr&egrave;s simple, et le gilet chauffant s&rsquo;active simplement avec un bouton de mise en marche situ&eacute; sur le devant de la veste. Vous pouvez s&eacute;lectionner 3 modes d'intensit&eacute; diff&eacute;rents en fonction de vos besoins.</p>\n<p>La veste doit &ecirc;tre&nbsp;<strong>branch&eacute;e &agrave; une batterie externe</strong>&nbsp;pour fonctionner. Elle a un port USB d&eacute;di&eacute; &agrave; la batterie, alors n'oubliez pas d'acqu&eacute;rir notre batterie externe&nbsp;<strong>en option</strong>&nbsp;pour une utilisation optimale.</p>\n<p class="desc-title-1">SP&Eacute;CIFICATION</p>\n<ul>\n<li>Contr&ocirc;le&nbsp;les zones de chauffe</li>\n</ul>\n<ul>\n<li>3 modes disponibles (25&deg;C &agrave; 45 &deg;C)</li>\n</ul>\n<ul>\n<li>17 zones de chauffe</li>\n</ul>\n<ul>\n<li>Autonomie&nbsp;de 4 &agrave; 8 heures avec notre batterie externe</li>\n</ul>\n<ul>\n<li>Mat&eacute;riau : Coton + Polyester</li>\n</ul>\n<ul>\n<li>Lavable en machine (&agrave; froid)</li>\n</ul>\n<p class="desc-title-2">GUIDE DES TAILLES</p>\n<p><img src="https://cdn.shopify.com/s/files/1/0646/6030/8205/files/Guide-Taille.png?v=1654271305" alt="" /></p>\n<div><em><strong>Ne s&eacute;lectionnez pas directement selon vos habitudes. Veuillez vous r&eacute;f&eacute;rencer &agrave; notre guide de taille et nous vous conseillons fortement de choisir&nbsp;une taille au-dessus !</strong></em></div>	{3c5c1511-6704-4a9f-b288-6e9e2edc27e3,6c55a3a1-0d10-47a4-8b03-e9d84904117b}	price_1OAFEUBTmmLQabfn3cTgCKsb	80
f0bf36da-c128-41b2-ac36-7ce18b0a0841	510df92e-96fc-4990-812e-87fab2185b8d	60	Veste chaude	<h2>L'INCONTOURNABLE GILET CHAUFFANT BLEU POUR LUTTER CONTRE LE FROID HIVERNAL</h2>\n<p>Le gilet chauffant bleu vous apporte&nbsp;<strong>confort et chaleur</strong>&nbsp;durant tout l&rsquo;hiver. Ce mod&egrave;le sans manches est id&eacute;al si vous travaillez en ext&eacute;rieur ou que vous avez besoin de rester libre de vos mouvements. Sa coupe ajust&eacute;e et ses diff&eacute;rentes r&eacute;sistances vous prot&egrave;gent du froid. Le gilet chauffant bleu est &eacute;quip&eacute; de&nbsp;<strong>17 r&eacute;sistances chauffantes</strong>&nbsp;situ&eacute;es sur tout le dos, les lombaires, la nuque, les &eacute;paules et le buste. Elles vous permettent de vous r&eacute;chauffer en quelques minutes d&egrave;s que vous en ressentez le besoin. Son utilisation est tr&egrave;s simple, et le gilet chauffant s&rsquo;active simplement avec un bouton de mise en marche situ&eacute; sur le devant de la veste. Vous pouvez s&eacute;lectionner 3 modes d'intensit&eacute; diff&eacute;rents en fonction de vos besoins.</p>\n<p>La veste doit &ecirc;tre&nbsp;<strong>branch&eacute;e &agrave; une batterie externe</strong>&nbsp;pour fonctionner. Elle a un port USB d&eacute;di&eacute; &agrave; la batterie, alors n'oubliez pas d'acqu&eacute;rir notre batterie externe&nbsp;<strong>en option</strong>&nbsp;pour une utilisation optimale.</p>\n<p class="desc-title-1">SP&Eacute;CIFICATION</p>\n<ul>\n<li>Contr&ocirc;le&nbsp;les zones de chauffe</li>\n</ul>\n<ul>\n<li>3 modes disponibles (25&deg;C &agrave; 45 &deg;C)</li>\n</ul>\n<ul>\n<li>17 zones de chauffe</li>\n</ul>\n<ul>\n<li>Autonomie&nbsp;de 4 &agrave; 8 heures avec notre batterie externe</li>\n</ul>\n<ul>\n<li>Mat&eacute;riau : Coton + Polyester</li>\n</ul>\n<ul>\n<li>Lavable en machine (&agrave; froid)</li>\n</ul>\n<p class="desc-title-2">GUIDE DES TAILLES</p>\n<p><img src="https://cdn.shopify.com/s/files/1/0646/6030/8205/files/Guide-Taille.png?v=1654271305" alt="" /></p>\n<div><em><strong>Ne s&eacute;lectionnez pas directement selon vos habitudes. Veuillez vous r&eacute;f&eacute;rencer &agrave; notre guide de taille et nous vous conseillons fortement de choisir&nbsp;une taille au-dessus !</strong></em></div>	{3c5c1511-6704-4a9f-b288-6e9e2edc27e3,6c55a3a1-0d10-47a4-8b03-e9d84904117b}	price_1OAFEUBTmmLQabfn3cTgCKsb	80
f0bf36da-c128-41b2-ac36-7ce18b0a0841	63a646f2-1268-461f-805a-288588bc24c5	60	Veste chaude	<h2>L'INCONTOURNABLE GILET CHAUFFANT BLEU POUR LUTTER CONTRE LE FROID HIVERNAL</h2>\n<p>Le gilet chauffant bleu vous apporte&nbsp;<strong>confort et chaleur</strong>&nbsp;durant tout l&rsquo;hiver. Ce mod&egrave;le sans manches est id&eacute;al si vous travaillez en ext&eacute;rieur ou que vous avez besoin de rester libre de vos mouvements. Sa coupe ajust&eacute;e et ses diff&eacute;rentes r&eacute;sistances vous prot&egrave;gent du froid. Le gilet chauffant bleu est &eacute;quip&eacute; de&nbsp;<strong>17 r&eacute;sistances chauffantes</strong>&nbsp;situ&eacute;es sur tout le dos, les lombaires, la nuque, les &eacute;paules et le buste. Elles vous permettent de vous r&eacute;chauffer en quelques minutes d&egrave;s que vous en ressentez le besoin. Son utilisation est tr&egrave;s simple, et le gilet chauffant s&rsquo;active simplement avec un bouton de mise en marche situ&eacute; sur le devant de la veste. Vous pouvez s&eacute;lectionner 3 modes d'intensit&eacute; diff&eacute;rents en fonction de vos besoins.</p>\n<p>La veste doit &ecirc;tre&nbsp;<strong>branch&eacute;e &agrave; une batterie externe</strong>&nbsp;pour fonctionner. Elle a un port USB d&eacute;di&eacute; &agrave; la batterie, alors n'oubliez pas d'acqu&eacute;rir notre batterie externe&nbsp;<strong>en option</strong>&nbsp;pour une utilisation optimale.</p>\n<p class="desc-title-1">SP&Eacute;CIFICATION</p>\n<ul>\n<li>Contr&ocirc;le&nbsp;les zones de chauffe</li>\n</ul>\n<ul>\n<li>3 modes disponibles (25&deg;C &agrave; 45 &deg;C)</li>\n</ul>\n<ul>\n<li>17 zones de chauffe</li>\n</ul>\n<ul>\n<li>Autonomie&nbsp;de 4 &agrave; 8 heures avec notre batterie externe</li>\n</ul>\n<ul>\n<li>Mat&eacute;riau : Coton + Polyester</li>\n</ul>\n<ul>\n<li>Lavable en machine (&agrave; froid)</li>\n</ul>\n<p class="desc-title-2">GUIDE DES TAILLES</p>\n<p><img src="https://cdn.shopify.com/s/files/1/0646/6030/8205/files/Guide-Taille.png?v=1654271305" alt="" /></p>\n<div><em><strong>Ne s&eacute;lectionnez pas directement selon vos habitudes. Veuillez vous r&eacute;f&eacute;rencer &agrave; notre guide de taille et nous vous conseillons fortement de choisir&nbsp;une taille au-dessus !</strong></em></div>	{3c5c1511-6704-4a9f-b288-6e9e2edc27e3,6c55a3a1-0d10-47a4-8b03-e9d84904117b}	price_1OAFEUBTmmLQabfn3cTgCKsb	80
f0bf36da-c128-41b2-ac36-7ce18b0a0841	c1e886aa-9965-4fcb-94eb-fc92e1a5c010	60	Veste chaude	<h2>L'INCONTOURNABLE GILET CHAUFFANT BLEU POUR LUTTER CONTRE LE FROID HIVERNAL</h2>\n<p>Le gilet chauffant bleu vous apporte&nbsp;<strong>confort et chaleur</strong>&nbsp;durant tout l&rsquo;hiver. Ce mod&egrave;le sans manches est id&eacute;al si vous travaillez en ext&eacute;rieur ou que vous avez besoin de rester libre de vos mouvements. Sa coupe ajust&eacute;e et ses diff&eacute;rentes r&eacute;sistances vous prot&egrave;gent du froid. Le gilet chauffant bleu est &eacute;quip&eacute; de&nbsp;<strong>17 r&eacute;sistances chauffantes</strong>&nbsp;situ&eacute;es sur tout le dos, les lombaires, la nuque, les &eacute;paules et le buste. Elles vous permettent de vous r&eacute;chauffer en quelques minutes d&egrave;s que vous en ressentez le besoin. Son utilisation est tr&egrave;s simple, et le gilet chauffant s&rsquo;active simplement avec un bouton de mise en marche situ&eacute; sur le devant de la veste. Vous pouvez s&eacute;lectionner 3 modes d'intensit&eacute; diff&eacute;rents en fonction de vos besoins.</p>\n<p>La veste doit &ecirc;tre&nbsp;<strong>branch&eacute;e &agrave; une batterie externe</strong>&nbsp;pour fonctionner. Elle a un port USB d&eacute;di&eacute; &agrave; la batterie, alors n'oubliez pas d'acqu&eacute;rir notre batterie externe&nbsp;<strong>en option</strong>&nbsp;pour une utilisation optimale.</p>\n<p class="desc-title-1">SP&Eacute;CIFICATION</p>\n<ul>\n<li>Contr&ocirc;le&nbsp;les zones de chauffe</li>\n</ul>\n<ul>\n<li>3 modes disponibles (25&deg;C &agrave; 45 &deg;C)</li>\n</ul>\n<ul>\n<li>17 zones de chauffe</li>\n</ul>\n<ul>\n<li>Autonomie&nbsp;de 4 &agrave; 8 heures avec notre batterie externe</li>\n</ul>\n<ul>\n<li>Mat&eacute;riau : Coton + Polyester</li>\n</ul>\n<ul>\n<li>Lavable en machine (&agrave; froid)</li>\n</ul>\n<p class="desc-title-2">GUIDE DES TAILLES</p>\n<p><img src="https://cdn.shopify.com/s/files/1/0646/6030/8205/files/Guide-Taille.png?v=1654271305" alt="" /></p>\n<div><em><strong>Ne s&eacute;lectionnez pas directement selon vos habitudes. Veuillez vous r&eacute;f&eacute;rencer &agrave; notre guide de taille et nous vous conseillons fortement de choisir&nbsp;une taille au-dessus !</strong></em></div>	{3c5c1511-6704-4a9f-b288-6e9e2edc27e3,6c55a3a1-0d10-47a4-8b03-e9d84904117b}	price_1OAFEUBTmmLQabfn3cTgCKsb	80
f0bf36da-c128-41b2-ac36-7ce18b0a0841	5abd10db-ba33-4ee4-93d0-df1433018788	60	Veste chaude	<h2>L'INCONTOURNABLE GILET CHAUFFANT BLEU POUR LUTTER CONTRE LE FROID HIVERNAL</h2>\n<p>Le gilet chauffant bleu vous apporte&nbsp;<strong>confort et chaleur</strong>&nbsp;durant tout l&rsquo;hiver. Ce mod&egrave;le sans manches est id&eacute;al si vous travaillez en ext&eacute;rieur ou que vous avez besoin de rester libre de vos mouvements. Sa coupe ajust&eacute;e et ses diff&eacute;rentes r&eacute;sistances vous prot&egrave;gent du froid. Le gilet chauffant bleu est &eacute;quip&eacute; de&nbsp;<strong>17 r&eacute;sistances chauffantes</strong>&nbsp;situ&eacute;es sur tout le dos, les lombaires, la nuque, les &eacute;paules et le buste. Elles vous permettent de vous r&eacute;chauffer en quelques minutes d&egrave;s que vous en ressentez le besoin. Son utilisation est tr&egrave;s simple, et le gilet chauffant s&rsquo;active simplement avec un bouton de mise en marche situ&eacute; sur le devant de la veste. Vous pouvez s&eacute;lectionner 3 modes d'intensit&eacute; diff&eacute;rents en fonction de vos besoins.</p>\n<p>La veste doit &ecirc;tre&nbsp;<strong>branch&eacute;e &agrave; une batterie externe</strong>&nbsp;pour fonctionner. Elle a un port USB d&eacute;di&eacute; &agrave; la batterie, alors n'oubliez pas d'acqu&eacute;rir notre batterie externe&nbsp;<strong>en option</strong>&nbsp;pour une utilisation optimale.</p>\n<p class="desc-title-1">SP&Eacute;CIFICATION</p>\n<ul>\n<li>Contr&ocirc;le&nbsp;les zones de chauffe</li>\n</ul>\n<ul>\n<li>3 modes disponibles (25&deg;C &agrave; 45 &deg;C)</li>\n</ul>\n<ul>\n<li>17 zones de chauffe</li>\n</ul>\n<ul>\n<li>Autonomie&nbsp;de 4 &agrave; 8 heures avec notre batterie externe</li>\n</ul>\n<ul>\n<li>Mat&eacute;riau : Coton + Polyester</li>\n</ul>\n<ul>\n<li>Lavable en machine (&agrave; froid)</li>\n</ul>\n<p class="desc-title-2">GUIDE DES TAILLES</p>\n<p><img src="https://cdn.shopify.com/s/files/1/0646/6030/8205/files/Guide-Taille.png?v=1654271305" alt="" /></p>\n<div><em><strong>Ne s&eacute;lectionnez pas directement selon vos habitudes. Veuillez vous r&eacute;f&eacute;rencer &agrave; notre guide de taille et nous vous conseillons fortement de choisir&nbsp;une taille au-dessus !</strong></em></div>	{3c5c1511-6704-4a9f-b288-6e9e2edc27e3,6c55a3a1-0d10-47a4-8b03-e9d84904117b}	price_1OAFEUBTmmLQabfn3cTgCKsb	80
f0bf36da-c128-41b2-ac36-7ce18b0a0841	d3b8bdb8-8b47-4eec-8e72-10f07cf044a5	0.5	Veste chaude	<h2>L'INCONTOURNABLE GILET CHAUFFANT BLEU POUR LUTTER CONTRE LE FROID HIVERNAL</h2>\n<p>Le gilet chauffant bleu vous apporte&nbsp;<strong>confort et chaleur</strong>&nbsp;durant tout l&rsquo;hiver. Ce mod&egrave;le sans manches est id&eacute;al si vous travaillez en ext&eacute;rieur ou que vous avez besoin de rester libre de vos mouvements. Sa coupe ajust&eacute;e et ses diff&eacute;rentes r&eacute;sistances vous prot&egrave;gent du froid. Le gilet chauffant bleu est &eacute;quip&eacute; de&nbsp;<strong>17 r&eacute;sistances chauffantes</strong>&nbsp;situ&eacute;es sur tout le dos, les lombaires, la nuque, les &eacute;paules et le buste. Elles vous permettent de vous r&eacute;chauffer en quelques minutes d&egrave;s que vous en ressentez le besoin. Son utilisation est tr&egrave;s simple, et le gilet chauffant s&rsquo;active simplement avec un bouton de mise en marche situ&eacute; sur le devant de la veste. Vous pouvez s&eacute;lectionner 3 modes d'intensit&eacute; diff&eacute;rents en fonction de vos besoins.</p>\n<p>La veste doit &ecirc;tre&nbsp;<strong>branch&eacute;e &agrave; une batterie externe</strong>&nbsp;pour fonctionner. Elle a un port USB d&eacute;di&eacute; &agrave; la batterie, alors n'oubliez pas d'acqu&eacute;rir notre batterie externe&nbsp;<strong>en option</strong>&nbsp;pour une utilisation optimale.</p>\n<p class="desc-title-1">SP&Eacute;CIFICATION</p>\n<ul>\n<li>Contr&ocirc;le&nbsp;les zones de chauffe</li>\n</ul>\n<ul>\n<li>3 modes disponibles (25&deg;C &agrave; 45 &deg;C)</li>\n</ul>\n<ul>\n<li>17 zones de chauffe</li>\n</ul>\n<ul>\n<li>Autonomie&nbsp;de 4 &agrave; 8 heures avec notre batterie externe</li>\n</ul>\n<ul>\n<li>Mat&eacute;riau : Coton + Polyester</li>\n</ul>\n<ul>\n<li>Lavable en machine (&agrave; froid)</li>\n</ul>\n<p class="desc-title-2">GUIDE DES TAILLES</p>\n<p><img src="https://cdn.shopify.com/s/files/1/0646/6030/8205/files/Guide-Taille.png?v=1654271305" alt="" /></p>\n<div><em><strong>Ne s&eacute;lectionnez pas directement selon vos habitudes. Veuillez vous r&eacute;f&eacute;rencer &agrave; notre guide de taille et nous vous conseillons fortement de choisir&nbsp;une taille au-dessus !</strong></em></div>	{3c5c1511-6704-4a9f-b288-6e9e2edc27e3,6c55a3a1-0d10-47a4-8b03-e9d84904117b}	price_1OeENuBTmmLQabfnVpQajrLV	80
\.


--
-- TOC entry 4898 (class 0 OID 16409)
-- Dependencies: 217
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (uuid, username, role, adress, email, password, activated, code) FROM stdin;
c8c6d2b1-3e2f-4fd3-8189-4dd0f1841fc7	admin	1	4 rue jean macé	admin@admin.fr	ZWWq8bMwZYfNdwR	t	\N
64a7482a-f5e1-42cb-85f4-e3a1495faa56		2		alastralazar38@gmail.com	kKxccczv6PgQZVY	t	733108518
\.


--
-- TOC entry 4902 (class 0 OID 16438)
-- Dependencies: 221
-- Data for Name: variation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.variation (uuid, productuuid, stock, name, "order") FROM stdin;
7e339937-c4b1-4e2f-8c4e-e726ebb1aba7	68300a68-5035-4d6b-b4dd-f16e52db17a4	10	S	0
cb903dde-6fce-4af9-a7a1-53729e0c35cf	68300a68-5035-4d6b-b4dd-f16e52db17a4	5	L	1
52b41b00-83eb-4142-a251-4fcb5dfe5cb1	d3b8bdb8-8b47-4eec-8e72-10f07cf044a5	5	L	0
\.


--
-- TOC entry 4744 (class 2606 OID 16431)
-- Name: product PK_1442fd7cb5e0b32ff5d0b6c13d0; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "PK_1442fd7cb5e0b32ff5d0b6c13d0" PRIMARY KEY (uuid);


--
-- TOC entry 4752 (class 2606 OID 24655)
-- Name: commande PK_341218ebcdb301605edf9a47b83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT "PK_341218ebcdb301605edf9a47b83" PRIMARY KEY (uuid);


--
-- TOC entry 4742 (class 2606 OID 16422)
-- Name: categorie PK_35c423cbd23d6245fe4287a7e26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT "PK_35c423cbd23d6245fe4287a7e26" PRIMARY KEY (uuid);


--
-- TOC entry 4748 (class 2606 OID 16443)
-- Name: variation PK_5f5488d6dbbd2bfd2d5ef8970d9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variation
    ADD CONSTRAINT "PK_5f5488d6dbbd2bfd2d5ef8970d9" PRIMARY KEY (uuid);


--
-- TOC entry 4754 (class 2606 OID 24663)
-- Name: bloc PK_74816c2ebf722f8a75b2eebb4c9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bloc
    ADD CONSTRAINT "PK_74816c2ebf722f8a75b2eebb4c9" PRIMARY KEY (uuid);


--
-- TOC entry 4746 (class 2606 OID 16437)
-- Name: cart PK_7fec7d177c5c8d93ea9916ac46d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "PK_7fec7d177c5c8d93ea9916ac46d" PRIMARY KEY (uuid);


--
-- TOC entry 4740 (class 2606 OID 16416)
-- Name: user PK_a95e949168be7b7ece1a2382fed; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_a95e949168be7b7ece1a2382fed" PRIMARY KEY (uuid);


--
-- TOC entry 4750 (class 2606 OID 16449)
-- Name: contenu PK_ef008cb9a9e5b44cce93f8efd4c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenu
    ADD CONSTRAINT "PK_ef008cb9a9e5b44cce93f8efd4c" PRIMARY KEY (uuid);


-- Completed on 2024-02-06 12:20:42

--
-- PostgreSQL database dump complete
--

