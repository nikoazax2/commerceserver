--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.0

-- Started on 2024-02-10 15:37:27

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
-- TOC entry 4866 (class 0 OID 16444)
-- Dependencies: 222
-- Data for Name: contenu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contenu (uuid, name, contenu, description, page, "order", valeur, photo, image, type, removable) FROM stdin;
1aaeb62a-a911-412f-9e15-0d2f3153097d	Message bandeau du haut	<p>🔥 -20% SUR NOS VESTES CHAUFFANTES (HORS OPTION BATTERIE)</p>	\N	Général	2	message-bandeau-haut	\N	{}	1	\N
880e68ef-e1b3-4d4e-b4fe-c9e29acd6c53	Logo du site	[{"url":"","titre":"","unique":true},{"url":"","titre":""},{"url":"","titre":""},{"url":"","titre":""},{"url":"","titre":""},{"url":"","titre":""},{"url":"","titre":""},{"url":"","titre":""}]	\N	Général	0	logo-site	\N	{64940d53-685c-4265-9664-c9b440defe9f}	2	\N
cca1f19b-75de-4e52-a496-a4b6689acc34	Couleur du site	#3F51B5	\N	Général	1	couleur-site	\N	{}	3	\N
\.


--
-- TOC entry 4722 (class 2606 OID 16449)
-- Name: contenu PK_ef008cb9a9e5b44cce93f8efd4c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenu
    ADD CONSTRAINT "PK_ef008cb9a9e5b44cce93f8efd4c" PRIMARY KEY (uuid);


-- Completed on 2024-02-10 15:37:27

--
-- PostgreSQL database dump complete
--

