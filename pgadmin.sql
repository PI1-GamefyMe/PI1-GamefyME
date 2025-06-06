PGDMP  .    2    
            }         
   gamefymedb    17.4    17.4 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16632 
   gamefymedb    DATABASE     v   CREATE DATABASE gamefymedb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE gamefymedb;
                     postgres    false            x           1247    16942 	   peso_enum    TYPE     z   CREATE TYPE public.peso_enum AS ENUM (
    'muito_facil',
    'facil',
    'medio',
    'dificil',
    'muito_dificil'
);
    DROP TYPE public.peso_enum;
       public               postgres    false            �           1247    17153    recorrencia_enum    TYPE     O   CREATE TYPE public.recorrencia_enum AS ENUM (
    'unica',
    'recorrente'
);
 #   DROP TYPE public.recorrencia_enum;
       public               postgres    false            �           1247    17183    situacao_atividade_enum    TYPE     f   CREATE TYPE public.situacao_atividade_enum AS ENUM (
    'ativa',
    'realizada',
    'cancelada'
);
 *   DROP TYPE public.situacao_atividade_enum;
       public               postgres    false            �           1247    17451    tipo_desafio_enum    TYPE     \   CREATE TYPE public.tipo_desafio_enum AS ENUM (
    'diario',
    'semanal',
    'mensal'
);
 $   DROP TYPE public.tipo_desafio_enum;
       public               postgres    false            �           1247    17274    tipo_notificacao_enum    TYPE     i   CREATE TYPE public.tipo_notificacao_enum AS ENUM (
    'info',
    'sucesso',
    'aviso',
    'erro'
);
 (   DROP TYPE public.tipo_notificacao_enum;
       public               postgres    false            u           1247    16936    tipo_usuario_enum    TYPE     S   CREATE TYPE public.tipo_usuario_enum AS ENUM (
    'comum',
    'administrador'
);
 $   DROP TYPE public.tipo_usuario_enum;
       public               postgres    false            �            1259    16989 
   atividades    TABLE     �  CREATE TABLE public.atividades (
    idatividade integer NOT NULL,
    idusuario integer NOT NULL,
    nmatividade character varying(100) NOT NULL,
    peso public.peso_enum NOT NULL,
    situacao public.situacao_atividade_enum NOT NULL,
    recorrencia public.recorrencia_enum NOT NULL,
    dtatividade timestamp with time zone NOT NULL,
    dtatividaderealizada timestamp with time zone,
    tpestimado integer NOT NULL,
    dsatividade text,
    expatividade smallint DEFAULT 0
);
    DROP TABLE public.atividades;
       public         heap r       postgres    false    918    915    888            �            1259    17198    atividades_concluidas    TABLE     �   CREATE TABLE public.atividades_concluidas (
    idatividade_concluida integer NOT NULL,
    idatividade integer NOT NULL,
    idusuario integer NOT NULL,
    dtconclusao timestamp with time zone NOT NULL
);
 )   DROP TABLE public.atividades_concluidas;
       public         heap r       postgres    false            �            1259    17197 /   atividades_concluidas_idatividade_concluida_seq    SEQUENCE     �   CREATE SEQUENCE public.atividades_concluidas_idatividade_concluida_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.atividades_concluidas_idatividade_concluida_seq;
       public               postgres    false    235            �           0    0 /   atividades_concluidas_idatividade_concluida_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.atividades_concluidas_idatividade_concluida_seq OWNED BY public.atividades_concluidas.idatividade_concluida;
          public               postgres    false    234            �            1259    16988    atividades_idatividade_seq    SEQUENCE     �   CREATE SEQUENCE public.atividades_idatividade_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.atividades_idatividade_seq;
       public               postgres    false    221            �           0    0    atividades_idatividade_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.atividades_idatividade_seq OWNED BY public.atividades.idatividade;
          public               postgres    false    220            �            1259    17373 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap r       postgres    false            �            1259    17372    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public               postgres    false    245            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public               postgres    false    244            �            1259    17382    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap r       postgres    false            �            1259    17381    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public               postgres    false    247            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public               postgres    false    246            �            1259    17329    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap r       postgres    false            �            1259    17328    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public               postgres    false    239            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public               postgres    false    238            �            1259    17343 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap r       postgres    false            �            1259    17401    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap r       postgres    false            �            1259    17400    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public               postgres    false    249            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public               postgres    false    248            �            1259    17342    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public               postgres    false    241            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public               postgres    false    240            �            1259    17354    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap r       postgres    false            �            1259    17353 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public               postgres    false    243            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public               postgres    false    242            �            1259    17068 
   conquistas    TABLE     �   CREATE TABLE public.conquistas (
    idconquista integer NOT NULL,
    nmconquista character varying(100) NOT NULL,
    dsconquista text,
    nmimagem text,
    expconquista smallint DEFAULT 0
);
    DROP TABLE public.conquistas;
       public         heap r       postgres    false            �            1259    17067    conquistas_idconquista_seq    SEQUENCE     �   CREATE SEQUENCE public.conquistas_idconquista_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.conquistas_idconquista_seq;
       public               postgres    false    231            �           0    0    conquistas_idconquista_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.conquistas_idconquista_seq OWNED BY public.conquistas.idconquista;
          public               postgres    false    230            �            1259    17006    desafios    TABLE     4  CREATE TABLE public.desafios (
    iddesafio integer NOT NULL,
    nmdesafio character varying(100) NOT NULL,
    dsdesafio text,
    dtinicio date,
    dtfim date,
    tipo public.tipo_desafio_enum NOT NULL,
    expdesafio smallint DEFAULT 0,
    tipo_logica character varying(50),
    parametro integer
);
    DROP TABLE public.desafios;
       public         heap r       postgres    false    954            �            1259    17005    desafios_iddesafio_seq    SEQUENCE     �   CREATE SEQUENCE public.desafios_iddesafio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.desafios_iddesafio_seq;
       public               postgres    false    223            �           0    0    desafios_iddesafio_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.desafios_iddesafio_seq OWNED BY public.desafios.iddesafio;
          public               postgres    false    222            �            1259    17420    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap r       postgres    false            �            1259    17419    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public               postgres    false    251            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public               postgres    false    250            �            1259    17441    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL,
    name character varying(100)
);
 '   DROP TABLE public.django_content_type;
       public         heap r       postgres    false            �            1259    17440    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public               postgres    false    253            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public               postgres    false    252            �            1259    17311    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap r       postgres    false            �            1259    17310    django_migrations_id_seq    SEQUENCE     �   ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    237            �            1259    16771    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap r       postgres    false            �            1259    17034    notificacoes    TABLE       CREATE TABLE public.notificacoes (
    idnotificacao integer NOT NULL,
    idusuario integer NOT NULL,
    dsmensagem text NOT NULL,
    fltipo public.tipo_notificacao_enum,
    dtcriacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    flstatus boolean DEFAULT false
);
     DROP TABLE public.notificacoes;
       public         heap r       postgres    false    924            �            1259    17033    notificacoes_idnotificacao_seq    SEQUENCE     �   CREATE SEQUENCE public.notificacoes_idnotificacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.notificacoes_idnotificacao_seq;
       public               postgres    false    227            �           0    0    notificacoes_idnotificacao_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.notificacoes_idnotificacao_seq OWNED BY public.notificacoes.idnotificacao;
          public               postgres    false    226            �            1259    17050    sessoes_pomodoro    TABLE     �   CREATE TABLE public.sessoes_pomodoro (
    idsessao integer NOT NULL,
    idusuario integer NOT NULL,
    idatividade integer NOT NULL,
    inicio timestamp without time zone NOT NULL,
    fim timestamp without time zone,
    nrciclo integer DEFAULT 1
);
 $   DROP TABLE public.sessoes_pomodoro;
       public         heap r       postgres    false            �            1259    17049    sessoes_pomodoro_idsessao_seq    SEQUENCE     �   CREATE SEQUENCE public.sessoes_pomodoro_idsessao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.sessoes_pomodoro_idsessao_seq;
       public               postgres    false    229            �           0    0    sessoes_pomodoro_idsessao_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.sessoes_pomodoro_idsessao_seq OWNED BY public.sessoes_pomodoro.idsessao;
          public               postgres    false    228            �            1259    17078    usuario_conquistas    TABLE     �   CREATE TABLE public.usuario_conquistas (
    idusuarioconquista integer NOT NULL,
    idusuario integer NOT NULL,
    idconquista integer NOT NULL,
    dtconcessao date DEFAULT CURRENT_DATE
);
 &   DROP TABLE public.usuario_conquistas;
       public         heap r       postgres    false            �            1259    17077 )   usuario_conquistas_idusuarioconquista_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_conquistas_idusuarioconquista_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.usuario_conquistas_idusuarioconquista_seq;
       public               postgres    false    233            �           0    0 )   usuario_conquistas_idusuarioconquista_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.usuario_conquistas_idusuarioconquista_seq OWNED BY public.usuario_conquistas.idusuarioconquista;
          public               postgres    false    232            �            1259    17016    usuario_desafios    TABLE     �   CREATE TABLE public.usuario_desafios (
    idusuariodesafio integer NOT NULL,
    idusuario integer NOT NULL,
    iddesafio integer NOT NULL,
    flsituacao boolean DEFAULT true,
    dtpremiacao date
);
 $   DROP TABLE public.usuario_desafios;
       public         heap r       postgres    false            �            1259    17015 %   usuario_desafios_idusuariodesafio_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_desafios_idusuariodesafio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.usuario_desafios_idusuariodesafio_seq;
       public               postgres    false    225            �           0    0 %   usuario_desafios_idusuariodesafio_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.usuario_desafios_idusuariodesafio_seq OWNED BY public.usuario_desafios.idusuariodesafio;
          public               postgres    false    224            �            1259    16976    usuarios    TABLE       CREATE TABLE public.usuarios (
    idusuario integer NOT NULL,
    nmusuario character varying(100) NOT NULL,
    emailusuario character varying(100) NOT NULL,
    dtnascimento date NOT NULL,
    flsituacao boolean DEFAULT true,
    nivelusuario integer DEFAULT 1,
    expusuario smallint DEFAULT 0,
    tipousuario public.tipo_usuario_enum NOT NULL,
    ultima_atividade date,
    date_joined timestamp with time zone NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone,
    password character varying(128) NOT NULL,
    imagem_perfil character varying(100) DEFAULT 'avatar1.png'::character varying,
    CONSTRAINT usuarios_expusuario_check CHECK (((expusuario >= 0) AND (expusuario <= 1000)))
);
    DROP TABLE public.usuarios;
       public         heap r       postgres    false    885            �            1259    16975    usuarios_idusuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_idusuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuarios_idusuario_seq;
       public               postgres    false    219            �           0    0    usuarios_idusuario_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.usuarios_idusuario_seq OWNED BY public.usuarios.idusuario;
          public               postgres    false    218            �           2604    16992    atividades idatividade    DEFAULT     �   ALTER TABLE ONLY public.atividades ALTER COLUMN idatividade SET DEFAULT nextval('public.atividades_idatividade_seq'::regclass);
 E   ALTER TABLE public.atividades ALTER COLUMN idatividade DROP DEFAULT;
       public               postgres    false    221    220    221            �           2604    17201 +   atividades_concluidas idatividade_concluida    DEFAULT     �   ALTER TABLE ONLY public.atividades_concluidas ALTER COLUMN idatividade_concluida SET DEFAULT nextval('public.atividades_concluidas_idatividade_concluida_seq'::regclass);
 Z   ALTER TABLE public.atividades_concluidas ALTER COLUMN idatividade_concluida DROP DEFAULT;
       public               postgres    false    235    234    235            �           2604    17376    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    244    245    245            �           2604    17385    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    246    247    247            �           2604    17332    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    238    239    239            �           2604    17346    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    240    241    241            �           2604    17404    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    249    248    249            �           2604    17357    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    243    242    243            �           2604    17071    conquistas idconquista    DEFAULT     �   ALTER TABLE ONLY public.conquistas ALTER COLUMN idconquista SET DEFAULT nextval('public.conquistas_idconquista_seq'::regclass);
 E   ALTER TABLE public.conquistas ALTER COLUMN idconquista DROP DEFAULT;
       public               postgres    false    230    231    231            �           2604    17009    desafios iddesafio    DEFAULT     x   ALTER TABLE ONLY public.desafios ALTER COLUMN iddesafio SET DEFAULT nextval('public.desafios_iddesafio_seq'::regclass);
 A   ALTER TABLE public.desafios ALTER COLUMN iddesafio DROP DEFAULT;
       public               postgres    false    223    222    223            �           2604    17423    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    251    250    251            �           2604    17444    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    252    253    253            �           2604    17037    notificacoes idnotificacao    DEFAULT     �   ALTER TABLE ONLY public.notificacoes ALTER COLUMN idnotificacao SET DEFAULT nextval('public.notificacoes_idnotificacao_seq'::regclass);
 I   ALTER TABLE public.notificacoes ALTER COLUMN idnotificacao DROP DEFAULT;
       public               postgres    false    227    226    227            �           2604    17053    sessoes_pomodoro idsessao    DEFAULT     �   ALTER TABLE ONLY public.sessoes_pomodoro ALTER COLUMN idsessao SET DEFAULT nextval('public.sessoes_pomodoro_idsessao_seq'::regclass);
 H   ALTER TABLE public.sessoes_pomodoro ALTER COLUMN idsessao DROP DEFAULT;
       public               postgres    false    228    229    229            �           2604    17081 %   usuario_conquistas idusuarioconquista    DEFAULT     �   ALTER TABLE ONLY public.usuario_conquistas ALTER COLUMN idusuarioconquista SET DEFAULT nextval('public.usuario_conquistas_idusuarioconquista_seq'::regclass);
 T   ALTER TABLE public.usuario_conquistas ALTER COLUMN idusuarioconquista DROP DEFAULT;
       public               postgres    false    233    232    233            �           2604    17019 !   usuario_desafios idusuariodesafio    DEFAULT     �   ALTER TABLE ONLY public.usuario_desafios ALTER COLUMN idusuariodesafio SET DEFAULT nextval('public.usuario_desafios_idusuariodesafio_seq'::regclass);
 P   ALTER TABLE public.usuario_desafios ALTER COLUMN idusuariodesafio DROP DEFAULT;
       public               postgres    false    225    224    225            �           2604    16979    usuarios idusuario    DEFAULT     x   ALTER TABLE ONLY public.usuarios ALTER COLUMN idusuario SET DEFAULT nextval('public.usuarios_idusuario_seq'::regclass);
 A   ALTER TABLE public.usuarios ALTER COLUMN idusuario DROP DEFAULT;
       public               postgres    false    219    218    219            �          0    16989 
   atividades 
   TABLE DATA           �   COPY public.atividades (idatividade, idusuario, nmatividade, peso, situacao, recorrencia, dtatividade, dtatividaderealizada, tpestimado, dsatividade, expatividade) FROM stdin;
    public               postgres    false    221   l�       �          0    17198    atividades_concluidas 
   TABLE DATA           k   COPY public.atividades_concluidas (idatividade_concluida, idatividade, idusuario, dtconclusao) FROM stdin;
    public               postgres    false    235   [�       �          0    17373 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public               postgres    false    245   ��       �          0    17382    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public               postgres    false    247   ��       �          0    17329    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public               postgres    false    239   ��       �          0    17343 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public               postgres    false    241   ��       �          0    17401    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public               postgres    false    249   ��       �          0    17354    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public               postgres    false    243   �       �          0    17068 
   conquistas 
   TABLE DATA           c   COPY public.conquistas (idconquista, nmconquista, dsconquista, nmimagem, expconquista) FROM stdin;
    public               postgres    false    231    �       �          0    17006    desafios 
   TABLE DATA           ~   COPY public.desafios (iddesafio, nmdesafio, dsdesafio, dtinicio, dtfim, tipo, expdesafio, tipo_logica, parametro) FROM stdin;
    public               postgres    false    223   =�       �          0    17420    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
    public               postgres    false    251   ��       �          0    17441    django_content_type 
   TABLE DATA           I   COPY public.django_content_type (id, app_label, model, name) FROM stdin;
    public               postgres    false    253   ��       �          0    17311    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public               postgres    false    237   ��       �          0    16771    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public               postgres    false    217   ��       �          0    17034    notificacoes 
   TABLE DATA           i   COPY public.notificacoes (idnotificacao, idusuario, dsmensagem, fltipo, dtcriacao, flstatus) FROM stdin;
    public               postgres    false    227   ��       �          0    17050    sessoes_pomodoro 
   TABLE DATA           b   COPY public.sessoes_pomodoro (idsessao, idusuario, idatividade, inicio, fim, nrciclo) FROM stdin;
    public               postgres    false    229   ��       �          0    17078    usuario_conquistas 
   TABLE DATA           e   COPY public.usuario_conquistas (idusuarioconquista, idusuario, idconquista, dtconcessao) FROM stdin;
    public               postgres    false    233   ��       �          0    17016    usuario_desafios 
   TABLE DATA           k   COPY public.usuario_desafios (idusuariodesafio, idusuario, iddesafio, flsituacao, dtpremiacao) FROM stdin;
    public               postgres    false    225   ��       �          0    16976    usuarios 
   TABLE DATA           �   COPY public.usuarios (idusuario, nmusuario, emailusuario, dtnascimento, flsituacao, nivelusuario, expusuario, tipousuario, ultima_atividade, date_joined, is_active, is_staff, is_superuser, last_login, password, imagem_perfil) FROM stdin;
    public               postgres    false    219   2�       �           0    0 /   atividades_concluidas_idatividade_concluida_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.atividades_concluidas_idatividade_concluida_seq', 95, true);
          public               postgres    false    234            �           0    0    atividades_idatividade_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.atividades_idatividade_seq', 95, true);
          public               postgres    false    220            �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public               postgres    false    244            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public               postgres    false    246            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);
          public               postgres    false    238            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public               postgres    false    248            �           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);
          public               postgres    false    240            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public               postgres    false    242            �           0    0    conquistas_idconquista_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.conquistas_idconquista_seq', 1, false);
          public               postgres    false    230            �           0    0    desafios_iddesafio_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.desafios_iddesafio_seq', 32, true);
          public               postgres    false    222            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public               postgres    false    250            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);
          public               postgres    false    252            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 34, true);
          public               postgres    false    236            �           0    0    notificacoes_idnotificacao_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.notificacoes_idnotificacao_seq', 205, true);
          public               postgres    false    226            �           0    0    sessoes_pomodoro_idsessao_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.sessoes_pomodoro_idsessao_seq', 50, true);
          public               postgres    false    228            �           0    0 )   usuario_conquistas_idusuarioconquista_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.usuario_conquistas_idusuarioconquista_seq', 1, false);
          public               postgres    false    232            �           0    0 %   usuario_desafios_idusuariodesafio_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.usuario_desafios_idusuariodesafio_seq', 34, true);
          public               postgres    false    224            �           0    0    usuarios_idusuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuarios_idusuario_seq', 33, true);
          public               postgres    false    218            �           2606    17203 0   atividades_concluidas atividades_concluidas_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.atividades_concluidas
    ADD CONSTRAINT atividades_concluidas_pkey PRIMARY KEY (idatividade_concluida);
 Z   ALTER TABLE ONLY public.atividades_concluidas DROP CONSTRAINT atividades_concluidas_pkey;
       public                 postgres    false    235            �           2606    16997    atividades atividades_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.atividades
    ADD CONSTRAINT atividades_pkey PRIMARY KEY (idatividade);
 D   ALTER TABLE ONLY public.atividades DROP CONSTRAINT atividades_pkey;
       public                 postgres    false    221            �           2606    17380    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public                 postgres    false    245            �           2606    17389 H   auth_group_permissions auth_group_permissions_group_id_permission_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);
 r   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_key;
       public                 postgres    false    247    247            �           2606    17387 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public                 postgres    false    247            �           2606    17378    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public                 postgres    false    245            �           2606    17336 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public                 postgres    false    239    239            �           2606    17334 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public                 postgres    false    239            �           2606    17406 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public                 postgres    false    249            �           2606    17408 6   auth_user_groups auth_user_groups_user_id_group_id_key 
   CONSTRAINT     ~   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);
 `   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_key;
       public                 postgres    false    249    249            �           2606    17350    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public                 postgres    false    241            �           2606    17359 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public                 postgres    false    243            �           2606    17361 O   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);
 y   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_key;
       public                 postgres    false    243    243            �           2606    17352     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public                 postgres    false    241            �           2606    17076    conquistas conquistas_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.conquistas
    ADD CONSTRAINT conquistas_pkey PRIMARY KEY (idconquista);
 D   ALTER TABLE ONLY public.conquistas DROP CONSTRAINT conquistas_pkey;
       public                 postgres    false    231            �           2606    17014    desafios desafios_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.desafios
    ADD CONSTRAINT desafios_pkey PRIMARY KEY (iddesafio);
 @   ALTER TABLE ONLY public.desafios DROP CONSTRAINT desafios_pkey;
       public                 postgres    false    223            �           2606    17428 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public                 postgres    false    251            �           2606    17448 ;   django_content_type django_content_type_app_label_model_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);
 e   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_key;
       public                 postgres    false    253    253            �           2606    17446 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public                 postgres    false    253            �           2606    17317 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public                 postgres    false    237            �           2606    16777 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public                 postgres    false    217            �           2606    17043    notificacoes notificacoes_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.notificacoes
    ADD CONSTRAINT notificacoes_pkey PRIMARY KEY (idnotificacao);
 H   ALTER TABLE ONLY public.notificacoes DROP CONSTRAINT notificacoes_pkey;
       public                 postgres    false    227            �           2606    17056 &   sessoes_pomodoro sessoes_pomodoro_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.sessoes_pomodoro
    ADD CONSTRAINT sessoes_pomodoro_pkey PRIMARY KEY (idsessao);
 P   ALTER TABLE ONLY public.sessoes_pomodoro DROP CONSTRAINT sessoes_pomodoro_pkey;
       public                 postgres    false    229            �           2606    16999     atividades unq_usuario_atividade 
   CONSTRAINT     m   ALTER TABLE ONLY public.atividades
    ADD CONSTRAINT unq_usuario_atividade UNIQUE (idusuario, nmatividade);
 J   ALTER TABLE ONLY public.atividades DROP CONSTRAINT unq_usuario_atividade;
       public                 postgres    false    221    221            �           2606    17084 *   usuario_conquistas usuario_conquistas_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.usuario_conquistas
    ADD CONSTRAINT usuario_conquistas_pkey PRIMARY KEY (idusuarioconquista);
 T   ALTER TABLE ONLY public.usuario_conquistas DROP CONSTRAINT usuario_conquistas_pkey;
       public                 postgres    false    233            �           2606    17022 &   usuario_desafios usuario_desafios_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.usuario_desafios
    ADD CONSTRAINT usuario_desafios_pkey PRIMARY KEY (idusuariodesafio);
 P   ALTER TABLE ONLY public.usuario_desafios DROP CONSTRAINT usuario_desafios_pkey;
       public                 postgres    false    225            �           2606    16987 "   usuarios usuarios_emailusuario_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_emailusuario_key UNIQUE (emailusuario);
 L   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_emailusuario_key;
       public                 postgres    false    219            �           2606    16985    usuarios usuarios_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (idusuario);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public                 postgres    false    219            �           1259    16779 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public                 postgres    false    217            �           1259    16778 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public                 postgres    false    217            �           2606    17204 <   atividades_concluidas atividades_concluidas_idatividade_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.atividades_concluidas
    ADD CONSTRAINT atividades_concluidas_idatividade_fkey FOREIGN KEY (idatividade) REFERENCES public.atividades(idatividade);
 f   ALTER TABLE ONLY public.atividades_concluidas DROP CONSTRAINT atividades_concluidas_idatividade_fkey;
       public               postgres    false    235    221    4294                        2606    17209 :   atividades_concluidas atividades_concluidas_idusuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.atividades_concluidas
    ADD CONSTRAINT atividades_concluidas_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuarios(idusuario);
 d   ALTER TABLE ONLY public.atividades_concluidas DROP CONSTRAINT atividades_concluidas_idusuario_fkey;
       public               postgres    false    4292    235    219            �           2606    17000 $   atividades atividades_idusuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.atividades
    ADD CONSTRAINT atividades_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuarios(idusuario);
 N   ALTER TABLE ONLY public.atividades DROP CONSTRAINT atividades_idusuario_fkey;
       public               postgres    false    4292    221    219                       2606    17390 ;   auth_group_permissions auth_group_permissions_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_fkey;
       public               postgres    false    245    247    4328                       2606    17395 @   auth_group_permissions auth_group_permissions_permission_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_permission_id_fkey;
       public               postgres    false    4316    247    239                       2606    17414 /   auth_user_groups auth_user_groups_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 Y   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_fkey;
       public               postgres    false    245    4328    249                       2606    17409 .   auth_user_groups auth_user_groups_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 X   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_fkey;
       public               postgres    false    4318    249    241                       2606    17367 H   auth_user_user_permissions auth_user_user_permissions_permission_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_permission_id_fkey;
       public               postgres    false    4316    239    243                       2606    17362 B   auth_user_user_permissions auth_user_user_permissions_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_fkey;
       public               postgres    false    243    4318    241                       2606    17429 .   django_admin_log django_admin_log_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 X   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_fkey;
       public               postgres    false    251    241    4318            �           2606    17044 (   notificacoes notificacoes_idusuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notificacoes
    ADD CONSTRAINT notificacoes_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuarios(idusuario);
 R   ALTER TABLE ONLY public.notificacoes DROP CONSTRAINT notificacoes_idusuario_fkey;
       public               postgres    false    219    4292    227            �           2606    17062 2   sessoes_pomodoro sessoes_pomodoro_idatividade_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sessoes_pomodoro
    ADD CONSTRAINT sessoes_pomodoro_idatividade_fkey FOREIGN KEY (idatividade) REFERENCES public.atividades(idatividade);
 \   ALTER TABLE ONLY public.sessoes_pomodoro DROP CONSTRAINT sessoes_pomodoro_idatividade_fkey;
       public               postgres    false    229    221    4294            �           2606    17057 0   sessoes_pomodoro sessoes_pomodoro_idusuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sessoes_pomodoro
    ADD CONSTRAINT sessoes_pomodoro_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuarios(idusuario);
 Z   ALTER TABLE ONLY public.sessoes_pomodoro DROP CONSTRAINT sessoes_pomodoro_idusuario_fkey;
       public               postgres    false    219    4292    229            �           2606    17090 6   usuario_conquistas usuario_conquistas_idconquista_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_conquistas
    ADD CONSTRAINT usuario_conquistas_idconquista_fkey FOREIGN KEY (idconquista) REFERENCES public.conquistas(idconquista);
 `   ALTER TABLE ONLY public.usuario_conquistas DROP CONSTRAINT usuario_conquistas_idconquista_fkey;
       public               postgres    false    233    4306    231            �           2606    17085 4   usuario_conquistas usuario_conquistas_idusuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_conquistas
    ADD CONSTRAINT usuario_conquistas_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuarios(idusuario);
 ^   ALTER TABLE ONLY public.usuario_conquistas DROP CONSTRAINT usuario_conquistas_idusuario_fkey;
       public               postgres    false    219    4292    233            �           2606    17028 0   usuario_desafios usuario_desafios_iddesafio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_desafios
    ADD CONSTRAINT usuario_desafios_iddesafio_fkey FOREIGN KEY (iddesafio) REFERENCES public.desafios(iddesafio);
 Z   ALTER TABLE ONLY public.usuario_desafios DROP CONSTRAINT usuario_desafios_iddesafio_fkey;
       public               postgres    false    223    225    4298            �           2606    17023 0   usuario_desafios usuario_desafios_idusuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_desafios
    ADD CONSTRAINT usuario_desafios_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuarios(idusuario);
 Z   ALTER TABLE ONLY public.usuario_desafios DROP CONSTRAINT usuario_desafios_idusuario_fkey;
       public               postgres    false    4292    219    225            �   �  x���K��0D��)x���n���~�U��DOH�CY��m�
r_,�l��@��UW������Xx�x��>NlL]�Y<􏑕��R����9�>H�^�u~�*�p���ơ\Ug�û��Jd��z��B�.v�w��o���y<������r�j�dd����IK�m�	J
�x���iZ߀�y�tɆ����;�O%�hP )�#�{NU: 	�^k\T	���|�}��
UA� JX�t�E5U��	o�ŧP�5|\���!�m����Ķ�:����x�6�dPY��z���j>�8���T���K����ٗ��׸�O�s�_.і��g�^ �A����)��)��f];W䘧:ۂ�+v�O�6��q�L�
�!.�J�/��yK��<^�X�=(�.�4��M�U�:hտ��.�1�g��Z�kE�KS��8���t�A�@0^�D�9�Bs�+����^4M���      �   #  x�m��m�0@ѳ\���}�%��Z$�G����Hh����(N��(�	��q#��
��'�d�b8"�c8��%�3p]���
yz�r.�#�ͤTKqz �R2R6�W�)h��L-Ă���f{�%>��-#�Wc���n3�-�w�[��âO2���kh3�R��ԯXl�fZЭ��V���=�� >-Ԟ�t�-�;�)�b�gV�I%��6�I_��`�_C]F����j
��\�bu�0�Ŋm����捻'z�$��I�����w��MS��~�q�⪔�      �      x������ � �      �      x������ � �      �   �  x�m�[��0E��U��Qx��=�h�e�;�����z�C*E�-�?\���lߤt�P��+��R�a]��粦��i����)X��k�-�)��������bv��w?M}\Ej:��3 �{D?ò �'U4$9w�˘�7W� =�r�r�{�b�D�aF*UY��׵�i���+��[t���9�e�:�V�ߣ[Ƴ��*���kأXO�{�/O(�{
vFG�XoŪ��)DV��bt��a�;��|ez�	fZ�	P���i��6�!�#Y��W��e;��X�-U�0�T����w���D����ir�
�i��	(�Ar�6�.�▾S����r�BZ��n�kh#p1��o�M�����^R��ˊ���~?��^���� ����ק�S�����Λg�} ?'�@��8�,nO�om]L�𵴨,��<��V{1ck,��6c��Zb����\"�v!_�vB����~Ǯ�A��"������B��      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �  x����n�0�g�)n�耤�����6h�-�p�蚭$
���ot(�O��Q�%��@"�����������opgs�Zg��J��d�C��DH���Z��b��(�,���̘��vp|�C[p�O:��5OEb�����H�+�ݤ�j���t߲�W�'�q����-���wΦ5�쀖bJ��#tC�A��S�\-�I\�$u^g�Z��k��`zH��q�f���ƕ�0tf� �-��
a�?�6:[���7O�̻^uq��8�S~zҐ����6��˷	��U;c��+�մqI3��M�oi�_T=U�����p�� �:V�a�5�e�ZwJ�S�7?�Y�E�a%� I9��+x�v	mP�o'A-[	��+�@���X���Ơ4!��2��,;5�0���E��%J^f�96�Ij�&��_��f�*�"�#.o���4[4�~�׻r�_��k!h`�I�h�xZb���%����ͣ����5T6�&+ؐ��mo<6� ���`a���<#"S`���G�~U4�}.�\����o~'&��3s�����N��`P[�2�� ɕ`ۺ�px
q@��B�G��ְoC�u�ɂ�ĥ���${o�>"��if|���.�MeO�W���{l�%+n8� <�.�      �      x������ � �      �   �   x�m�K� ��0U��/�tcI-%a���hӰ��y�Ovhfr0�h]<�L�	ކ�D�]��'_�#hv1w�⭴C�'[���Bϐ$a �5z٨�Hi�X�0ҋ�|�����\@�<��P���o3?����ԥ�šy�;W�o����R��Jh�      �   �  x���ے�0���)��Jw�>�V�R�Nv���f�~C�xʨ{C��}� �i�lp~XB��ލζ+$��	G|�A���"��wB׸��~l�q�>4��|CX ��YIW��\�D��RS�$�,A��}4�Mh:��;��غ.0d� ���zfD�������Z�7��1�����,q�2|���D�JD���L��:k��>]m�H5K�WW�1���Mg�\����^es�ju#)�@n�hl;6��}��և��[g0U�A����\�s��t�
Ed��a�9�|�k|Q��\$=����w?��צ��g���3vCw��8٭-�(�r-�ߐ�����X�D7$uf�y߶S�-M��*�4� o �Νz<�?H��@uR�m<�����oLo�2���$����Əg���X�T+$Yp��C:7��-��~�����_%�`x�=�̢G�4�K��>�(@��3Ča�����\)-�]�43�%���8�Hc��Bj�T�R,KY��X����$�VfN[����3�Խ���2�0�5݄�����ݗ6t�1J��'��8U�Σ<G�
�Rz�I�.G��$SB����rD탟/a���r���SԘC�_�=Y�TDP�0hnh�˨v.�T��c`9�a5��d��DE��-CH��$�{5hM�a�S��w}S?�� G%D�nJ��;�k��s<]�M7�r��1cXBg�����Ǐ'J� ~���fK������?@�      �     x���׎�Hք�w��_@Bz2y'o(�%,P�����J5��������W�"�ĉ���є�m���Js�_)��$��F���,��/��������`A��Q,Pr�W�x4B�ݖYyo�6bm$	Ql�5�Q���@���HK��EB �^�?"3�e�i��B7�@������- �@�'�	��N�_f�x�ɁnL��<d�]tW�Q|�^�$�J%"�9D�� yBC��6I!�,�J��-�̸pu=x�H�v*G�m����U�A�{��K�܆�b�����3�yA��~"���;�¡|�y�O�[/Ѭ�J�#Г�I�`��f=�@&!.ԇ"��<��qI��~�	e�*�������$-tŉC�Ėǰt{N:qnH	���ft���b�Z��ߠIw䰏)�:�s//��T-۪�8����ҋ�tSx�l~}�N�2�@�δ��i�AG=��'I�d\o
gI�Fj1?�H>GZ<6F��	/c�~��_�@5�0�(�
���M�+/2���bJ����i��o���{�������Zݤ�z��X�C2]���?0G�-��p��m6��l;X�
��%$HP�3.Q|��Z�F��:������i(#����?��r,-��(�(3|��v�5vq�����F��1BA^�����O~E�	Jh0���n�D�&�
��I5ôHa����ŷ>�/�˦�����տ�Ze�hå�`&;+5����1�5���/�$�$��S����#F����ϭ���q�a�LͿ	Z�JiL��"�U�a����>?߸g�����ֺ���8]�/�O�J���8d/K��kh�D/#��,�S�������=���ܔ�Ǆ��x��le�K���c�Ma\�z�̩vE'�L~8.�n�h_*
/hU��$ĥ�Y+DY�jg���@ˍ������Z�����-$W�e�:T�}�*;{�o��f�����t�cq_�n���i�ϠOC��>�������R��N�jOí���x4�d)��}��<�T��ƻ�t���ki������QS�ݔ���L�����ݧ% }B���3't-S�ܤ���FD����HE1�*㭏��oR�.���2��Z0��<�˩į��tX�N?�-{��.���E�:	�-�����Ϧr�%3���X� �C�(5`��X�J�@�6�*��RO�[��[��6��~[[��_�8fj3ꁟݏK��?��1�f������ة�t$^�3�ʽ�s�Q"+;���n��<�C�z�>��{��5���US�b��EU�a�0W+��{�G�1����B�:�j}�j��Yy곷�N4vDK��:^��"�&"���g_��,Qև\`��y똄MV'���0"���Vk;DU߫|{�����R;��Y��1/��;�r�����&�&�gÏ�$����y�+,�G]Ԃ�X!�,�z�ݤe���jd�z��l���M��I�|��eVh�5}ի�y���Bk���nl���d�L���݃���Y�^c�j���K�
g�f9E9�C�U��7A�]��v�����>���l��6>~�Q.7bz�\Jכ8�����	�3H�������#AU����:늣ih��=�U�����׌���T��Fv��/����!�V����x7{us�C���#ܿ�\��E%
�a�Y�=Z׉<����5�Q]hBN�j!~;(�\��b�Iq�H�G�����yK�p��ź��{�_��͆ks�6�?E)y�G��E�"$����R��N*���V��Q%`�w�K@����h��Tlp�O>dcp���tynG�N]��DN,`.���=sv[�kT���|u�9J�S�
))���fD�PY�H�."�g�~\�X��挦�>�3�3"�����L��Zu����z�j;9,�0�7M���1��֗�]�ϫ`C��}d�("q(
���D�"V(��xF��"���l^���/�am�tm�	������q��m�L�f�X�G�;>������}B �����k�f��4K����	 3�֏H�=&�anHsS���� �-�ћc���6�� �3q��o=s����/h����gL��5�.PPF*��@	��7��2b�VP����EʻN���c릷���z��J�m~�So��SM_�@�|�~�)y�m*�ϋ��]Aws?�1h�,�I��	��Xa�����߬�? ^�ڟS�.%F���V�-}}�1T����O��&
/o�)�I!���?ܹ�����|�h};�5*<"�$��yMS�8,*�~q�c��J��nދ��HX~���r<n��M��:ow�=��5��� ���>@��
���*�D�+�kd��J$8iD(�����n�i�Oqo����,uV�1�3`��G�i�Ƕ���;�(a�)M�gE*2V�n����~K��c,�1��Qh�����|���
���h����{8�?y��z�t=�'?]��>�`\��34\_���:��(Om%�¹X2j���G��h�Iyc��\ps;q�[�P�p����"��g�N9�`�L_R��m��"}$ ��2E$bP�B�U���kZ�g��j]����_A�[��Ǹ�=>���n�G�Nn�.��Q3O�=��ֽ�t�W�f}�8%��QTbV�n�I��V�6����V�}�J��?��&�6�8x��=tnj���á��}C�s�����.���h��D��n ���Is#o�$t=V/OK�o�:f��c���5�)�.�mh�T�:��b�qWs4��� �#���;��&v�F�o��k>��ǿ�����o      �   �  x�Ś�n�F���S�s�bwf?yK�(��FR=�BSt�VR�o�K/}�"�!H�<�^����%�؍�YroB̏�3��H�	��ey��tY\�t��G���b){^���G,��t���oʔ�e��O'�Ⲝ� �X�� D�:�{��dy"AO�L^��.Y���~���#@��)�eE�:_�����E�,�G��N����mim�\:�h'�d�L�m��ʡ�&ڶ:���F��m����鼃m˽42�7��i�^�?.�S�c��?���_��e�b�1�ٛt���Ԃ�t~:�WY^�H@r���&���POi=���<`| �VP|���A�A@"���ؘ����O
ĝ'�0��J[S�BC����w��"�֟����βt��@&K���l�Y-�!s�n���e1/�E:{[~�dY��( �弜������L\'�� �#�{�7�
5�����N��U��*�d�c 	�D{.�I��l�t�s���Qu	�N��e�>P{c��b���N�v:���Ü�����,�5;�<=��!ϕ1��RSb��'WU^�%A������"R����H�������׈��A�8���I�-���OA`.j�mWIi��vqPB@OB�v�����13�qk�1"��kǵQHU�E���[TTs��sFAQ�����D*nAy�559�nH�l�*B�L�:�,J�h�i�Ί��;�s���=hMU���оϊ��j���!]�ݘ�+�Z���?�	�Nj<ؘ$Zv���g���sV��pU�1&v7=���,e�U9]Qz�r�s��DHc7�y1��Kٳ����xN]M���n�SJ���S6��u>O�M��H��
���D��f�*�	ի<+���)E�-�>�LO��iJw��S���f�쳢��s���S=��*�i�^ZdE�U�Q4�VR�Z�@���S+�P��E��o�a��58�l��x��G'��.g�F$� iFy��x����װ�<˫[���1\��w��xZ.ޭ(\)�ս�,Dk|ꑊ=�\a؎���ӣ��k�Є���Q�M�N�|�B�]	�&�z4��ɉC�wSw��%�xD,&ӣ/�e܎�ƿ��"�s@rD����ei�龁�5m�$8�o��t�$ܫ�k�w-<�����5���^��P?�iCZ#L�{�=�����S�\	kT�i���a���c:��H'�U����爿�!�ހZ&m	���E��v��������t��Q6ʔ=����B��	[Ӝ�9��}�-7�H٥baZ�c�,���la��G�s���G��ڒ��r\�T4�zƒ�&�����(���-H��l�In�ţ�]���6����JR"<^�����Qx�l���f��6��6h���ƌ���)��k�{ù�Ң��/��x�OSh�SU�����v�#�HŦ��3M�SI��Z;�0AʓV�����{�2�ǂ�Q_|�2������� E��;�,�+r�;�-T�6�@,A�0�7�J����ȃF�a	3`=ħO�#p��F�	'ǔ�w�G����-Fs��G��1`�sZ\$m1��������XZѽ��`GIވ�Z�]�qZw��b܋��G��R��������0�C;��t��|�.����$�Z'�(՜��9�ދC~ �T��kܒ8G~�Ω�UU(��s�۹�z���.h�S��������_      �   �   x�m�ɕ� ��h=��e�c��`_�_��!<2#���|Q�Z�%;�a��
8����F�
�,!�OnE�2h*��7�sI?�k�<�2e��~��/"]U!��>9/�Ffv�K~"�wOVb��O�	ɺ_�[�3�E���{�:Տ)�H���
!q����6�ݔb
�1���j����ɻS�&[]�J�]/��=�D�_���j�HoA���W�?��/�s~#UuX      �      x������ � �      �   k   x�]���0�3�ҊO>e�����ķ��'�/���IX�����a�"���=5�iB�����:H�t���u�K�+��~j�4RG�&��Md��m���V�z�<�      �   �  x���[��0���+�����@[J��zvv<��1�l��"*E~��ffwݡ��5m����`0�Bee2�,w��8@�?�[�l���H��P3`� ��� CL�0�z�"�$ĤLC�c\�$ٕ��%�	�Ơ���k������p%1e9�W�B����-���i�Ǟ�|7���C����d�#,{}�ҧӡe��������U�ȃT2@��[fBK����Z`9J�`{���Q��U�P�T�f�Z.���	U ^ ^�$(���D���t!�Y��Rs2�@�p�~_�X�f{]���o���қ��1�_���fq?9��f���:�6�z�nFt��Bm�xm�U�0�YǷ>"��ex��u�F@`z�~���GYd�i�T#c~ѧ�su	��4saC��z�/Hp�i׭�Q4��c%ǭ�z��;�4���}4$�*�ɒ��i�Fmu�N����hFsf[�΋cl�j+�F^�q��$�J����ɱ��:�D�����`r(�/�!s���>q��>y�pT͉Y����ڻe;��6_�%Q-R�Ѱ�������ы^~�]�_�����,�O�U�֌pr�{��\_w��B���"j�1D���g}|�F]��G�z[�Za"G,}龍���㤗�:��fM*&Ҝ?� ����M��l_�L&��&P!     