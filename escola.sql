--
-- PostgreSQL database dump
--

\restrict KzB2FTNlmMpRiMFxoyfMnAJ8cskHMShoR4sySeg859kF362eJ7hOI5OYo5aBnMM

-- Dumped from database version 18.6 (Ubuntu 18.6-0ubuntu0.26.04.1)
-- Dumped by pg_dump version 18.6 (Ubuntu 18.6-0ubuntu0.26.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alunos; Type: TABLE; Schema: public; Owner: escola
--

CREATE TABLE public.alunos (
    id integer NOT NULL,
    nome character varying(255),
    turma character varying(12),
    nascimento date,
    ativo boolean,
    email character varying(255)
);


ALTER TABLE public.alunos OWNER TO escola;

--
-- Name: alunos_id_seq; Type: SEQUENCE; Schema: public; Owner: escola
--

CREATE SEQUENCE public.alunos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alunos_id_seq OWNER TO escola;

--
-- Name: alunos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: escola
--

ALTER SEQUENCE public.alunos_id_seq OWNED BY public.alunos.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: escola
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    email character varying(255),
    senha character varying(255)
);


ALTER TABLE public.usuarios OWNER TO escola;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: escola
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO escola;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: escola
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- Name: alunos id; Type: DEFAULT; Schema: public; Owner: escola
--

ALTER TABLE ONLY public.alunos ALTER COLUMN id SET DEFAULT nextval('public.alunos_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: escola
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Data for Name: alunos; Type: TABLE DATA; Schema: public; Owner: escola
--

COPY public.alunos (id, nome, turma, nascimento, ativo, email) FROM stdin;
3	Migo TIRS	21	12421-02-21	t	tiao@gmail.com
6	Miga mirs	I1D46A	5432-06-07	t	migami@gmail.com
1	Miga Lurdes	I1D46A	2009-11-22	t	luna.alves@edu.senai.br
2	Miga Lers	I1D46A	275760-03-12	t	migale@gmail.com
4	Miga Durdis	I1D46A	275760-03-12	t	migadu@gmail.com
5	Miga Nirs	I1D46A	275760-03-12	t	migani@gmail.com
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: escola
--

COPY public.usuarios (id, email, senha) FROM stdin;
1	luna@gmail.com	12345
2	nicoli@gmail.com	1212
3	charlie.carvalho@gmail.com	12
4	migale@gmail.com	migale
5	migalu@gmail.com	12
\.


--
-- Name: alunos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: escola
--

SELECT pg_catalog.setval('public.alunos_id_seq', 6, true);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: escola
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 5, true);


--
-- Name: alunos alunos_pkey; Type: CONSTRAINT; Schema: public; Owner: escola
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: escola
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict KzB2FTNlmMpRiMFxoyfMnAJ8cskHMShoR4sySeg859kF362eJ7hOI5OYo5aBnMM

