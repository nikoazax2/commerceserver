--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.0

-- Started on 2024-02-19 20:45:28

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
    description character varying(500),
    page character varying(30),
    "order" integer,
    valeur character varying(30),
    photo boolean,
    image text[] DEFAULT '{}'::text[],
    type integer,
    removable boolean,
    contenu json
);


ALTER TABLE public.contenu OWNER TO postgres;

--
-- TOC entry 4866 (class 0 OID 16444)
-- Dependencies: 222
-- Data for Name: contenu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contenu (uuid, name, description, page, "order", valeur, photo, image, type, removable, contenu) FROM stdin;
da962720-1791-49c2-8a53-a2c4225b9631	Texte	\N	c'est-moi	2		\N	{}	1	t	"<p style=\\"text-align: center;\\">&nbsp;Alors bien s&ucirc;r, le processus de cr&eacute;ation &eacute;tait g&eacute;nial et fou, mais ce que j'aime et veux par-dessus tout c'est&nbsp;<strong>partager mon art</strong>, sur sc&egrave;ne ou via les plateformes, je veux que mes morceaux prennent sens et vie avec vous.</p>\\n<p style=\\"text-align: center;\\">Apr&egrave;s la sortie de l'album, la tourn&eacute;e des concerts va d&eacute;marrer, on va enfin s&rsquo;&eacute;clater &agrave; offrir cette musique en live,&nbsp;<strong>on va foutre le bordel</strong>&nbsp;🤪 &nbsp;Et avec vous, &ccedil;a sera encore plus facile, croyez-moi.</p>\\n<p style=\\"text-align: center;\\">C'est tr&egrave;s humblement et avec beaucoup de reconnaissance que je vous propose de participer &agrave; mon projet au travers de ce Crowdfunding. Tu peux simplement faire un don, mais &ccedil;a serait trop dommage. Moi, je te propose de m'acheter une Porsche. Si la Porsche c'est trop pour toi, alors&nbsp;<strong>&ccedil;a serait un honneur que tu fasses un don en &eacute;change d'une contrepartie</strong>&nbsp;(10&euro; = EP digital ; 15&euro; = EP physique ; 20&euro; = EP physique + digital). Si tu as d&eacute;j&agrave; trop d&eacute;pens&eacute; au bar ce mois-ci, un simple partage serait d&eacute;j&agrave; &eacute;norme ❤️&nbsp;</p>\\n<p style=\\"text-align: center;\\"><strong>Je vous remercie tous d'avance</strong>, et on se croise sur la route 😎🤪🔥</p>\\n<p style=\\"text-align: center;\\">&nbsp;</p>\\n<figure class=\\"image image_resized\\" style=\\"text-align: center;\\"><img src=\\"https://s3-eu-west-1.amazonaws.com/com.ulule.media/presales/1/8/1/7/7/1/177181/7.JDWdX988d4.png\\" width=\\"455\\" height=\\"455\\" /></figure>\\n<p>&nbsp;</p>\\n<p style=\\"text-align: center;\\"><strong>MERCI</strong></p>"
c4494e3e-0a54-4016-a599-051b444bf2d1	Articles	\N	a-propos	0		\N	{}	5	t	{"nombre":5,"categories":["f0bf36da-c128-41b2-ac36-7ce18b0a0841"]}
76bbc3b6-88c7-46d2-b821-9fde94302b1a	Bandeau critères dessus footer	\N	Général	6	criteres-dessus-footer	\N	{}	7	\N	false
4c59774e-166e-4601-bc62-be9874c64aee	Pages	\N	Général	1	pages	\N	{}	8	\N	[{"name":"C'est moi","groupes":[1,2]}]
975952e7-fa0c-4a86-aa30-c4021fe3558f	Code	\N	c'est-moi	1		\N	{}	9	t	"<iframe width=\\"100%\\" height=\\"166\\" scrolling=\\"no\\" frameborder=\\"no\\" allow=\\"autoplay\\" src=\\"https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1645146516&color=%238d00ff&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true\\"></iframe><div style=\\"font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;\\"><a href=\\"https://soundcloud.com/mirco-off\\" title=\\"MIRCO\\" target=\\"_blank\\" style=\\"color: #cccccc; text-decoration: none;\\">MIRCO</a> · <a href=\\"https://soundcloud.com/mirco-off/la-symphonie-des-espoirs\\" title=\\"La Symphonie des Espoirs\\" target=\\"_blank\\" style=\\"color: #cccccc; text-decoration: none;\\">La Symphonie des Espoirs</a></div>"
1aaeb62a-a911-412f-9e15-0d2f3153097d	Message bandeau du haut	\N	Général	4	message-bandeau-haut	\N	{}	1	\N	{"texte":"<p>Ensemble, faisons vivre La Symphonie des Espoirs 🌟</p>","color":"#000000"}
3c7bc104-9469-40d8-8134-e11d6df7ebcd	Texte	\N	c'est-moi	0		\N	{}	1	t	"<p style=\\"text-align: center;\\">Coucou tout le monde, moi c'est&nbsp;<strong>MIRCO&nbsp;✌🏼</strong></p>\\n<p style=\\"text-align: center;\\">&nbsp;</p>\\n<figure class=\\"image image_resized\\" style=\\"text-align: center;\\"><img style=\\"display: block; margin-left: auto; margin-right: auto;\\" src=\\"https://s3-eu-west-1.amazonaws.com/com.ulule.media/presales/1/8/1/7/7/1/177181/img_3384-2-petite.Ad4qnex4AF.jpeg\\" /></figure>\\n<p style=\\"text-align: center;\\">&nbsp;</p>\\n<p style=\\"text-align: center;\\">C'est avec une immense joie que je me lance dans la musique. D<em>es concerts, des enregistrements, des rencontres, encore des concerts, des gal&egrave;res,&nbsp;</em>MAIS, surtout, une vraie passion qui m'anime au quotidien&nbsp;<em>🔥</em></p>\\n<p style=\\"text-align: center;\\">Aujourd'hui, j'ai l&rsquo;honneur de vous annoncer que je finalise la sortie de&nbsp;<strong>mon premier EP 6 titres.&nbsp;</strong>Je suis tellement excit&eacute; de pouvoir vous proposer un projet dont je suis fier et qui me repr&eacute;sente !</p>\\n<p style=\\"text-align: center;\\">Je me lance dans un monde fou et extraordinaire ! J'invite tout le monde (mes ami.e.s, mes ennemi.e.s, ma famille, ceux qui me connaissent, ceux qui ne me connaissent pas.........) &agrave; me rejoindre pour construire cette aventure dans laquelle je plonge la t&ecirc;te baiss&eacute;e 🙈</p>\\n<p style=\\"text-align: center;\\">&Agrave; travers cette campagne Ulule, ce n'est pas seulement votre soutien financier que je demande, c'est une signature de votre part pour&nbsp;<strong>rentrer dans la family</strong>, et je veux qu'elle soit grande ma famille, parce que j'ai tant &agrave; vous partager !&nbsp;<strong>On va le faire ensemble</strong>&nbsp;😎</p>\\n<p style=\\"text-align: center;\\">Durant cette ann&eacute;e 2023,&nbsp;<strong>je me suis construit un entourage pour m&rsquo;accompagner sur le chemin</strong>, et olalala qu'est-ce que je les aime, je travaille avec de si belles personnes et c'est vraiment important &agrave; mes yeux. Je citerai le grand 'Daryl Plombier' mon arrangeur avec qui tout est si simple, la sublime Fanie (@swmidt) pour les visuels/photos, puis il y a mon manager qui est mon premier soutien et mon mur porteur. Je tiens d&eacute;j&agrave; &agrave; vous remercier ❤️</p>\\n<p style=\\"text-align: center;\\">&nbsp;</p>\\n<p style=\\"text-align: center;\\"><strong>🌟 \\"La Symphonie des Espoirs\\" 🌟</strong></p>\\n<p style=\\"text-align: center;\\">&nbsp;</p>\\n<p style=\\"text-align: center;\\">Ce que tu viens de lire au-dessus, c'est&nbsp;<strong>le titre de mon petit b&eacute;b&eacute;</strong>, mignon nan ?&nbsp;</p>\\n<p style=\\"text-align: center;\\">Cet album, je l'aime, j'aime ses sonorit&eacute;s, j'aime son sens simple, et au final, le r&eacute;sultat est encore mieux que ce que j&rsquo;imaginais, alors cet album, j'ai envie de&nbsp;<strong>le pousser au maximum</strong>. Je veux qu'il te&nbsp;<s>perce</s>&nbsp;caresse les tympans.</p>\\n<p style=\\"text-align: center;\\">Dedans, on y trouve d&eacute;j&agrave;&nbsp;<strong>les arrangements fous de Daryl Plombier</strong>, il y a aussi ma m&egrave;re en mode grande cantatrice suisse sur le premier titre, il y a aussi moi qui joue de la guitare comme Kendji (c'est faux). Surtout, ce sont l&agrave; mes 6 premiers titres aboutis,&nbsp;<strong>que r&ecirc;ver de mieux pour ce d&eacute;but d&rsquo;ann&eacute;e 2024&nbsp;</strong>🌞</p>"
e3ca2b1e-a7e7-41cd-a6d3-3568247000f5	Tags SEO	\N	Général	10	tags	\N	{}	1	\N	"<p>Mirco chanteur pop Grenoble Artiste Mirco musique pop Chanteur Mirco&nbsp; Grenoble Musique pop Mirco artiste Mirco artiste chanteur pop Grenoble Chanson pop Mirco &agrave; Grenoble Nouveau single Mirco chanteur pop Concert Mirco &agrave; Grenoble Mirco talentueux chanteur pop Populaire artiste Mirco Grenoble Mirco voix unique musique pop Sc&egrave;ne musicale Grenoble Mirco Mirco performances live pop Mirco passionn&eacute; de musique pop Mirco sensation pop Grenoble Mirco artiste &eacute;mergent pop Mirco nouvel album pop Mirco passion musique pop Mirco chanteur charismatique pop Mirco talent prometteur pop Mirco concerts en r&eacute;gion Grenoble Mirco ambiance pop en concert Mirco artiste local pop Mirco album studio pop Mirco musique entrainante pop Mirco artiste solo pop Mirco paroles captivantes pop Mirco m&eacute;lodies accrocheuses pop Mirco rythmes entra&icirc;nants pop Mirco voix envo&ucirc;tante pop Mirco sonorit&eacute;s pop modernes Mirco inspiration musicale pop Mirco compositions originales pop Mirco singles &agrave; succ&egrave;s pop Mirco passion</p>"
880e68ef-e1b3-4d4e-b4fe-c9e29acd6c53	Logo du site	\N	Général	7	logo-site	\N	{0d31b13c-269a-4ded-9178-75d09ba5bd39}	2	\N	[{"unique":true},{"url":"","titre":""},{"url":"","titre":""},{"url":"","titre":""}]
7422b2c4-1838-4148-92f5-6cd9f8d1c0f7	Logo du site Pied	\N	Général	8	logo-site-footer	\N	{4fa96c74-33ac-4fe9-b368-222b3794c226}	2	\N	[{"unique":true},{"url":"","titre":""},{"url":"","titre":""}]
3c1c3db9-5b50-4d09-a5f9-87b261504049	Page meilleures ventes	\N	Général	9	page-meilleures-ventes	\N	{}	7	\N	false
cca1f19b-75de-4e52-a496-a4b6689acc34	Couleur du site	\N	Général	2	couleur-site	\N	{768c618e-8673-43a6-966e-d203f950774f,6e844538-39a6-4a57-9ed5-b87bf55391da}	3	\N	"#F06292"
\.


--
-- TOC entry 4722 (class 2606 OID 16449)
-- Name: contenu PK_ef008cb9a9e5b44cce93f8efd4c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenu
    ADD CONSTRAINT "PK_ef008cb9a9e5b44cce93f8efd4c" PRIMARY KEY (uuid);


-- Completed on 2024-02-19 20:45:28

--
-- PostgreSQL database dump complete
--

