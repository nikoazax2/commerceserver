PGDMP       +                |         	   publicite    16.1    16.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    41140 	   publicite    DATABASE     |   CREATE DATABASE publicite WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_France.1252';
    DROP DATABASE publicite;
                postgres    false            �            1259    41184    contenu    TABLE     �  CREATE TABLE public.contenu (
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
    DROP TABLE public.contenu;
       public         heap    postgres    false            �          0    41184    contenu 
   TABLE DATA           �   COPY public.contenu (uuid, name, valeur, type, description, contenu, page, "order", photo, removable, image, espacement) FROM stdin;
    public          postgres    false    220   �       n           2606    41192 &   contenu PK_ef008cb9a9e5b44cce93f8efd4c 
   CONSTRAINT     h   ALTER TABLE ONLY public.contenu
    ADD CONSTRAINT "PK_ef008cb9a9e5b44cce93f8efd4c" PRIMARY KEY (uuid);
 R   ALTER TABLE ONLY public.contenu DROP CONSTRAINT "PK_ef008cb9a9e5b44cce93f8efd4c";
       public            postgres    false    220            �      x��W�nܸ�V�B��2cR�Dr�u�5����)�b����ՈS�8v��O�9�b=�f����8H�����w(QcS)� �r912gDy�47L'?�ցS����wЧ�~�S� ]�b2��F,����릇�������t�TQ��?~��gPX�&�hh�YGt�
R��̹���2y��}z��M2�C����x}rVw6��J��]�����`H_vC���{Vc_�s�i��v��tК~����������Ӵ}{�j�݇v��^v�v,���:沯�e�U���4���I�|�������a=6������_��&�)���\����E;Ͽk�|�V��Ӧ����Z�}�� ���훙w���z�7{`d��V�
�%F�s���lRݘq���G��%
��_���sR�uV0ܥtsx.K�B�v[����C�W��I���f�W�mXM����l��FW��6t��u��}h�^��`Q�^�u<���:�W㊶��
�~o[w;\���-��/���=����><��! 7l�GW�Aע�yO��뺛ap�ݴ�֡��r���%&��st���S��ޡ���G�l��ݣ��2[8�HiJJ�����+"��+VRN�J��%�A���k�IN�(&�b�?J�jϪ�*	� 3Z�@�@��\i�*[�����1@�����淏����b�F�t��]�-��0ꡃ��?���	Ll����TJ �R0$wA�S�U�ו�~
>�ym%n�9-�6�$�)a*E5�E)�b�����gmX�h�<̬`���>[��qU	KFK�.(Q�b���2�����Xc=�W����aq�k
_�����cĒ�ib�>fCXgz��0a�)`����0��W���3nK%��U&���[�%�� �f���T�ի�ۗ���P���z
����8ۃ��ynr�	��ę�%Q�/Ie���1K�؃R��w�������j7�r�
Qa+����aI󜀆Ҁ�E��@Z)�3I$W�p�1���s����I#�_V���>�ɉ�aX/��&6�
���T�#L��p� ���\?~#��Q��_�Y���//3�s�/X�,_/�ݚ�-�H+��r�뛳W��G��I�������r�����~�B�<�hj����l�������8{�*�����\�?�&���c6��!�������+�l1�X~�fHN�\�/����,q�w�܇�2����n��n�H����J�=o*�O�HN�҅P��y���]V�@�G� ���H,>����M���<��=d�L$��<'�ޑ����7���Z�<S���a#C����SU9�<9c��;����l��y�an?��̷&�c�$Y	�������*)R�?�@r^b�
׹.Q�ʘH�˲P���wM��Y��K�si�*<>	��}�$�k6ܠ�3�`����{�E�M�li,/t�=�M1>�{�����Xj��W�\�>L{�3���O�.�qv�����ׯ_�����y�����'ڶ�|���w�b�����-���B�c�=;Y�4_o�5D��6�=������,�.9Ï�x�1��;���d5��FN&���Z����4�$�.Ot���|��TI���N�*'�3�(�%�3���B?��{����ْ6XO={�Nj��.𣤅I���_wP�'@�A�׉���	RW{���yS��m@�
����}��!��[����ou�f�6_����O�ro��nkm��v�����%�~��7���� *6}��/Ƒ�+��[�蠚�N�\�*/���At��ٳg�Ā�     