--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.0

-- Started on 2024-02-25 19:33:35

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
-- TOC entry 2 (class 3079 OID 41141)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 41201)
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
-- TOC entry 217 (class 1259 OID 41161)
-- Name: categorie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorie (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(30) NOT NULL,
    image text
);


ALTER TABLE public.categorie OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 41193)
-- Name: commande; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commande (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    stripeid character varying NOT NULL,
    "shippingAddress" json NOT NULL,
    products json,
    date date NOT NULL,
    useruuid character varying NOT NULL,
    etat integer NOT NULL
);


ALTER TABLE public.commande OWNER TO postgres;

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
-- TOC entry 218 (class 1259 OID 41169)
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
-- TOC entry 216 (class 1259 OID 41152)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    username character varying(30) NOT NULL,
    role smallint NOT NULL,
    adress character varying(40) NOT NULL,
    email character varying(40) NOT NULL,
    code character varying(9),
    activated boolean DEFAULT false NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 41178)
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
-- TOC entry 4895 (class 0 OID 41201)
-- Dependencies: 222
-- Data for Name: bloc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bloc (uuid, type, name, description, logo) FROM stdin;
a76a9a82-6b4b-4cbe-809e-806962e880e5	1	Texte	\N	mdi-format-color-text
ed0b9ce0-7829-40d7-8def-f0c8dc2dba89	2	Image	\N	mdi-image-multiple-outline
3eb5ca3c-a5a9-43df-a48a-ad68cc7955c8	4	Bouton	\N	mdi-button-pointer
e39c1f6b-d475-4246-a73d-cf263e871a8d	5	Articles	\N	mdi-shopping
ca1bf92a-0a44-41ec-86d8-58e8d523f11d	6	Catégories	\N	mdi-palette-swatch-variant
5be3a1e8-9b62-4eef-aef5-5ccd2c2f1f1a	9	Code	\N	mdi-xml
\.


--
-- TOC entry 4890 (class 0 OID 41161)
-- Dependencies: 217
-- Data for Name: categorie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorie (uuid, name, image) FROM stdin;
4967aea9-803c-4a30-9847-bab67a1d99ba	Women	\N
7674fd39-cbcf-4831-9abf-7c3567cb3f30	Men	\N
\.


--
-- TOC entry 4894 (class 0 OID 41193)
-- Dependencies: 221
-- Data for Name: commande; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commande (uuid, stripeid, "shippingAddress", products, date, useruuid, etat) FROM stdin;
2996ca4a-a8e1-47ce-9302-c119def102df	pi_3OlqaRBTmmLQabfn0X0Kci0R	{"address":{"city":"Grenoble","country":"FR","line1":"4 rue jean macé","line2":null,"postal_code":"38000","state":""},"carrier":null,"name":"Nicolas Sage","phone":null,"tracking_number":null}	[{"productuuid":"ff597073-a46e-435a-9d11-ec38af982570","quantity":1,"prix":18}]	2024-02-20	7cffa802-88be-432d-b4fa-46253ab58020	1
\.


--
-- TOC entry 4893 (class 0 OID 41184)
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
-- TOC entry 4891 (class 0 OID 41169)
-- Dependencies: 218
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (categorieuuid, uuid, prix, name, description, image, idapistripe, ancienprixpromo) FROM stdin;
7674fd39-cbcf-4831-9abf-7c3567cb3f30	23def789-4149-4b01-a951-36ec5652279c	35	T-Shirt Name 10	<div class="elementor-element elementor-element-4e1ff84 elementor-widget elementor-widget-heading" data-id="4e1ff84" data-element_type="widget" data-widget_type="heading.default">\n<div class="elementor-widget-container">\n<h6 class="elementor-heading-title elementor-size-default">ABOUT THE PRODUCT</h6>\n</div>\n</div>\n<div class="elementor-element elementor-element-63e8c9e elementor-widget elementor-widget-text-editor" data-id="63e8c9e" data-element_type="widget" data-widget_type="text-editor.default">\n<div class="elementor-widget-container">\n<p>Our T-Shirts are lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.</p>\n</div>\n</div>\n<div class="elementor-element elementor-element-4dd153f elementor-icon-list--layout-traditional elementor-list-item-link-full_width elementor-widget elementor-widget-icon-list" data-id="4dd153f" data-element_type="widget" data-widget_type="icon-list.default">\n<div class="elementor-widget-container">\n<ul class="elementor-icon-list-items">\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">100% Cotton</span></li>\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">260gsm</span></li>\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">Breathable Fabric</span></li>\n</ul>\n</div>\n</div>\n<div class="elementor-element elementor-element-e8a6499 elementor-widget-divider--view-line elementor-widget elementor-widget-divider" data-id="e8a6499" data-element_type="widget" data-widget_type="divider.default">\n<div class="elementor-widget-container">\n<div class="elementor-divider">&nbsp;</div>\n</div>\n</div>\n<div class="elementor-element elementor-element-278be34 elementor-widget elementor-widget-heading" data-id="278be34" data-element_type="widget" data-widget_type="heading.default">\n<div class="elementor-widget-container">\n<h6 class="elementor-heading-title elementor-size-default">SIZE &amp; FIT</h6>\n</div>\n</div>\n<div class="elementor-element elementor-element-f506ea7 elementor-icon-list--layout-traditional elementor-list-item-link-full_width elementor-widget elementor-widget-icon-list" data-id="f506ea7" data-element_type="widget" data-widget_type="icon-list.default">\n<div class="elementor-widget-container">\n<ul class="elementor-icon-list-items">\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">Model is wearing size M and is 6'1"</span></li>\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">Standard fit for a relaxed, easy feel</span></li>\n</ul>\n</div>\n</div>\n<div class="elementor-element elementor-element-d1f0f3f elementor-widget-divider--view-line elementor-widget elementor-widget-divider" data-id="d1f0f3f" data-element_type="widget" data-widget_type="divider.default">\n<div class="elementor-widget-container">\n<div class="elementor-divider">&nbsp;</div>\n</div>\n</div>\n<div class="elementor-element elementor-element-b150dac elementor-widget elementor-widget-heading" data-id="b150dac" data-element_type="widget" data-widget_type="heading.default">\n<div class="elementor-widget-container">\n<h6 class="elementor-heading-title elementor-size-default">FREE DELIVERY &amp; RETURNS</h6>\n</div>\n</div>\n<div class="elementor-element elementor-element-5110c2c elementor-widget elementor-widget-text-editor" data-id="5110c2c" data-element_type="widget" data-widget_type="text-editor.default">\n<div class="elementor-widget-container">\n<p>Free standard delivery on orders over $60.</p>\n</div>\n</div>\n<div class="elementor-element elementor-element-3722195 elementor-icon-list--layout-traditional elementor-list-item-link-full_width elementor-widget elementor-widget-icon-list" data-id="3722195" data-element_type="widget" data-widget_type="icon-list.default">\n<div class="elementor-widget-container">\n<ul class="elementor-icon-list-items">\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">You can return your order for any reason, free of charge, within 30 days</span></li>\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">We also offer a Free-of-Charge shipping label</span></li>\n</ul>\n</div>\n</div>	{8ec59e28-0f40-4f02-b150-f1436db0f7a3,6b951946-699d-4ed0-b9e4-3187f867181e,e80dfa11-a91d-4741-ba15-fc0ae8bf3a16,33fc119a-76c9-4070-9028-45c8a7a330b8}	price_1OnmRYBTmmLQabfn6vAkIKX0	40
7674fd39-cbcf-4831-9abf-7c3567cb3f30	adc9810f-90c8-4e1a-823d-cbb92e2e06b1	35	T-Shirt Name 10	<div class="elementor-element elementor-element-4e1ff84 elementor-widget elementor-widget-heading" data-id="4e1ff84" data-element_type="widget" data-widget_type="heading.default">\n<div class="elementor-widget-container">\n<h6 class="elementor-heading-title elementor-size-default">ABOUT THE PRODUCT</h6>\n</div>\n</div>\n<div class="elementor-element elementor-element-63e8c9e elementor-widget elementor-widget-text-editor" data-id="63e8c9e" data-element_type="widget" data-widget_type="text-editor.default">\n<div class="elementor-widget-container">\n<p>Our T-Shirts are lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.</p>\n</div>\n</div>\n<div class="elementor-element elementor-element-4dd153f elementor-icon-list--layout-traditional elementor-list-item-link-full_width elementor-widget elementor-widget-icon-list" data-id="4dd153f" data-element_type="widget" data-widget_type="icon-list.default">\n<div class="elementor-widget-container">\n<ul class="elementor-icon-list-items">\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">100% Cotton</span></li>\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">260gsm</span></li>\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">Breathable Fabric</span></li>\n</ul>\n</div>\n</div>\n<div class="elementor-element elementor-element-e8a6499 elementor-widget-divider--view-line elementor-widget elementor-widget-divider" data-id="e8a6499" data-element_type="widget" data-widget_type="divider.default">\n<div class="elementor-widget-container">\n<div class="elementor-divider">&nbsp;</div>\n</div>\n</div>\n<div class="elementor-element elementor-element-278be34 elementor-widget elementor-widget-heading" data-id="278be34" data-element_type="widget" data-widget_type="heading.default">\n<div class="elementor-widget-container">\n<h6 class="elementor-heading-title elementor-size-default">SIZE &amp; FIT</h6>\n</div>\n</div>\n<div class="elementor-element elementor-element-f506ea7 elementor-icon-list--layout-traditional elementor-list-item-link-full_width elementor-widget elementor-widget-icon-list" data-id="f506ea7" data-element_type="widget" data-widget_type="icon-list.default">\n<div class="elementor-widget-container">\n<ul class="elementor-icon-list-items">\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">Model is wearing size M and is 6'1"</span></li>\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">Standard fit for a relaxed, easy feel</span></li>\n</ul>\n</div>\n</div>\n<div class="elementor-element elementor-element-d1f0f3f elementor-widget-divider--view-line elementor-widget elementor-widget-divider" data-id="d1f0f3f" data-element_type="widget" data-widget_type="divider.default">\n<div class="elementor-widget-container">\n<div class="elementor-divider">&nbsp;</div>\n</div>\n</div>\n<div class="elementor-element elementor-element-b150dac elementor-widget elementor-widget-heading" data-id="b150dac" data-element_type="widget" data-widget_type="heading.default">\n<div class="elementor-widget-container">\n<h6 class="elementor-heading-title elementor-size-default">FREE DELIVERY &amp; RETURNS</h6>\n</div>\n</div>\n<div class="elementor-element elementor-element-5110c2c elementor-widget elementor-widget-text-editor" data-id="5110c2c" data-element_type="widget" data-widget_type="text-editor.default">\n<div class="elementor-widget-container">\n<p>Free standard delivery on orders over $60.</p>\n</div>\n</div>\n<div class="elementor-element elementor-element-3722195 elementor-icon-list--layout-traditional elementor-list-item-link-full_width elementor-widget elementor-widget-icon-list" data-id="3722195" data-element_type="widget" data-widget_type="icon-list.default">\n<div class="elementor-widget-container">\n<ul class="elementor-icon-list-items">\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">You can return your order for any reason, free of charge, within 30 days</span></li>\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">We also offer a Free-of-Charge shipping label</span></li>\n</ul>\n</div>\n</div>	{7197ee8b-e92d-4b33-8c1b-b06b51632554,6b951946-699d-4ed0-b9e4-3187f867181e,e80dfa11-a91d-4741-ba15-fc0ae8bf3a16,33fc119a-76c9-4070-9028-45c8a7a330b8}	price_1OnkydBTmmLQabfnJlJxS8QD	40
4967aea9-803c-4a30-9847-bab67a1d99ba	b2ef8ca8-1780-40d1-9777-a3ee1fdc0f15	35	T-Shirt Name 9	<div class="elementor-element elementor-element-4e1ff84 elementor-widget elementor-widget-heading" data-id="4e1ff84" data-element_type="widget" data-widget_type="heading.default">\n<div class="elementor-widget-container">\n<h6 class="elementor-heading-title elementor-size-default">ABOUT THE PRODUCT</h6>\n</div>\n</div>\n<div class="elementor-element elementor-element-63e8c9e elementor-widget elementor-widget-text-editor" data-id="63e8c9e" data-element_type="widget" data-widget_type="text-editor.default">\n<div class="elementor-widget-container">\n<p>Our T-Shirts are lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.</p>\n</div>\n</div>\n<div class="elementor-element elementor-element-4dd153f elementor-icon-list--layout-traditional elementor-list-item-link-full_width elementor-widget elementor-widget-icon-list" data-id="4dd153f" data-element_type="widget" data-widget_type="icon-list.default">\n<div class="elementor-widget-container">\n<ul class="elementor-icon-list-items">\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">100% Cotton</span></li>\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">260gsm</span></li>\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">Breathable Fabric</span></li>\n</ul>\n</div>\n</div>\n<div class="elementor-element elementor-element-e8a6499 elementor-widget-divider--view-line elementor-widget elementor-widget-divider" data-id="e8a6499" data-element_type="widget" data-widget_type="divider.default">\n<div class="elementor-widget-container">\n<div class="elementor-divider">&nbsp;</div>\n</div>\n</div>\n<div class="elementor-element elementor-element-278be34 elementor-widget elementor-widget-heading" data-id="278be34" data-element_type="widget" data-widget_type="heading.default">\n<div class="elementor-widget-container">\n<h6 class="elementor-heading-title elementor-size-default">SIZE &amp; FIT</h6>\n</div>\n</div>\n<div class="elementor-element elementor-element-f506ea7 elementor-icon-list--layout-traditional elementor-list-item-link-full_width elementor-widget elementor-widget-icon-list" data-id="f506ea7" data-element_type="widget" data-widget_type="icon-list.default">\n<div class="elementor-widget-container">\n<ul class="elementor-icon-list-items">\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">Model is wearing size M and is 6'1"</span></li>\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">Standard fit for a relaxed, easy feel</span></li>\n</ul>\n</div>\n</div>\n<div class="elementor-element elementor-element-d1f0f3f elementor-widget-divider--view-line elementor-widget elementor-widget-divider" data-id="d1f0f3f" data-element_type="widget" data-widget_type="divider.default">\n<div class="elementor-widget-container">\n<div class="elementor-divider">&nbsp;</div>\n</div>\n</div>\n<div class="elementor-element elementor-element-b150dac elementor-widget elementor-widget-heading" data-id="b150dac" data-element_type="widget" data-widget_type="heading.default">\n<div class="elementor-widget-container">\n<h6 class="elementor-heading-title elementor-size-default">FREE DELIVERY &amp; RETURNS</h6>\n</div>\n</div>\n<div class="elementor-element elementor-element-5110c2c elementor-widget elementor-widget-text-editor" data-id="5110c2c" data-element_type="widget" data-widget_type="text-editor.default">\n<div class="elementor-widget-container">\n<p>Free standard delivery on orders over $60.</p>\n</div>\n</div>\n<div class="elementor-element elementor-element-3722195 elementor-icon-list--layout-traditional elementor-list-item-link-full_width elementor-widget elementor-widget-icon-list" data-id="3722195" data-element_type="widget" data-widget_type="icon-list.default">\n<div class="elementor-widget-container">\n<ul class="elementor-icon-list-items">\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">You can return your order for any reason, free of charge, within 30 days</span></li>\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">We also offer a Free-of-Charge shipping label</span></li>\n</ul>\n</div>\n</div>	{42be41c0-fe58-40fd-9860-439aaa678e84,6b951946-699d-4ed0-b9e4-3187f867181e,e80dfa11-a91d-4741-ba15-fc0ae8bf3a16,33fc119a-76c9-4070-9028-45c8a7a330b8}	price_1OnkynBTmmLQabfnBkZzGIu5	40
4967aea9-803c-4a30-9847-bab67a1d99ba	51845f31-52ae-4092-ac55-44cc452815a1	35	T-Shirt Name 9	<div class="elementor-element elementor-element-4e1ff84 elementor-widget elementor-widget-heading" data-id="4e1ff84" data-element_type="widget" data-widget_type="heading.default">\n<div class="elementor-widget-container">\n<h6 class="elementor-heading-title elementor-size-default">ABOUT THE PRODUCT</h6>\n</div>\n</div>\n<div class="elementor-element elementor-element-63e8c9e elementor-widget elementor-widget-text-editor" data-id="63e8c9e" data-element_type="widget" data-widget_type="text-editor.default">\n<div class="elementor-widget-container">\n<p>Our T-Shirts are lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.</p>\n</div>\n</div>\n<div class="elementor-element elementor-element-4dd153f elementor-icon-list--layout-traditional elementor-list-item-link-full_width elementor-widget elementor-widget-icon-list" data-id="4dd153f" data-element_type="widget" data-widget_type="icon-list.default">\n<div class="elementor-widget-container">\n<ul class="elementor-icon-list-items">\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">100% Cotton</span></li>\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">260gsm</span></li>\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">Breathable Fabric</span></li>\n</ul>\n</div>\n</div>\n<div class="elementor-element elementor-element-e8a6499 elementor-widget-divider--view-line elementor-widget elementor-widget-divider" data-id="e8a6499" data-element_type="widget" data-widget_type="divider.default">\n<div class="elementor-widget-container">\n<div class="elementor-divider">&nbsp;</div>\n</div>\n</div>\n<div class="elementor-element elementor-element-278be34 elementor-widget elementor-widget-heading" data-id="278be34" data-element_type="widget" data-widget_type="heading.default">\n<div class="elementor-widget-container">\n<h6 class="elementor-heading-title elementor-size-default">SIZE &amp; FIT</h6>\n</div>\n</div>\n<div class="elementor-element elementor-element-f506ea7 elementor-icon-list--layout-traditional elementor-list-item-link-full_width elementor-widget elementor-widget-icon-list" data-id="f506ea7" data-element_type="widget" data-widget_type="icon-list.default">\n<div class="elementor-widget-container">\n<ul class="elementor-icon-list-items">\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">Model is wearing size M and is 6'1"</span></li>\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">Standard fit for a relaxed, easy feel</span></li>\n</ul>\n</div>\n</div>\n<div class="elementor-element elementor-element-d1f0f3f elementor-widget-divider--view-line elementor-widget elementor-widget-divider" data-id="d1f0f3f" data-element_type="widget" data-widget_type="divider.default">\n<div class="elementor-widget-container">\n<div class="elementor-divider">&nbsp;</div>\n</div>\n</div>\n<div class="elementor-element elementor-element-b150dac elementor-widget elementor-widget-heading" data-id="b150dac" data-element_type="widget" data-widget_type="heading.default">\n<div class="elementor-widget-container">\n<h6 class="elementor-heading-title elementor-size-default">FREE DELIVERY &amp; RETURNS</h6>\n</div>\n</div>\n<div class="elementor-element elementor-element-5110c2c elementor-widget elementor-widget-text-editor" data-id="5110c2c" data-element_type="widget" data-widget_type="text-editor.default">\n<div class="elementor-widget-container">\n<p>Free standard delivery on orders over $60.</p>\n</div>\n</div>\n<div class="elementor-element elementor-element-3722195 elementor-icon-list--layout-traditional elementor-list-item-link-full_width elementor-widget elementor-widget-icon-list" data-id="3722195" data-element_type="widget" data-widget_type="icon-list.default">\n<div class="elementor-widget-container">\n<ul class="elementor-icon-list-items">\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">You can return your order for any reason, free of charge, within 30 days</span></li>\n<li class="elementor-icon-list-item"><span class="elementor-icon-list-text">We also offer a Free-of-Charge shipping label</span></li>\n</ul>\n</div>\n</div>	{fd16462a-bb07-4844-bbeb-417249f55f2f,6b951946-699d-4ed0-b9e4-3187f867181e,e80dfa11-a91d-4741-ba15-fc0ae8bf3a16,33fc119a-76c9-4070-9028-45c8a7a330b8}	price_1OnkyyBTmmLQabfnZRvVCfLx	40
\.


--
-- TOC entry 4889 (class 0 OID 41152)
-- Dependencies: 216
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (uuid, username, role, adress, email, code, activated, password) FROM stdin;
7cffa802-88be-432d-b4fa-46253ab58020		1		admin@admin.fr	629004341	t	ZWWq8bMwZYfNdwR
\.


--
-- TOC entry 4892 (class 0 OID 41178)
-- Dependencies: 219
-- Data for Name: variation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.variation (uuid, productuuid, stock, name, "order") FROM stdin;
20129ba2-0b05-44c5-b179-51565d5107b9	ff597073-a46e-435a-9d11-ec38af982570	5	Noir	0
9f994832-cf45-41e7-8b31-f893d3bde97c	ff597073-a46e-435a-9d11-ec38af982570	5	Rose	1
ca1d6cb8-92d5-4fc0-83d4-2c16b636d2ad	ff597073-a46e-435a-9d11-ec38af982570	5	Blanc	2
c9a58d74-4b82-491d-82da-7652a6eadb2d	51845f31-52ae-4092-ac55-44cc452815a1	50	Noir	0
5f0ed106-77d9-4543-b41d-1d4ef34130ea	51845f31-52ae-4092-ac55-44cc452815a1	50	Rose	1
7e3d31ea-41b9-48c3-aef0-af27c6aad99e	51845f31-52ae-4092-ac55-44cc452815a1	50	Blanc	2
0c4eacdc-74f1-4fa8-8bcf-04ba4e4f356e	51845f31-52ae-4092-ac55-44cc452815a1	50	Noir	0
3b0abb5c-217a-40ce-9435-c3749b0cb49c	51845f31-52ae-4092-ac55-44cc452815a1	50	Rose	1
c95b8dfc-94e4-4782-8ccc-8ce193a9077b	51845f31-52ae-4092-ac55-44cc452815a1	50	Blanc	2
f725feb8-4d34-42af-967d-e7c9cf087578	23def789-4149-4b01-a951-36ec5652279c	20	Rose	0
a0fddf6b-bfba-464f-9277-6a9c30b76bb2	23def789-4149-4b01-a951-36ec5652279c	20	Noir	1
bd092dfb-4749-4e2d-b82d-5707377f47fb	23def789-4149-4b01-a951-36ec5652279c	20	Blanc	2
\.


--
-- TOC entry 4737 (class 2606 OID 41177)
-- Name: product PK_1442fd7cb5e0b32ff5d0b6c13d0; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "PK_1442fd7cb5e0b32ff5d0b6c13d0" PRIMARY KEY (uuid);


--
-- TOC entry 4743 (class 2606 OID 41200)
-- Name: commande PK_341218ebcdb301605edf9a47b83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT "PK_341218ebcdb301605edf9a47b83" PRIMARY KEY (uuid);


--
-- TOC entry 4735 (class 2606 OID 41168)
-- Name: categorie PK_35c423cbd23d6245fe4287a7e26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT "PK_35c423cbd23d6245fe4287a7e26" PRIMARY KEY (uuid);


--
-- TOC entry 4739 (class 2606 OID 41183)
-- Name: variation PK_5f5488d6dbbd2bfd2d5ef8970d9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variation
    ADD CONSTRAINT "PK_5f5488d6dbbd2bfd2d5ef8970d9" PRIMARY KEY (uuid);


--
-- TOC entry 4745 (class 2606 OID 41208)
-- Name: bloc PK_74816c2ebf722f8a75b2eebb4c9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bloc
    ADD CONSTRAINT "PK_74816c2ebf722f8a75b2eebb4c9" PRIMARY KEY (uuid);


--
-- TOC entry 4733 (class 2606 OID 41160)
-- Name: user PK_a95e949168be7b7ece1a2382fed; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_a95e949168be7b7ece1a2382fed" PRIMARY KEY (uuid);


--
-- TOC entry 4741 (class 2606 OID 41192)
-- Name: contenu PK_ef008cb9a9e5b44cce93f8efd4c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenu
    ADD CONSTRAINT "PK_ef008cb9a9e5b44cce93f8efd4c" PRIMARY KEY (uuid);


-- Completed on 2024-02-25 19:33:35

--
-- PostgreSQL database dump complete
--

