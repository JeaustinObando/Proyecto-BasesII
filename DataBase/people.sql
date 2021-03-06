PGDMP                         z            People    12.11    12.11     5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            6           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            7           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            8           1262    24576    People    DATABASE     ?   CREATE DATABASE "People" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Latin America.1252' LC_CTYPE = 'Spanish_Latin America.1252';
    DROP DATABASE "People";
                postgres    false            ?            1259    24629    address    TABLE     }   CREATE TABLE public.address (
    "idUser" integer NOT NULL,
    latitude integer NOT NULL,
    altitude integer NOT NULL
);
    DROP TABLE public.address;
       public         heap    postgres    false            ?            1259    24621    phones    TABLE     X   CREATE TABLE public.phones (
    "idUser" integer NOT NULL,
    number text NOT NULL
);
    DROP TABLE public.phones;
       public         heap    postgres    false            ?            1259    24577    subscriptions    TABLE     ?   CREATE TABLE public.subscriptions (
    "idSubscription" integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    discount real NOT NULL
);
 !   DROP TABLE public.subscriptions;
       public         heap    postgres    false            ?            1259    24585     subscriptions_idSubscription_seq    SEQUENCE     ?   ALTER TABLE public.subscriptions ALTER COLUMN "idSubscription" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."subscriptions_idSubscription_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    202            ?            1259    24587    users    TABLE     x   CREATE TABLE public.users (
    "idUser" interval NOT NULL,
    "userName" text NOT NULL,
    password text NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            ?            1259    24595 	   usersData    TABLE       CREATE TABLE public."usersData" (
    "idUser" integer NOT NULL,
    address integer NOT NULL,
    phones integer NOT NULL,
    "idSubscription" integer NOT NULL,
    "birthday " date NOT NULL,
    joined date NOT NULL,
    name text NOT NULL,
    "lastName" text NOT NULL
);
    DROP TABLE public."usersData";
       public         heap    postgres    false            ?            1259    24603    workStation    TABLE     ?   CREATE TABLE public."workStation" (
    "idWorkStation" integer NOT NULL,
    "nameStation" text NOT NULL,
    description text NOT NULL
);
 !   DROP TABLE public."workStation";
       public         heap    postgres    false            ?            1259    24601    workStation_idWorkStation_seq    SEQUENCE     ?   ALTER TABLE public."workStation" ALTER COLUMN "idWorkStation" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."workStation_idWorkStation_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    207            ?            1259    24613    workers    TABLE     /  CREATE TABLE public.workers (
    "idWorker" integer NOT NULL,
    name text NOT NULL,
    lastname text NOT NULL,
    birthday date NOT NULL,
    "idWorkStation" integer NOT NULL,
    "salary " real NOT NULL,
    "idLocal" integer NOT NULL,
    address integer NOT NULL,
    phones integer NOT NULL
);
    DROP TABLE public.workers;
       public         heap    postgres    false            ?            1259    24611    workers_idWorker_seq    SEQUENCE     ?   ALTER TABLE public.workers ALTER COLUMN "idWorker" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."workers_idWorker_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209            2          0    24629    address 
   TABLE DATA           ?   COPY public.address ("idUser", latitude, altitude) FROM stdin;
    public          postgres    false    211   +"       1          0    24621    phones 
   TABLE DATA           2   COPY public.phones ("idUser", number) FROM stdin;
    public          postgres    false    210   H"       )          0    24577    subscriptions 
   TABLE DATA           V   COPY public.subscriptions ("idSubscription", name, description, discount) FROM stdin;
    public          postgres    false    202   e"       +          0    24587    users 
   TABLE DATA           ?   COPY public.users ("idUser", "userName", password) FROM stdin;
    public          postgres    false    204   ?"       ,          0    24595 	   usersData 
   TABLE DATA           y   COPY public."usersData" ("idUser", address, phones, "idSubscription", "birthday ", joined, name, "lastName") FROM stdin;
    public          postgres    false    205   ?"       .          0    24603    workStation 
   TABLE DATA           T   COPY public."workStation" ("idWorkStation", "nameStation", description) FROM stdin;
    public          postgres    false    207   ?"       0          0    24613    workers 
   TABLE DATA              COPY public.workers ("idWorker", name, lastname, birthday, "idWorkStation", "salary ", "idLocal", address, phones) FROM stdin;
    public          postgres    false    209   ?"       9           0    0     subscriptions_idSubscription_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."subscriptions_idSubscription_seq"', 1, false);
          public          postgres    false    203            :           0    0    workStation_idWorkStation_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."workStation_idWorkStation_seq"', 1, false);
          public          postgres    false    206            ;           0    0    workers_idWorker_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."workers_idWorker_seq"', 1, false);
          public          postgres    false    208            ?
           2606    24584    subscriptions PK_idsubs  
   CONSTRAINT     f   ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT "PK_idsubs " PRIMARY KEY ("idSubscription");
 D   ALTER TABLE ONLY public.subscriptions DROP CONSTRAINT "PK_idsubs ";
       public            postgres    false    202            ?
           2606    24594    users Users_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY ("idUser");
 <   ALTER TABLE ONLY public.users DROP CONSTRAINT "Users_pkey";
       public            postgres    false    204            ?
           2606    24610    workStation workStation_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."workStation"
    ADD CONSTRAINT "workStation_pkey" PRIMARY KEY ("idWorkStation");
 J   ALTER TABLE ONLY public."workStation" DROP CONSTRAINT "workStation_pkey";
       public            postgres    false    207            ?
           2606    24620    workers workers_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.workers
    ADD CONSTRAINT workers_pkey PRIMARY KEY ("idWorker");
 >   ALTER TABLE ONLY public.workers DROP CONSTRAINT workers_pkey;
       public            postgres    false    209            ?
           2606    24637    workers FK_idWorkStation    FK CONSTRAINT     ?   ALTER TABLE ONLY public.workers
    ADD CONSTRAINT "FK_idWorkStation" FOREIGN KEY ("idWorkStation") REFERENCES public."workStation"("idWorkStation") NOT VALID;
 D   ALTER TABLE ONLY public.workers DROP CONSTRAINT "FK_idWorkStation";
       public          postgres    false    209    207    2726            ?
           2606    24632    usersData FK_id_subs    FK CONSTRAINT     ?   ALTER TABLE ONLY public."usersData"
    ADD CONSTRAINT "FK_id_subs" FOREIGN KEY ("idSubscription") REFERENCES public.subscriptions("idSubscription") NOT VALID;
 B   ALTER TABLE ONLY public."usersData" DROP CONSTRAINT "FK_id_subs";
       public          postgres    false    2722    205    202            2      x?????? ? ?      1      x?????? ? ?      )      x?????? ? ?      +      x?????? ? ?      ,      x?????? ? ?      .      x?????? ? ?      0      x?????? ? ?     