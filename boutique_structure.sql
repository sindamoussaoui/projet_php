--
-- PostgreSQL database dump
--

\restrict 7BZ5eagRxKbBn0LnRUSAZJELPWMnY6J6RN5e4Vbv3mheG5zpqUMhSdb3RIgq5E4

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-04-30 18:26:33

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
-- TOC entry 224 (class 1259 OID 33033)
-- Name: commande_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commande_details (
    id integer NOT NULL,
    commande_id integer,
    produit_id integer,
    quantite integer NOT NULL,
    prix_unitaire numeric(10,2) NOT NULL
);


ALTER TABLE public.commande_details OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 33032)
-- Name: commande_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commande_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.commande_details_id_seq OWNER TO postgres;

--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 223
-- Name: commande_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.commande_details_id_seq OWNED BY public.commande_details.id;


--
-- TOC entry 222 (class 1259 OID 33024)
-- Name: commandes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commandes (
    id integer NOT NULL,
    date_commande timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    user_id integer
);


ALTER TABLE public.commandes OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 33023)
-- Name: commandes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commandes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.commandes_id_seq OWNER TO postgres;

--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 221
-- Name: commandes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.commandes_id_seq OWNED BY public.commandes.id;


--
-- TOC entry 220 (class 1259 OID 33014)
-- Name: produits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produits (
    id integer NOT NULL,
    nom character varying(100) NOT NULL,
    prix numeric(10,2) NOT NULL
);


ALTER TABLE public.produits OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 33013)
-- Name: produits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produits_id_seq OWNER TO postgres;

--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 219
-- Name: produits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produits_id_seq OWNED BY public.produits.id;


--
-- TOC entry 226 (class 1259 OID 33053)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    nom character varying(100),
    email character varying(100),
    password character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 33052)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 225
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4773 (class 2604 OID 33036)
-- Name: commande_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande_details ALTER COLUMN id SET DEFAULT nextval('public.commande_details_id_seq'::regclass);


--
-- TOC entry 4771 (class 2604 OID 33027)
-- Name: commandes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commandes ALTER COLUMN id SET DEFAULT nextval('public.commandes_id_seq'::regclass);


--
-- TOC entry 4770 (class 2604 OID 33017)
-- Name: produits id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produits ALTER COLUMN id SET DEFAULT nextval('public.produits_id_seq'::regclass);


--
-- TOC entry 4774 (class 2604 OID 33056)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4940 (class 0 OID 33033)
-- Dependencies: 224
-- Data for Name: commande_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commande_details (id, commande_id, produit_id, quantite, prix_unitaire) FROM stdin;
\.


--
-- TOC entry 4938 (class 0 OID 33024)
-- Dependencies: 222
-- Data for Name: commandes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commandes (id, date_commande, user_id) FROM stdin;
\.


--
-- TOC entry 4936 (class 0 OID 33014)
-- Dependencies: 220
-- Data for Name: produits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produits (id, nom, prix) FROM stdin;
1	Poussette	450.00
2	Biberon	25.50
3	Couches	40.00
4	Poussette Chicco	450.00
5	Biberon Avent	35.50
6	Transat Bébé	120.00
7	Poussette Chicco	450.00
8	Biberon Avent	35.50
9	Transat Bébé	120.00
\.


--
-- TOC entry 4942 (class 0 OID 33053)
-- Dependencies: 226
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, nom, email, password) FROM stdin;
\.


--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 223
-- Name: commande_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commande_details_id_seq', 1, false);


--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 221
-- Name: commandes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commandes_id_seq', 1, false);


--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 219
-- Name: produits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produits_id_seq', 9, true);


--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 225
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 4780 (class 2606 OID 33041)
-- Name: commande_details commande_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande_details
    ADD CONSTRAINT commande_details_pkey PRIMARY KEY (id);


--
-- TOC entry 4778 (class 2606 OID 33031)
-- Name: commandes commandes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commandes
    ADD CONSTRAINT commandes_pkey PRIMARY KEY (id);


--
-- TOC entry 4776 (class 2606 OID 33022)
-- Name: produits produits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produits
    ADD CONSTRAINT produits_pkey PRIMARY KEY (id);


--
-- TOC entry 4782 (class 2606 OID 33061)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4784 (class 2606 OID 33059)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4786 (class 2606 OID 33042)
-- Name: commande_details commande_details_commande_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande_details
    ADD CONSTRAINT commande_details_commande_id_fkey FOREIGN KEY (commande_id) REFERENCES public.commandes(id) ON DELETE CASCADE;


--
-- TOC entry 4787 (class 2606 OID 33047)
-- Name: commande_details commande_details_produit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande_details
    ADD CONSTRAINT commande_details_produit_id_fkey FOREIGN KEY (produit_id) REFERENCES public.produits(id);


--
-- TOC entry 4785 (class 2606 OID 33062)
-- Name: commandes commandes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commandes
    ADD CONSTRAINT commandes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2026-04-30 18:26:34

--
-- PostgreSQL database dump complete
--

\unrestrict 7BZ5eagRxKbBn0LnRUSAZJELPWMnY6J6RN5e4Vbv3mheG5zpqUMhSdb3RIgq5E4

