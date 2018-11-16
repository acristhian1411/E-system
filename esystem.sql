--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: tr_produc_sucursal(); Type: FUNCTION; Schema: public; Owner: usuario
--

CREATE FUNCTION tr_produc_sucursal() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
IF TG_OP = 'INSERT' THEN
		INSERT INTO stocks (producto_id, sucursale_id, stock, created_at, updated_at) 
		VALUES (NEW.id, 1, 0, NOW(), NOW());
		INSERT INTO stocks (producto_id, sucursale_id, stock, created_at, updated_at) 
		VALUES (NEW.id, 2, 0, NOW(), NOW());
		INSERT INTO stocks (producto_id, sucursale_id, stock, created_at, updated_at) 
		VALUES (NEW.id, 3, 0, NOW(), NOW());
END IF;
return NEW;    

END;$$;


ALTER FUNCTION public.tr_produc_sucursal() OWNER TO usuario;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: usuario
--

CREATE TABLE active_admin_comments (
    id bigint NOT NULL,
    namespace character varying,
    body text,
    resource_type character varying,
    resource_id bigint,
    author_type character varying,
    author_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE active_admin_comments OWNER TO usuario;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: usuario
--

CREATE SEQUENCE active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE active_admin_comments_id_seq OWNER TO usuario;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usuario
--

ALTER SEQUENCE active_admin_comments_id_seq OWNED BY active_admin_comments.id;


--
-- Name: active_admin_managed_resources; Type: TABLE; Schema: public; Owner: usuario
--

CREATE TABLE active_admin_managed_resources (
    id bigint NOT NULL,
    class_name character varying NOT NULL,
    action character varying NOT NULL,
    name character varying
);


ALTER TABLE active_admin_managed_resources OWNER TO usuario;

--
-- Name: active_admin_managed_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: usuario
--

CREATE SEQUENCE active_admin_managed_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE active_admin_managed_resources_id_seq OWNER TO usuario;

--
-- Name: active_admin_managed_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usuario
--

ALTER SEQUENCE active_admin_managed_resources_id_seq OWNED BY active_admin_managed_resources.id;


--
-- Name: active_admin_permissions; Type: TABLE; Schema: public; Owner: usuario
--

CREATE TABLE active_admin_permissions (
    id bigint NOT NULL,
    managed_resource_id integer NOT NULL,
    role smallint DEFAULT 0 NOT NULL,
    state smallint DEFAULT 0 NOT NULL
);


ALTER TABLE active_admin_permissions OWNER TO usuario;

--
-- Name: active_admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: usuario
--

CREATE SEQUENCE active_admin_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE active_admin_permissions_id_seq OWNER TO usuario;

--
-- Name: active_admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usuario
--

ALTER SEQUENCE active_admin_permissions_id_seq OWNED BY active_admin_permissions.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: usuario
--

CREATE TABLE admin_users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    role smallint DEFAULT 0 NOT NULL
);


ALTER TABLE admin_users OWNER TO usuario;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: usuario
--

CREATE SEQUENCE admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin_users_id_seq OWNER TO usuario;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usuario
--

ALTER SEQUENCE admin_users_id_seq OWNED BY admin_users.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: usuario
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO usuario;

--
-- Name: barrios; Type: TABLE; Schema: public; Owner: usuario
--

CREATE TABLE barrios (
    id bigint NOT NULL,
    descripcion character varying,
    activo boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE barrios OWNER TO usuario;

--
-- Name: barrios_id_seq; Type: SEQUENCE; Schema: public; Owner: usuario
--

CREATE SEQUENCE barrios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE barrios_id_seq OWNER TO usuario;

--
-- Name: barrios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usuario
--

ALTER SEQUENCE barrios_id_seq OWNED BY barrios.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: usuario
--

CREATE TABLE categories (
    id bigint NOT NULL,
    category_descrip character varying,
    category_active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE categories OWNER TO usuario;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: usuario
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO usuario;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usuario
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: ciudades; Type: TABLE; Schema: public; Owner: usuario
--

CREATE TABLE ciudades (
    id bigint NOT NULL,
    descripcion character varying,
    activo boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ciudades OWNER TO usuario;

--
-- Name: ciudades_id_seq; Type: SEQUENCE; Schema: public; Owner: usuario
--

CREATE SEQUENCE ciudades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ciudades_id_seq OWNER TO usuario;

--
-- Name: ciudades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usuario
--

ALTER SEQUENCE ciudades_id_seq OWNED BY ciudades.id;


--
-- Name: clientes; Type: TABLE; Schema: public; Owner: usuario
--

CREATE TABLE clientes (
    id bigint NOT NULL,
    nombre character varying,
    apellido character varying,
    n_cedula character varying,
    cli_telefono character varying,
    limite_credito integer,
    activo boolean DEFAULT true,
    ciudade_id bigint,
    barrio_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    direccion character varying
);


ALTER TABLE clientes OWNER TO usuario;

--
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: usuario
--

CREATE SEQUENCE clientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clientes_id_seq OWNER TO usuario;

--
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usuario
--

ALTER SEQUENCE clientes_id_seq OWNED BY clientes.id;


--
-- Name: marcas; Type: TABLE; Schema: public; Owner: usuario
--

CREATE TABLE marcas (
    id bigint NOT NULL,
    marca_descrip character varying,
    marca_active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE marcas OWNER TO usuario;

--
-- Name: marcas_id_seq; Type: SEQUENCE; Schema: public; Owner: usuario
--

CREATE SEQUENCE marcas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE marcas_id_seq OWNER TO usuario;

--
-- Name: marcas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usuario
--

ALTER SEQUENCE marcas_id_seq OWNED BY marcas.id;


--
-- Name: productos; Type: TABLE; Schema: public; Owner: usuario
--

CREATE TABLE productos (
    id bigint NOT NULL,
    provider_id bigint,
    category_id bigint,
    sub_category_id bigint,
    marca_id bigint,
    prod_descrip character varying,
    iva integer,
    precio_venta double precision,
    prod_active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE productos OWNER TO usuario;

--
-- Name: productos_id_seq; Type: SEQUENCE; Schema: public; Owner: usuario
--

CREATE SEQUENCE productos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productos_id_seq OWNER TO usuario;

--
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usuario
--

ALTER SEQUENCE productos_id_seq OWNED BY productos.id;


--
-- Name: providers; Type: TABLE; Schema: public; Owner: usuario
--

CREATE TABLE providers (
    id bigint NOT NULL,
    razon_social character varying,
    ruc character varying,
    prov_direccion character varying,
    telefono character varying,
    email character varying,
    prov_active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE providers OWNER TO usuario;

--
-- Name: providers_id_seq; Type: SEQUENCE; Schema: public; Owner: usuario
--

CREATE SEQUENCE providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE providers_id_seq OWNER TO usuario;

--
-- Name: providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usuario
--

ALTER SEQUENCE providers_id_seq OWNED BY providers.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: usuario
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO usuario;

--
-- Name: stocks; Type: TABLE; Schema: public; Owner: usuario
--

CREATE TABLE stocks (
    id bigint NOT NULL,
    producto_id bigint,
    sucursal_id bigint,
    cantidad integer,
    cant_minima integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE stocks OWNER TO usuario;

--
-- Name: stocks_id_seq; Type: SEQUENCE; Schema: public; Owner: usuario
--

CREATE SEQUENCE stocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stocks_id_seq OWNER TO usuario;

--
-- Name: stocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usuario
--

ALTER SEQUENCE stocks_id_seq OWNED BY stocks.id;


--
-- Name: sub_categories; Type: TABLE; Schema: public; Owner: usuario
--

CREATE TABLE sub_categories (
    id bigint NOT NULL,
    subcat_descrip character varying,
    subcat_active boolean DEFAULT true,
    category_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE sub_categories OWNER TO usuario;

--
-- Name: sub_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: usuario
--

CREATE SEQUENCE sub_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sub_categories_id_seq OWNER TO usuario;

--
-- Name: sub_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usuario
--

ALTER SEQUENCE sub_categories_id_seq OWNED BY sub_categories.id;


--
-- Name: sucursals; Type: TABLE; Schema: public; Owner: usuario
--

CREATE TABLE sucursals (
    id bigint NOT NULL,
    suc_descrip character varying,
    suc_active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE sucursals OWNER TO usuario;

--
-- Name: sucursals_id_seq; Type: SEQUENCE; Schema: public; Owner: usuario
--

CREATE SEQUENCE sucursals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sucursals_id_seq OWNER TO usuario;

--
-- Name: sucursals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usuario
--

ALTER SEQUENCE sucursals_id_seq OWNED BY sucursals.id;


--
-- Name: active_admin_comments id; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: active_admin_managed_resources id; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY active_admin_managed_resources ALTER COLUMN id SET DEFAULT nextval('active_admin_managed_resources_id_seq'::regclass);


--
-- Name: active_admin_permissions id; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY active_admin_permissions ALTER COLUMN id SET DEFAULT nextval('active_admin_permissions_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY admin_users ALTER COLUMN id SET DEFAULT nextval('admin_users_id_seq'::regclass);


--
-- Name: barrios id; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY barrios ALTER COLUMN id SET DEFAULT nextval('barrios_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: ciudades id; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY ciudades ALTER COLUMN id SET DEFAULT nextval('ciudades_id_seq'::regclass);


--
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY clientes ALTER COLUMN id SET DEFAULT nextval('clientes_id_seq'::regclass);


--
-- Name: marcas id; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY marcas ALTER COLUMN id SET DEFAULT nextval('marcas_id_seq'::regclass);


--
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY productos ALTER COLUMN id SET DEFAULT nextval('productos_id_seq'::regclass);


--
-- Name: providers id; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY providers ALTER COLUMN id SET DEFAULT nextval('providers_id_seq'::regclass);


--
-- Name: stocks id; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY stocks ALTER COLUMN id SET DEFAULT nextval('stocks_id_seq'::regclass);


--
-- Name: sub_categories id; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY sub_categories ALTER COLUMN id SET DEFAULT nextval('sub_categories_id_seq'::regclass);


--
-- Name: sucursals id; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY sucursals ALTER COLUMN id SET DEFAULT nextval('sucursals_id_seq'::regclass);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: usuario
--

COPY active_admin_comments (id, namespace, body, resource_type, resource_id, author_type, author_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usuario
--

SELECT pg_catalog.setval('active_admin_comments_id_seq', 1, false);


--
-- Data for Name: active_admin_managed_resources; Type: TABLE DATA; Schema: public; Owner: usuario
--

COPY active_admin_managed_resources (id, class_name, action, name) FROM stdin;
1	AdminUser	read	AdminUser
2	AdminUser	create	AdminUser
3	AdminUser	destroy	AdminUser
4	AdminUser	update	AdminUser
5	AdminUser	batch_action	AdminUser
6	Barrio	destroy	Barrio
7	Barrio	read	Barrio
8	Barrio	create	Barrio
9	Barrio	update	Barrio
10	Barrio	activado	Barrio
11	Barrio	batch_action	Barrio
12	Category	destroy	Category
13	Category	read	Category
14	Category	create	Category
15	Category	update	Category
16	Category	activado	Category
17	Category	batch_action	Category
18	Ciudade	destroy	Ciudade
19	Ciudade	read	Ciudade
20	Ciudade	create	Ciudade
21	Ciudade	update	Ciudade
22	Ciudade	activado	Ciudade
23	Ciudade	batch_action	Ciudade
24	Cliente	destroy	Cliente
25	Cliente	read	Cliente
26	Cliente	create	Cliente
27	Cliente	update	Cliente
28	Cliente	activado	Cliente
29	Cliente	batch_action	Cliente
30	ActiveAdmin::Page	read	Dashboard
31	Marca	destroy	Marca
32	Marca	read	Marca
33	Marca	create	Marca
34	Marca	update	Marca
35	Marca	activado	Marca
36	Marca	batch_action	Marca
37	ActiveAdmin::Permission	read	Permission
38	ActiveAdmin::Permission	reload	Permission
39	ActiveAdmin::Permission	batch_action	Permission
40	Producto	destroy	Producto
41	Producto	read	Producto
42	Producto	create	Producto
43	Producto	update	Producto
44	Producto	activado	Producto
45	Producto	batch_action	Producto
46	Provider	destroy	Provider
47	Provider	read	Provider
48	Provider	create	Provider
49	Provider	update	Provider
50	Provider	activado	Provider
51	Provider	batch_action	Provider
52	SubCategory	destroy	SubCategory
53	SubCategory	read	SubCategory
54	SubCategory	create	SubCategory
55	SubCategory	update	SubCategory
56	SubCategory	activado	SubCategory
57	SubCategory	batch_action	SubCategory
58	Sucursal	destroy	Sucursal
59	Sucursal	read	Sucursal
60	Sucursal	create	Sucursal
61	Sucursal	update	Sucursal
62	Sucursal	activado	Sucursal
63	Sucursal	batch_action	Sucursal
64	ActiveAdmin::Comment	create	Comment
65	ActiveAdmin::Comment	read	Comment
66	ActiveAdmin::Comment	destroy	Comment
\.


--
-- Name: active_admin_managed_resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usuario
--

SELECT pg_catalog.setval('active_admin_managed_resources_id_seq', 66, true);


--
-- Data for Name: active_admin_permissions; Type: TABLE DATA; Schema: public; Owner: usuario
--

COPY active_admin_permissions (id, managed_resource_id, role, state) FROM stdin;
1	1	1	0
2	1	2	0
3	1	3	0
4	2	1	0
5	2	2	0
6	2	3	0
7	3	1	0
8	3	2	0
9	3	3	0
10	4	1	0
11	4	2	0
12	4	3	0
13	5	1	0
14	5	2	0
15	5	3	0
16	6	1	0
17	6	2	0
18	6	3	0
19	7	1	0
20	7	2	0
21	7	3	0
22	8	1	0
23	8	2	0
24	8	3	0
25	9	1	0
26	9	2	0
27	9	3	0
28	10	1	0
29	10	2	0
30	10	3	0
31	11	1	0
32	11	2	0
33	11	3	0
34	12	1	0
35	12	2	0
36	12	3	0
37	13	1	0
38	13	2	0
39	13	3	0
40	14	1	0
41	14	2	0
42	14	3	0
43	15	1	0
44	15	2	0
45	15	3	0
46	16	1	0
47	16	2	0
48	16	3	0
49	17	1	0
50	17	2	0
51	17	3	0
52	18	1	0
53	18	2	0
54	18	3	0
55	19	1	0
56	19	2	0
57	19	3	0
58	20	1	0
59	20	2	0
60	20	3	0
61	21	1	0
62	21	2	0
63	21	3	0
64	22	1	0
65	22	2	0
66	22	3	0
67	23	1	0
68	23	2	0
69	23	3	0
70	24	1	0
71	24	2	0
72	24	3	0
73	25	1	0
74	25	2	0
75	25	3	0
76	26	1	0
77	26	2	0
78	26	3	0
79	27	1	0
80	27	2	0
81	27	3	0
82	28	1	0
83	28	2	0
84	28	3	0
85	29	1	0
86	29	2	0
87	29	3	0
88	30	1	0
89	30	2	0
90	30	3	0
91	31	1	0
92	31	2	0
93	31	3	0
94	32	1	0
95	32	2	0
96	32	3	0
97	33	1	0
98	33	2	0
99	33	3	0
100	34	1	0
101	34	2	0
102	34	3	0
103	35	1	0
104	35	2	0
105	35	3	0
106	36	1	0
107	36	2	0
108	36	3	0
109	37	1	0
110	37	2	0
111	37	3	0
112	38	1	0
113	38	2	0
114	38	3	0
115	39	1	0
116	39	2	0
117	39	3	0
118	40	1	0
119	40	2	0
120	40	3	0
121	41	1	0
122	41	2	0
123	41	3	0
124	42	1	0
125	42	2	0
126	42	3	0
127	43	1	0
128	43	2	0
129	43	3	0
130	44	1	0
131	44	2	0
132	44	3	0
133	45	1	0
134	45	2	0
135	45	3	0
136	46	1	0
137	46	2	0
138	46	3	0
139	47	1	0
140	47	2	0
141	47	3	0
142	48	1	0
143	48	2	0
144	48	3	0
145	49	1	0
146	49	2	0
147	49	3	0
148	50	1	0
149	50	2	0
150	50	3	0
151	51	1	0
152	51	2	0
153	51	3	0
154	52	1	0
155	52	2	0
156	52	3	0
157	53	1	0
158	53	2	0
159	53	3	0
160	54	1	0
161	54	2	0
162	54	3	0
163	55	1	0
164	55	2	0
165	55	3	0
166	56	1	0
167	56	2	0
168	56	3	0
169	57	1	0
170	57	2	0
171	57	3	0
172	58	1	0
173	58	2	0
174	58	3	0
175	59	1	0
176	59	2	0
177	59	3	0
178	60	1	0
179	60	2	0
180	60	3	0
181	61	1	0
182	61	2	0
183	61	3	0
184	62	1	0
185	62	2	0
186	62	3	0
187	63	1	0
188	63	2	0
189	63	3	0
190	64	1	0
191	64	2	0
192	64	3	0
193	65	1	0
194	65	2	0
195	65	3	0
196	66	1	0
197	66	2	0
198	66	3	0
199	1	0	0
200	2	0	0
201	3	0	0
202	4	0	0
203	5	0	0
204	6	0	0
205	7	0	0
206	8	0	0
207	9	0	0
208	10	0	0
209	11	0	0
210	12	0	0
211	13	0	0
212	14	0	0
213	15	0	0
214	16	0	0
215	17	0	0
216	18	0	0
217	19	0	0
218	20	0	0
219	21	0	0
220	22	0	0
221	23	0	0
228	30	0	0
229	31	0	0
230	32	0	0
231	33	0	0
232	34	0	0
233	35	0	0
234	36	0	0
235	37	0	0
236	38	0	0
237	39	0	0
238	40	0	0
239	41	0	0
240	42	0	0
241	43	0	0
242	44	0	0
243	45	0	0
244	46	0	0
245	47	0	0
246	48	0	0
247	49	0	0
248	50	0	0
249	51	0	0
250	52	0	0
251	53	0	0
252	54	0	0
253	55	0	0
254	56	0	0
255	57	0	0
256	58	0	0
257	59	0	0
258	60	0	0
259	61	0	0
260	62	0	0
261	63	0	0
262	64	0	0
263	65	0	0
264	66	0	0
223	25	0	1
222	24	0	0
224	26	0	0
225	27	0	0
226	28	0	0
227	29	0	0
\.


--
-- Name: active_admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usuario
--

SELECT pg_catalog.setval('active_admin_permissions_id_seq', 264, true);


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: usuario
--

COPY admin_users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, role) FROM stdin;
1	admin@example.com	$2a$11$A.4pBub2xnVtaNSubrgX8.WTnDkRII6ddF.pwY0h09vQU88cjnRIO	\N	\N	\N	2018-10-17 17:30:30.400271	2018-10-28 00:46:31.770751	99
2	cris@gmail.com	$2a$11$7gNuXkMTBVMSujjkrvthlOK9mDtzgyfflpaE9.xECo.sLxDBGbME2	\N	\N	\N	2018-10-28 01:01:15.758925	2018-10-28 14:33:19.85496	0
3	pepe@gmail.com	$2a$11$.kFNjBsYo97Br9gzILDUwOaIgYw8c19hxF3f5lhenkvDxD0MyzD12	\N	\N	\N	2018-10-28 14:21:25.079357	2018-10-28 14:44:30.513788	99
\.


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usuario
--

SELECT pg_catalog.setval('admin_users_id_seq', 3, true);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: usuario
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2018-10-17 17:26:46.250373	2018-10-17 17:26:46.250373
\.


--
-- Data for Name: barrios; Type: TABLE DATA; Schema: public; Owner: usuario
--

COPY barrios (id, descripcion, activo, created_at, updated_at) FROM stdin;
1	san blas	t	2018-10-23 21:14:32.281974	2018-10-23 21:15:05.251797
\.


--
-- Name: barrios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usuario
--

SELECT pg_catalog.setval('barrios_id_seq', 1, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: usuario
--

COPY categories (id, category_descrip, category_active, created_at, updated_at) FROM stdin;
2	muebles	t	2018-10-20 02:15:27.813479	2018-10-20 02:15:27.813479
1	electrodomesticos	t	2018-10-20 02:14:37.143423	2018-10-20 02:15:45.138579
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usuario
--

SELECT pg_catalog.setval('categories_id_seq', 2, true);


--
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: usuario
--

COPY ciudades (id, descripcion, activo, created_at, updated_at) FROM stdin;
1	Cnel Bogado	t	2018-10-23 21:19:36.620682	2018-10-23 21:19:36.620682
\.


--
-- Name: ciudades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usuario
--

SELECT pg_catalog.setval('ciudades_id_seq', 1, true);


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: usuario
--

COPY clientes (id, nombre, apellido, n_cedula, cli_telefono, limite_credito, activo, ciudade_id, barrio_id, created_at, updated_at, direccion) FROM stdin;
1	Juan	Perez	4297393	0985 123456	5000000	t	1	1	2018-10-23 21:39:14.747094	2018-10-23 21:39:14.747094	Mcal Estigarribia 1065
\.


--
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usuario
--

SELECT pg_catalog.setval('clientes_id_seq', 1, true);


--
-- Data for Name: marcas; Type: TABLE DATA; Schema: public; Owner: usuario
--

COPY marcas (id, marca_descrip, marca_active, created_at, updated_at) FROM stdin;
1	SPEED	t	2018-10-23 21:57:56.148686	2018-10-23 21:57:56.148686
2	TOKYO	t	2018-10-23 21:58:16.012731	2018-10-23 21:58:16.012731
\.


--
-- Name: marcas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usuario
--

SELECT pg_catalog.setval('marcas_id_seq', 2, true);


--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: usuario
--

COPY productos (id, provider_id, category_id, sub_category_id, marca_id, prod_descrip, iva, precio_venta, prod_active, created_at, updated_at) FROM stdin;
\.


--
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usuario
--

SELECT pg_catalog.setval('productos_id_seq', 1, false);


--
-- Data for Name: providers; Type: TABLE DATA; Schema: public; Owner: usuario
--

COPY providers (id, razon_social, ruc, prov_direccion, telefono, email, prov_active, created_at, updated_at) FROM stdin;
1	LA YUTEÑA	1234567	ENCARNACION	071202020	layuteña@layuteña.com	t	2018-10-23 22:00:12.857696	2018-10-23 22:00:12.857696
\.


--
-- Name: providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usuario
--

SELECT pg_catalog.setval('providers_id_seq', 1, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: usuario
--

COPY schema_migrations (version) FROM stdin;
20181014133732
20181014133738
20181014134237
20181014135145
20181014181901
20181014181958
20181014190154
20181014195510
20181015013046
20181015015547
20181017010211
20181020022546
20181027021633
20181027230634
20181027230635
20181027230636
\.


--
-- Data for Name: stocks; Type: TABLE DATA; Schema: public; Owner: usuario
--

COPY stocks (id, producto_id, sucursal_id, cantidad, cant_minima, created_at, updated_at) FROM stdin;
\.


--
-- Name: stocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usuario
--

SELECT pg_catalog.setval('stocks_id_seq', 1, false);


--
-- Data for Name: sub_categories; Type: TABLE DATA; Schema: public; Owner: usuario
--

COPY sub_categories (id, subcat_descrip, subcat_active, category_id, created_at, updated_at) FROM stdin;
1	Lavarropas	t	2	2018-10-20 02:39:42.425459	2018-10-20 02:39:42.425459
\.


--
-- Name: sub_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usuario
--

SELECT pg_catalog.setval('sub_categories_id_seq', 1, true);


--
-- Data for Name: sucursals; Type: TABLE DATA; Schema: public; Owner: usuario
--

COPY sucursals (id, suc_descrip, suc_active, created_at, updated_at) FROM stdin;
1	CASA MATRIZ	t	2018-10-17 17:30:30.101459	2018-10-17 17:30:30.101459
2	GRAL ARTIGAS	t	2018-10-17 17:30:30.194792	2018-10-17 17:30:30.194792
3	RUTA 1	t	2018-10-17 17:30:30.198424	2018-10-17 17:30:30.198424
\.


--
-- Name: sucursals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usuario
--

SELECT pg_catalog.setval('sucursals_id_seq', 3, true);


--
-- Name: active_admin_comments active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: active_admin_managed_resources active_admin_managed_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY active_admin_managed_resources
    ADD CONSTRAINT active_admin_managed_resources_pkey PRIMARY KEY (id);


--
-- Name: active_admin_permissions active_admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY active_admin_permissions
    ADD CONSTRAINT active_admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: barrios barrios_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY barrios
    ADD CONSTRAINT barrios_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: ciudades ciudades_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY ciudades
    ADD CONSTRAINT ciudades_pkey PRIMARY KEY (id);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- Name: marcas marcas_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY marcas
    ADD CONSTRAINT marcas_pkey PRIMARY KEY (id);


--
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- Name: providers providers_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY providers
    ADD CONSTRAINT providers_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: stocks stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (id);


--
-- Name: sub_categories sub_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY sub_categories
    ADD CONSTRAINT sub_categories_pkey PRIMARY KEY (id);


--
-- Name: sucursals sucursals_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY sucursals
    ADD CONSTRAINT sucursals_pkey PRIMARY KEY (id);


--
-- Name: active_admin_managed_resources_index; Type: INDEX; Schema: public; Owner: usuario
--

CREATE UNIQUE INDEX active_admin_managed_resources_index ON active_admin_managed_resources USING btree (class_name, action, name);


--
-- Name: active_admin_permissions_index; Type: INDEX; Schema: public; Owner: usuario
--

CREATE UNIQUE INDEX active_admin_permissions_index ON active_admin_permissions USING btree (managed_resource_id, role);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: usuario
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: usuario
--

CREATE INDEX index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: usuario
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: usuario
--

CREATE UNIQUE INDEX index_admin_users_on_email ON admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: usuario
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON admin_users USING btree (reset_password_token);


--
-- Name: index_clientes_on_barrio_id; Type: INDEX; Schema: public; Owner: usuario
--

CREATE INDEX index_clientes_on_barrio_id ON clientes USING btree (barrio_id);


--
-- Name: index_clientes_on_ciudade_id; Type: INDEX; Schema: public; Owner: usuario
--

CREATE INDEX index_clientes_on_ciudade_id ON clientes USING btree (ciudade_id);


--
-- Name: index_productos_on_category_id; Type: INDEX; Schema: public; Owner: usuario
--

CREATE INDEX index_productos_on_category_id ON productos USING btree (category_id);


--
-- Name: index_productos_on_marca_id; Type: INDEX; Schema: public; Owner: usuario
--

CREATE INDEX index_productos_on_marca_id ON productos USING btree (marca_id);


--
-- Name: index_productos_on_provider_id; Type: INDEX; Schema: public; Owner: usuario
--

CREATE INDEX index_productos_on_provider_id ON productos USING btree (provider_id);


--
-- Name: index_productos_on_sub_category_id; Type: INDEX; Schema: public; Owner: usuario
--

CREATE INDEX index_productos_on_sub_category_id ON productos USING btree (sub_category_id);


--
-- Name: index_stocks_on_producto_id; Type: INDEX; Schema: public; Owner: usuario
--

CREATE INDEX index_stocks_on_producto_id ON stocks USING btree (producto_id);


--
-- Name: index_stocks_on_sucursal_id; Type: INDEX; Schema: public; Owner: usuario
--

CREATE INDEX index_stocks_on_sucursal_id ON stocks USING btree (sucursal_id);


--
-- Name: index_sub_categories_on_category_id; Type: INDEX; Schema: public; Owner: usuario
--

CREATE INDEX index_sub_categories_on_category_id ON sub_categories USING btree (category_id);


--
-- Name: index_unique; Type: INDEX; Schema: public; Owner: usuario
--

CREATE UNIQUE INDEX index_unique ON stocks USING btree (producto_id, sucursal_id);


--
-- Name: productos tg_prod_sucursal; Type: TRIGGER; Schema: public; Owner: usuario
--

CREATE TRIGGER tg_prod_sucursal AFTER INSERT ON productos FOR EACH ROW EXECUTE PROCEDURE tr_produc_sucursal();


--
-- Name: productos fk_rails_6421931893; Type: FK CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT fk_rails_6421931893 FOREIGN KEY (sub_category_id) REFERENCES sub_categories(id);


--
-- Name: clientes fk_rails_643488ddd1; Type: FK CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT fk_rails_643488ddd1 FOREIGN KEY (barrio_id) REFERENCES barrios(id);


--
-- Name: productos fk_rails_6b31712062; Type: FK CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT fk_rails_6b31712062 FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: sub_categories fk_rails_8e75c2ee78; Type: FK CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY sub_categories
    ADD CONSTRAINT fk_rails_8e75c2ee78 FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: clientes fk_rails_95e756acf4; Type: FK CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT fk_rails_95e756acf4 FOREIGN KEY (ciudade_id) REFERENCES ciudades(id);


--
-- Name: stocks fk_rails_cb5ad909df; Type: FK CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY stocks
    ADD CONSTRAINT fk_rails_cb5ad909df FOREIGN KEY (producto_id) REFERENCES productos(id);


--
-- Name: productos fk_rails_dbfe83f5de; Type: FK CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT fk_rails_dbfe83f5de FOREIGN KEY (provider_id) REFERENCES providers(id);


--
-- Name: productos fk_rails_e752c6fdd1; Type: FK CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT fk_rails_e752c6fdd1 FOREIGN KEY (marca_id) REFERENCES marcas(id);


--
-- Name: stocks fk_rails_ebf77b11f7; Type: FK CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY stocks
    ADD CONSTRAINT fk_rails_ebf77b11f7 FOREIGN KEY (sucursal_id) REFERENCES sucursals(id);


--
-- PostgreSQL database dump complete
--

