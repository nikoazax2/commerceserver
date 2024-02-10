--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.0

-- Started on 2024-02-10 15:49:19

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
-- TOC entry 4865 (class 0 OID 24656)
-- Dependencies: 224
-- Data for Name: bloc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bloc (uuid, type, name, description, logo) FROM stdin;
a76a9a82-6b4b-4cbe-809e-806962e880e5	1	Texte	\N	mdi-format-color-text
ed0b9ce0-7829-40d7-8def-f0c8dc2dba89	2	Image	\N	mdi-image-multiple-outline
3eb5ca3c-a5a9-43df-a48a-ad68cc7955c8	4	Bouton	\N	mdi-button-pointer
e39c1f6b-d475-4246-a73d-cf263e871a8d	5	Articles	\N	mdi-shopping
ca1bf92a-0a44-41ec-86d8-58e8d523f11d	6	Catégories	\N	mdi-palette-swatch-variant
\.


--
-- TOC entry 4721 (class 2606 OID 24663)
-- Name: bloc PK_74816c2ebf722f8a75b2eebb4c9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bloc
    ADD CONSTRAINT "PK_74816c2ebf722f8a75b2eebb4c9" PRIMARY KEY (uuid);


-- Completed on 2024-02-10 15:49:19

--
-- PostgreSQL database dump complete
--

