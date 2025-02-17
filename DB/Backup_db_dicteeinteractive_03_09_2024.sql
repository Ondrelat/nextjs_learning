PGDMP  1    &                |            verceldb    16.4    16.4 =    W           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            X           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            Y           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            Z           1262    16389    verceldb    DATABASE     j   CREATE DATABASE verceldb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE verceldb;
                default    false            [           0    0    DATABASE verceldb    ACL     2   GRANT ALL ON DATABASE verceldb TO neon_superuser;
                   default    false    3418                        2615    33332    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                default    false            \           0    0    SCHEMA public    COMMENT         COMMENT ON SCHEMA public IS '';
                   default    false    5            ]           0    0    SCHEMA public    ACL     +   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
                   default    false    5            �            1259    33342    Account    TABLE     F  CREATE TABLE public."Account" (
    id text NOT NULL,
    "userId" text NOT NULL,
    type text NOT NULL,
    provider text NOT NULL,
    "providerAccountId" text NOT NULL,
    refresh_token text,
    access_token text,
    expires_at integer,
    token_type text,
    scope text,
    id_token text,
    session_state text
);
    DROP TABLE public."Account";
       public         heap    default    false    5            �            1259    33349    Session    TABLE     �   CREATE TABLE public."Session" (
    id text NOT NULL,
    "sessionToken" text NOT NULL,
    "userId" text NOT NULL,
    expires timestamp(3) without time zone NOT NULL
);
    DROP TABLE public."Session";
       public         heap    default    false    5            �            1259    33356    User    TABLE     �   CREATE TABLE public."User" (
    id text NOT NULL,
    name text,
    email text,
    "emailVerified" timestamp(3) without time zone,
    image text,
    score text
);
    DROP TABLE public."User";
       public         heap    default    false    5            �            1259    33363    VerificationToken    TABLE     �   CREATE TABLE public."VerificationToken" (
    identifier text NOT NULL,
    token text NOT NULL,
    expires timestamp(3) without time zone NOT NULL
);
 '   DROP TABLE public."VerificationToken";
       public         heap    default    false    5            �            1259    33333    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap    default    false    5            �            1259    33470    description    TABLE     w   CREATE TABLE public.description (
    id text NOT NULL,
    title text,
    "helperId" text,
    text text NOT NULL
);
    DROP TABLE public.description;
       public         heap    default    false    5            �            1259    33417 	   dictation    TABLE     [  CREATE TABLE public.dictation (
    id text NOT NULL,
    text text NOT NULL,
    title text NOT NULL,
    level text NOT NULL,
    audio_url text NOT NULL,
    audio_name text NOT NULL,
    audio_total_part integer,
    audio_duration_minutes integer,
    audio_duration_seconds integer,
    excerpt text,
    image_url character varying(255)
);
    DROP TABLE public.dictation;
       public         heap    default    false    5            �            1259    33424    helper    TABLE     �   CREATE TABLE public.helper (
    id text NOT NULL,
    title text NOT NULL,
    generate_type text NOT NULL,
    number_vote integer NOT NULL
);
    DROP TABLE public.helper;
       public         heap    default    false    5            �            1259    33438    helper_word    TABLE     r   CREATE TABLE public.helper_word (
    id text NOT NULL,
    word_id text NOT NULL,
    helper_id text NOT NULL
);
    DROP TABLE public.helper_word;
       public         heap    default    false    5            �            1259    90113    score    TABLE     �   CREATE TABLE public.score (
    id text NOT NULL,
    user_id text,
    dictation_id text,
    note integer,
    score integer,
    timer character varying(255),
    correct_words integer,
    incorrect_words integer,
    pourcentage double precision
);
    DROP TABLE public.score;
       public         heap    default    false    5            �            1259    90112    score_id_seq    SEQUENCE     �   CREATE SEQUENCE public.score_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.score_id_seq;
       public          default    false    5    226            ^           0    0    score_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.score_id_seq OWNED BY public.score.id;
          public          default    false    225            �            1259    33431    word    TABLE     K   CREATE TABLE public.word (
    id text NOT NULL,
    name text NOT NULL
);
    DROP TABLE public.word;
       public         heap    default    false    5            �           2604    98598    score id    DEFAULT     d   ALTER TABLE ONLY public.score ALTER COLUMN id SET DEFAULT nextval('public.score_id_seq'::regclass);
 7   ALTER TABLE public.score ALTER COLUMN id DROP DEFAULT;
       public          default    false    225    226    226            J          0    33342    Account 
   TABLE DATA           �   COPY public."Account" (id, "userId", type, provider, "providerAccountId", refresh_token, access_token, expires_at, token_type, scope, id_token, session_state) FROM stdin;
    public          default    false    216   5G       K          0    33349    Session 
   TABLE DATA           J   COPY public."Session" (id, "sessionToken", "userId", expires) FROM stdin;
    public          default    false    217   i\       L          0    33356    User 
   TABLE DATA           P   COPY public."User" (id, name, email, "emailVerified", image, score) FROM stdin;
    public          default    false    218   0_       M          0    33363    VerificationToken 
   TABLE DATA           I   COPY public."VerificationToken" (identifier, token, expires) FROM stdin;
    public          default    false    219   �a       I          0    33333    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          default    false    215   �a       R          0    33470    description 
   TABLE DATA           B   COPY public.description (id, title, "helperId", text) FROM stdin;
    public          default    false    224   �g       N          0    33417 	   dictation 
   TABLE DATA           �   COPY public.dictation (id, text, title, level, audio_url, audio_name, audio_total_part, audio_duration_minutes, audio_duration_seconds, excerpt, image_url) FROM stdin;
    public          default    false    220   �j       O          0    33424    helper 
   TABLE DATA           G   COPY public.helper (id, title, generate_type, number_vote) FROM stdin;
    public          default    false    221   {       Q          0    33438    helper_word 
   TABLE DATA           =   COPY public.helper_word (id, word_id, helper_id) FROM stdin;
    public          default    false    223   c{       T          0    90113    score 
   TABLE DATA           {   COPY public.score (id, user_id, dictation_id, note, score, timer, correct_words, incorrect_words, pourcentage) FROM stdin;
    public          default    false    226   ?|       P          0    33431    word 
   TABLE DATA           (   COPY public.word (id, name) FROM stdin;
    public          default    false    222   `�       _           0    0    score_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.score_id_seq', 2, true);
          public          default    false    225            �           2606    33348    Account Account_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Account"
    ADD CONSTRAINT "Account_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Account" DROP CONSTRAINT "Account_pkey";
       public            default    false    216            �           2606    33355    Session Session_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Session" DROP CONSTRAINT "Session_pkey";
       public            default    false    217            �           2606    33362    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            default    false    218            �           2606    33341 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public            default    false    215            �           2606    33476    description description_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.description DROP CONSTRAINT description_pkey;
       public            default    false    224            �           2606    33423    dictation dictation_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.dictation
    ADD CONSTRAINT dictation_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.dictation DROP CONSTRAINT dictation_pkey;
       public            default    false    220            �           2606    33430    helper helper_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.helper
    ADD CONSTRAINT helper_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.helper DROP CONSTRAINT helper_pkey;
       public            default    false    221            �           2606    33444    helper_word helper_word_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.helper_word
    ADD CONSTRAINT helper_word_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.helper_word DROP CONSTRAINT helper_word_pkey;
       public            default    false    223            �           2606    98600    score score_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.score
    ADD CONSTRAINT score_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.score DROP CONSTRAINT score_pkey;
       public            default    false    226            �           2606    33437    word word_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.word
    ADD CONSTRAINT word_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.word DROP CONSTRAINT word_pkey;
       public            default    false    222            �           1259    33368 &   Account_provider_providerAccountId_key    INDEX     ~   CREATE UNIQUE INDEX "Account_provider_providerAccountId_key" ON public."Account" USING btree (provider, "providerAccountId");
 <   DROP INDEX public."Account_provider_providerAccountId_key";
       public            default    false    216    216            �           1259    33369    Session_sessionToken_key    INDEX     a   CREATE UNIQUE INDEX "Session_sessionToken_key" ON public."Session" USING btree ("sessionToken");
 .   DROP INDEX public."Session_sessionToken_key";
       public            default    false    217            �           1259    33370    User_email_key    INDEX     K   CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);
 $   DROP INDEX public."User_email_key";
       public            default    false    218            �           1259    33372 &   VerificationToken_identifier_token_key    INDEX     |   CREATE UNIQUE INDEX "VerificationToken_identifier_token_key" ON public."VerificationToken" USING btree (identifier, token);
 <   DROP INDEX public."VerificationToken_identifier_token_key";
       public            default    false    219    219            �           1259    33371    VerificationToken_token_key    INDEX     e   CREATE UNIQUE INDEX "VerificationToken_token_key" ON public."VerificationToken" USING btree (token);
 1   DROP INDEX public."VerificationToken_token_key";
       public            default    false    219            �           1259    33445    dictation_title_key    INDEX     Q   CREATE UNIQUE INDEX dictation_title_key ON public.dictation USING btree (title);
 '   DROP INDEX public.dictation_title_key;
       public            default    false    220            �           1259    33446    helper_title_key    INDEX     K   CREATE UNIQUE INDEX helper_title_key ON public.helper USING btree (title);
 $   DROP INDEX public.helper_title_key;
       public            default    false    221            �           1259    33447    word_name_key    INDEX     E   CREATE UNIQUE INDEX word_name_key ON public.word USING btree (name);
 !   DROP INDEX public.word_name_key;
       public            default    false    222            �           2606    33373    Account Account_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Account"
    ADD CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public."Account" DROP CONSTRAINT "Account_userId_fkey";
       public          default    false    3233    216    218            �           2606    33378    Session Session_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public."Session" DROP CONSTRAINT "Session_userId_fkey";
       public          default    false    3233    218    217            �           2606    33477 %   description description_helperId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.description
    ADD CONSTRAINT "description_helperId_fkey" FOREIGN KEY ("helperId") REFERENCES public.helper(id) ON UPDATE CASCADE ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public.description DROP CONSTRAINT "description_helperId_fkey";
       public          default    false    3240    224    221            �           2606    33453 &   helper_word helper_word_helper_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.helper_word
    ADD CONSTRAINT helper_word_helper_id_fkey FOREIGN KEY (helper_id) REFERENCES public.helper(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 P   ALTER TABLE ONLY public.helper_word DROP CONSTRAINT helper_word_helper_id_fkey;
       public          default    false    223    3240    221            �           2606    33448 $   helper_word helper_word_word_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.helper_word
    ADD CONSTRAINT helper_word_word_id_fkey FOREIGN KEY (word_id) REFERENCES public.word(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 N   ALTER TABLE ONLY public.helper_word DROP CONSTRAINT helper_word_word_id_fkey;
       public          default    false    222    3244    223            �           2606    90126    score score_dictation_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.score
    ADD CONSTRAINT score_dictation_id_fkey FOREIGN KEY (dictation_id) REFERENCES public.dictation(id);
 G   ALTER TABLE ONLY public.score DROP CONSTRAINT score_dictation_id_fkey;
       public          default    false    3237    226    220            �           2606    90121    score score_user_id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.score
    ADD CONSTRAINT score_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."User"(id);
 B   ALTER TABLE ONLY public.score DROP CONSTRAINT score_user_id_fkey;
       public          default    false    3233    226    218                       826    40961     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     {   ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;
          public          cloud_admin    false    5                       826    40960    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     x   ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;
          public          cloud_admin    false    5            J      x��ג�ƖE�[_1?���7���!����!�	���dwKW���߉yPE�P�i�ʝ����#+� $nˢ�(:���C�9�x��`��z����T|��>o�`B(�(G �I����?�1B�!&��E�W��ʾݺ5�ж�&j���?M�M���X�q��Z�t}��fq-���A��ZE�M��xP#Vf���9E�Y$y5��t�9i5� �:oS��S�<�!�̞=�fiwSd�I턜6p|����m��m��� �ʒז�K:��r��u̥���L��&i�`�������������a���_�������r������>�~ﯲ{��W�(����½����}W�DLK�Tl��a��G����,r+�Q�5����o���4!�4Q��n:W�z�B��������R=+�=`�e^<�,�Gp�!E��G}&Ykz�U��p�Y��fK�dcd�U�@�"�{�.B�4N�5G۴�G�J�T�����@h51R'Ǣ�*�VA4)z&���;e�[eP[aM%m�z�����I[}�l�Μ��'�\�0�j��K�a��͑7���7�H�i+lQŶq�c�Aa��Ył�^��������ƋTb�ݖ�;�@�����!�}]to��a	���A�dL�\��LX�Dw\T;�U{��zS�7�^a����	��a��	�@��3���؎���Y��!����=�]P� HQ�H�=t�#���>
S29q�q����ֻ�������9��&��y*6U&y��X[@h�QRK"��v�P!���b	������6�тM��0ΰsJ9�������� Ej4:Y�`0F���>���9@�"��w��Ik푿��o�GBs��p���XA�n ������A�ƻ�0p�tGe��d�V������DȽ�E����JBz9{zBm�p/��x+O] ��6�	�p��8g)�����k��q�eϓ�>u�z��v|���_���3��%�~p
#r	�M��C���،CO����46l�1�'6��LnV7�L0��@�� �Ӌ֡��t���3��,X�^���FT��p��Dui)����:�Zg��Pj+V�߉[S@�����Ų�HxH6l�~\��sKXy{��*�5a�b���p�b�,�ҕ��]�,0>N;��kI)�I,G��?|���7ޑ��1�ͷT@�J���0F����
�>��A�����u��ǋ������8q׮�P+3i���:��-�=�yR��&���f���u�7X�N.iJ�dϓ��s�3����QW#���|m[���. m	�0�ʎmڝQ����%������`�
�T�σû//˞TM!EnRJ��@�`���S�?N����u*TQ9����i���A�cYTڈ�	������w��Q@���
@%�zVP�֏t2�lAZ�b���4�zm1�mz˯Ya�[-vMw�K�KDNoל3ћ�󿯕�����ZG�˟i�h�@��4J�"���k_�Op����7Ûf�PU&6H���s~,��w�<DmӼ�1�8����(��ړ�݀%u�h�[-g��l��OC8�>ܼ�d�)D�,�5�2��Ӥc������f\�^��~XB�fM$�D״z��3��HA�٦L��N]׬��+��.��N����:�aŲY���Q#������A�$�u�u�ьw�'q/�m���?�ȃ�G߳P����X�Yy�����u�O�ͮgU�T���|�(�:��M^�޸��V�D=��S%;<U���V&�����2(_l��x��M'2Gx)�<3�G�H��X�����R!D��L�4���L����=�ث�����G��	�����/��<����]e仭r}�cO:��[uS��C�و#n���a��t>�m�;�h��x�7��o��?i�;-y�Y��i�7ʥ�e�zI8����O���Ik,>�U��4�)-�.FkOj`��y��yʿ �M5y���k==��Qc��/��F�;�7s7��B ނ&)
�H�i
��f-�<DsKE����n|��E�~��c��`�]�v�}6���T8vy��2�X�L�1��Iޱ�[L�b4S��dؓ84-�LY3KZP��kLf�3�����1{�ˮ�G�	�9 �X������*ua��`���ls������"�0B����]i�-�j`B��o���Rk�WF��뭉臌h�����h>\�B~'B8FfR����ة1���A>�r�0��,�(`������ih���5	�'0� 2qn�XJ��6���HwV�<������s(���ST�Sw
3(��No�	�V	4'S2T_t�ZA��`0�.�Ut��޿�4�s�o�a�:'� ���10$��B�����]��^�]���u�J��p��$�g,�[Df����݋ ���m�A���~jcI���=�J���y@��?��{7�<�,ㆢ��22rk�5|�81��h1�����ʰ�I�G�w_�R78K�n��Oh��Z�O���
� �(�Q_&�KFfN�0\�B���"W��Z�99*��������[j� {q��[�h72M!�WRkݜ�Á�.�7�f����y>^�t?#���2�]�\w���J;�$���l���ѓol$;��e�V�4��%R���#)D9Q=�<p
�Q�@`��!��a�g�8)��.h�5�ux%�����/+J�����B5:뗧y^h�  �bZ����\�qL��W[�d���S�,ߝ��3#�Ĺ��냢�y���^]���卥�iUqɋe��H�l��E�Q6J���v���p����G��8�ȟ��]��=�Q�`�?�<`�c`�`�:��W�a�	����gb��U�@>3�/ ������-�ׅ����a#[R����q
K�._�{���Ri�u�f� �w�!E�!�yt�
j�th������8d8� �����6~��{ݩ����W� �G���"c�x�<�;&�d�����Q��>x�i�u�C<3_�c���@]ʁ��ٗ���v�!7����S����p6{_��]={F�a|{��������95"��ƹ����MF��s\�/	L���\%z:_��iҠ���T����U��k�R=E{
��3���c��z��q-V��%�o���Jl�(A�t}0��o�a�Z��(�n�]:��̩���ť�=:ͺ��
�^�q��Т�=��))s���Z��^S�\?(O�9\<mWT����1�7�a�9z��d�9�C�F���&�^��|oa|�T����tH&��:!�"(
�L�(�Sd}�G�5��<0�Sg73��y�''h�\n���b�'EW��TeZVnʌ:�2�y�\��n{��yZ��	�����R�ؗ�dٝby�w|�'*����^��7��q�����n�m% i�����M����	����[���Y`b�GL;��u͏[B�J��¨�]C�p��������Մ ��B�J��22�^�;x�2~��0w�
6B�4��k՜� �[�^�������,�j�u���=�B���"��_����,�oB��6!@T@�%�a�7�j��Fh�9X6k�G�b�(����-� i��w��:��m�e~s���ek`8=�[�>�K�4�;�];�c�'�J�gV�SD���3zJO��W�U=�m^/����ذi1�U7`���stT)�GQn�_�Y$�>^�^lK<����u�C�������jgZ��b �f���%%��H�D=mO5�/9�7��?��[���=���|>��3p�3�\�~z@�{�.�rlZeƔ��T\����$Q:�,����m3�k����]�d
�Y���eg�PO�����Λ&���Դ�͞x<3m���"���b)�UI�+r4X�4?3`���|Zm§jO�����s$ۆ7ޑG}d2���D�(A`$��$��8I�?c�4���>V���-�   <��)!|8���`�\�����i��"�i���VѼXG8vX&�����B����IC�lnEה��Pr*
놋�'�@{	�׉�����	�vҕy�\1�Z�u2����Qx~��W��Ho�W��u���&d�~`��0p��ۆ��j���J�NGX�@�
��Z��i���k���B:�F�;8�À߽ڄ莆��DuN�e��Ծf@�����@�'`5V��p���
-��7ę��@K!������Xqs���X�Oa���&&;GTWj=�&�&Ǎ�R�/�,�}�j�m|�Α���KOn;\��+<�ո��X3��Yq��v�d���h���_m{c:~z��5;�a�/ʙ��NI��%����n(z��Z��Ta���!/`�z���<�C"־^l�Z���L{VZJC�##�t��҄�z��\��q�Q5b��J.��q��2��־zۓ�'��B2'���Jj��,m�_��^q�W,�zeEq�ǥR��ۀȺ1�6;_���ʺ�~�j�ދxکa�m��Ϗ�!�4�����/��^����ᚅ!�7��doQ8{~�3�� �HdC} �B27�K�OfUO&;���8���Q��ބ(�ji���)c�.��c[��×H��)�<�b�G�-E��p��!&(�D~N�W���@2Ƌ���{=�u�]r��3�z�^�CY|�BǶ�����!T�>��r�_��@�r���G�ݴ^"�:�n��]5�
!�&�R���n�(0��U6w�u��2��+�%����8_a:>S���I�|�n� �{,FM/@���t4�c��Y'��v��I���kT�ETeE�����M�M�d�V����oG�D�R��?���1���BD�r�ꔃ������������D�0�+A�!��=��k
5��Ж�	���P�7A�E&nK"�u�7ns��
^P<����m��%X�28�p���Ф�!��	��	� ���u�A�z�~��� �I�7L�{ҳk������0��]������zR��	��ڟM�7��#^���Wr#c�=j1Zb�Hn֎r��*	E!\�l�8�6z��-/�v眊\1[-�>O�x5��z����������<�(!Stȉ����4V�$��*��ܔa��i]���S�Ռ���5��z��N������N�∾�ȋ�9�D��t�5�û���WN���w�(9����%;����iݢF)�۪�|b2��^Ssc�)��[������|J�~�mI
���IѶsLnX��|ا�V.,��撷ڧ��������m�W      K   �  x���I��:E��*�$Eu^˟�M�tvbg�_�*�7|xd���^����!��' p��u~�tX��.��J;'JJ��(#2��S�]�Əsš��y��~���X�`�@р�WVo�.��
 ��S,����:F��8	֩��Rk���g6U8�O:�҄�r�sYɾ��W趈�T�V��tJ�%���4�Na�](N�� ��N0�>�"T��I!D���to��<�������T��;aT�^-��n��={���q����J9��`j����2��L���/�ܢ�V
����G�r{aXU\c�W��uʠL�h�]K��S�%mt�.��?64<������#T���P?��|�p٩c��	�t\���0��С�)gEV�HR��"�C�0j����rk�ӧ�2��-ʁ� �;�>.N.�&D�c:����I�5Y���VGa�UBgJ1dru��~^�k��X��s���GH�R �=�k��^r���p��t��N欍M^���,	�	�AG�%c��P�-7��4�%����}+�ۚ��f���;��e�D��R�P�Z�6�X]H�\�_����7=�v�0��ij���ۮ|�0vRkETmi[ac������7B�E]�~P�kU^����M(�m.G9��*��M��� �����H�j��K��}�E��mo��~���p�Y�      L   �  x���[��0���*� L�J�
30�.T	%��88vb;1d5���y��t'��C�+�O�d�|GG�"��굼ŭ�w��Y�H� ���aLIÇ�"�i~�R����}��Bd���3�����ÂC(��ۧg��u)���x{L��l?=����[wb� ;�ެN[v ��u9�D=S��{�:�6x��.8�Y	���y(R����_���:���Z(���f���Zg��lֻ������I�vaVj/{��Y�bl�/0��*��~ٿ�-q�������).��,�������7�"/`�����7�N���<���N�Z#q��}W�%�F@��A��/�љ��ͩ� �G�$W�L���=��u��I|���-_;T��wXTE�ơ����L�n,e>�wDO�������2��()nʰy��1�})eV �`�]�ò�x�~��	J�.G!��7���wG��;I��z�������Α���f3Dr	OUv����?�Am�~���L��DJ ��Tk���'����v:�^��i��+�Ѷ��ˮn�Nb���O�br�ei��/7�ւ$1'Y�+/���S��H��ߎ�6���'��᫏,�;��ZM"���֮y��c+��WiN����?ss��      M      x������ � �      I   �  x��VKo�8>;���i�t����94�s�^ =GŎ�䑔���[�I'���e�8��H��U}U�S�_�l�%!�EG�c��D��וK�K.�r2R�\Rq"A�ΛP��ؤ�N9��"-��E[��Rs���L��t[�6JK��B,^!�-�p�<`�njb��}��n� �/��NY�
ɍs�kQRe����YE�w�T�E�"��9�(����l�(��UU
�hd�U�R�s��Da�����DF��;�g�p^��JV�&�:���~�I:�rn%e%xɉRQ�FiB� z<�Be@)�C�)��bDZc�v��#lE����S���{��@�`�^x	<S�����>�S���g" $�\�w��'I��w�'BU2
_����G�O�K���7Qa�z�� ������>?��qKӿ�ǹ+�h���
'VD'˃7�DQ5���^A���(+%��2�"�������P ����FW]4�I��\ߜ�~#�{�Fie���q�O���;�^�
��C�U��@O��a}DʶX���67�ֻ⣩UY ��L� m�Q(�:J�sZS{�  HH$�������)A�?n��vg�ѹ@���iϵׅ{��j� �,�3A���U��d�sC;J����U�h�V�U<�/8e�M�*�9)\P��M�L�Wʓ�Ͻ\�ZD.�<>�k�r\e��<�Ї�P��y`�*5����좴(�R�$A����)\}�&!�Da������h�B��HK��2B�.(��%)?�*��9�i!hX�`brU[(%�L��9�>Ȑ��2�����+�u��D0	���M���k�4#����	��j��RH8R"hwY��i�{�VBU[�
���(���	s_+��򪔨\�4���l2�z��E{�A�p`@������~���q�V�ء�:,C��شX�Գx<��7�3>=�G�c��K��Z�����C?�fd4��oH�"�Cذ{���e1�t`��b��o����8>�Ț�Ev��EV�Sq���8n?~<͸i�,O����u����x�M!	����y��{��w��~������������_��f}%��	��zO�iG7ņ��=�-�[��DH�,���F��5��-[/Q�9b�?{���۲�g�_~o�P2/��~�q�_ɵ>���� %�P��
v�݂K�
��ݲ�}��C�M��c?6�����Iay�������&�	*e�ŋ�9[����&ϴb������y���Sm�_"�C7K��..�-Y��q���{|������O�?s�cb������]�]G�8ic����*�a�Cs�����S3=<�?����_����S��9����}���w;B���C��^A��&�r:lٕڀ�m��ؕ�?�|�-M�������g*|oH�3� �Y��qn�3�������	s)�<�5��l!l��x��*��]_x�V���˝&�v�����f��      R   �  x����n�0���S��˖�C?� @Q��ÀaIo�(2c��dGF�7�[��5�b��MS�h.�R�����/N/Y�4���u�:��c��t>�;'��<�k���xt��I5�XgJ�O������F�~(5w�Ԑ�4��,��	)l�E�Jo��h(�B���V�v�s�E�d42�mL[�Y��4]��$���	Y�K)J�WTU
�v�⻱��x���R1�OP1I:���w�dW����@�Rzlc49��C�Go ɳզ>�����f=���Q���!i����� P����G�K�P+t��^>wzot�dG�i��o�����߷*�"�f��@͑��9(�nP�a�5[#�+��X�;�y��.����zp�vh�Gr�g�ܸ+cp�mzH6B%+�E킡JMT�����W��"���:����Y�k:ǴS�k�(-Bl£���l3T���%#>�Y�\
� ���˸Q׮����6x���)�jE�K�lX?*����t2�f�r�R��AR$�<�c�vR�a[j��_�"��t1�����`�I�g��o���@*,����T�j}9�Z�,�������V5\EiY��5�e��dx�U5Ϫ_Ƚ-ݯ�`Nk�:JP��q�I@���WX�<p�h	��2g��o��)����n@K�oL�^�o���h8��e      N      x��Z˒�]�_ѱ���p�R�H%��Gɉ�8^yv�$FݍР9���@*k��*�T�]���s/��$θ�*��l�/��8�������z�z9�N�媽��mUΞM^�be۾�}Q�"�ں����\�RoƎ�ri��&�&�NG�5�c\^�����i�M2mU�:W��{+g6��xdV�~«ǅmW��]7��i#�o�+X��EH���7��>Ց)K*ȱEikH�D�[�0�%���P�(��[���uOr��-E}1؅	�Q���o�頎&��3(��'&U����u���d:9�N>=2]�Ģ6���-��������n\k'?����4�gg0����m�Y�ϸ̃bO]��5�.*�����N�/��@Q��2:��6c���G쬲�h|��)�6�����.���'h�����&�Ok�꠪ʇƅ���'�Ҡ��Ÿ�ƙD}zh�t����~��D�q-��ٶ��5�E�)FW��#3�۲ǎק��@ƿO��띢��ޮ{Q��&W��	���Nɥ[�G%_�M���ن��)_�{�PXg{��n3���f/�^�%��^܈%9o
[עw�[��Q�o9�+��1��>->әq;���U�" ��8�3v6!V�K��[B�Ϗ�bĭ���~J�f�T������8fe���ܼv{��t&�n�Fv�QM��t�������z�i��D�2�y�`�"��ߌ'�G�ed�t��/��h�|8f;��w���8���5\`�bϝp���.��EE��_<��A�Z�M�z��t��\���O�t�=�ѩ����)/n&��{�n�����/���9)�~>�Z�we�C�EZ���.�9q��ZMӵ�Vw��|R���F춽k���ܰ,|�!�-�v���b��ь"#J�
~�i�_��(t���彀FK����H��RpP5�Y## bЀ�� 1��
]�I�%�6��`�'���	�h�އ�P�)�0���c�^+NO ?�`��
oe*�ֶ�81�#���9|�ᡬ	�XxѾ��#��w�v&�.�~�:|���s+��׮�4����+S"������fwW?Z���f����j}5�����s͇U�D��`�����Ր�3�
�4�|�{G`�M�}���0��|�o��l���(�=@���� KM,��y���C^L��zq &�+� N�xE6�?t���flP@]�$�j��'�~��gJ,�D�fz"�h�d.�뼅�ӓh��;Ȇ�/�L8��ɗ8o �U���:�C�>p� +���������o��vs}0������O_O^2+Qs���,��
�@@�"����?Ex�h��M`�kf]���O*S�|AR22<�"2t�<L�:�&J�P0^DdB�bD�xV $6���Z�ё�i�fJi[�!(H8��'��7��2�bFJX�@#Ezz3q��1U�K�%�p�	$�!��n�Fm��T�I�;�ɪZ� �[�V�7n�!����~m\p���WՔ�2��̯Vݲ�儴k-��C�4T.U�%fF��0t�Z#��!�"¢㢑A�Zb�)m߿�R63܏UAO��d cj2��GB=�QiX��`"���<I{�L�O�<h��x��)L����SN�P��=|`x�Z-!z8	w���A�o�{��Nv+�Bږ���7�Gg
s�]a �e�=pD,z-��cs�G_:=4��lheY9���}82����"��i���2�	�P�4�����������\q���C����AxZ�GSoL�}�Ue�Ƿ~���3]�+Bz=o�7I3J���,��cq��q��XE�53����Y�VT��^�]qa$��8j�H��S�;U�y��He�'?�y�Qs��LP)b`�Ӄ'{��r��%4~����js}��P�:/oo��eh'ߛ�<��9���Ls g$k���kd}�or�T-_�Y��6��:kJ� u�*d"��jd/2�)�Z#CI�&��/6��(�e��O\},�TS��7`�9i!+wy ���3)����4/F�6BR��9IE�A�i�WC=Rg 1��GM�=��V;8��gS��5^}Q��﬚6���f�x�5�e�� ���������N=px��=R��j�)n��ɵD��p��.7'+a�²"�Qy)��X��=)����Ȩ�g�@lC���gH՞kb�w�*ni+�eY8��q�H%K��m��Z'��J E*�J,E�i����(;b
�_��?����}�5���Ѣx�r��#�W_��{h4���fc�!�>[s�|�XC
T����%;(R����qjD
`x��?X�p�J�H�=-�>F(.�$:����c��I� e�Ba�$��wpM�o��~r�-}�� �d�ٛ�Oظ�O^�"��p:��@'&�sEt���	<}���ߪ�={uU�S�7g&ί�INH[e�'�u��m)�9J�i�b&B�����@�!qRg������[JB�4�RYb��K�E���ۣpK��d.{�@]�	��25�w���+8S���8!lr�?��r�4��G'IC59�K�t$��*�7�vO:½�'Ɩ�vK��n��A�Jiݝ�_�G���F��zp� �>UP]j�.͌�sј�y4'H��F��:A��jOlI#�G�����4~��N>KH�-�������޴�ܐ�������ﺒ�������w!	����BW�gN�w+_�-XTv��Dk�tL�*D�Z�����
"��4B*Ƌ�-�k�;��`�۽dy�f� '����o����Ծwf�������N]o��ڎe��t������������4e�����4)�{�٫:w��xx���Aɫ��9��<��)�]+��(��x|r�924y{�ԓ�
0j�[�ufrc7ڱ��{��jx��~6�+��QAv�ZJ;N�F�t"\��l��p#W�N�g����~��^� ���ُ��'*��������<G1(ISb�e���}d7	!��#U�~5�"M\h_�7(~�*��Z�K)Lu�_w:b����quL����'�p����x&�G�d�e�H�E�r�V2[����A2Y��]N��w`N
����T�т�KeiM:v@yC�U�UA~{��.��=�����g�1����o`�k��b�~��mn���P$�$G�Z!CZ&j�Ygr6��m��:7d��(���˸�-R��z�*��r1�B
�r
;�Ƃzi���,���J#6浣\-0U�'��2߇ $��{���ݧ�@�1<m�	l7���u�\����S����������J0'9o�DeB�%�(w+���Zm���$BB<y��ɢӜ��?_�Jf��{�m�C���+E)}	"��#5�5l��U�A��ݧ�4�]���L���NB��/�R��)��0�ʲ�����U�g�A�l��6Nz��$�_z�=6�6���3v��Q��9�z�Br��P����0B����vl\���@Q/�]v����_�������X���OǣT����_%��{�_U􏋫W�%��E\�ƭ���|�:��$�uF;�uJZ��5��Yp^�.Eԁr���1[�*�o��Y�B�C%'�ۘ�.Q�$!Ye�6����,$^>�l�i-���U�f� �:����_���_ ��I�XXTCL�d���xqZ|�0��6�����;Ę��9�����E4!�Kr��k�VA<�V8��2����۳����rq1y�f���d3]�M;�h��W���t����דo��������z�"eS�%��0e)�<��]Y*�X���J���|Q��s�Qj�dR�����u��8^�qVk�B��s�r������'ryfJ<V�z'Ok=R:&	���$��V��f٦X\
^g^�Or�Q�ܭ�D�<�� �?%���+ZB����#�ªMO����SuS����h�Le�~{Q)��KS�9R�Ғ��J%�-���]���(�bH���64`�����@���9�� H   �{�������E��K�ז�������ӊ�|�1��zӃ7s�g?����˧�o���}��� 胧�      O   P   x�K�)M24OL-3000I6�K��K23�.1�tQ�Wp�t��4�J��K��3�KO�,�(*J�tv*v�(����� '�      Q   �   x����� ��㼘�)�҉ R`����Okˣ�<~�w�>5L�d����F��ѷ�C9�v�-r\����
F��#��@�"��i\d����,�8Dj�V�ЎR�I�v�E8�9$?Ta޲-�D�ͽM z�6�Z�RW����e<���E1�3r���&Qx: MⶪU(�.�٤��VY�=�Gh�l˵.�n֌��EQ� F[ˊ      T     x����n�H��;���{�Y����`V��Sx��)�,�m��_�_�S5t�Xs��~�JY4�t3��1Y�"Mi%l�\��&���T>���d�t�ޡ"�᷌��0i�cN��o1A��m�y �Ң�c���p)7*�КI�4s.�Vp/��Bk�S�6��� j2�����j�.�JTy��$�<�̙�R��$`�F��-7�<f7��-��F�Ug�<N	*	���\x�`�y+6��P��b�3��w�<U���q���4������aʒbx�����pC��^&�t�3���q���6]�E�ѽ%һWP�|0���)s���j����.J��	u5z��
R�l~�2ITuD�R�Tˬ���ZC��� �X��O��O�����g�J�"n��� �����1�3N�D�v�c�=��}m�L[�瓲���
zƒ¨�W-+Ăzfs�Պ�������<��:��d�M�6>�ʶ�)����l��q0#��T��<
̗k��U��4�U�FUS�I�C�� �����إʧT��r$��<�H��;��8/I՟`�����T-�By���-�MG�j�������g�8��Xba1�b������f��3̡�hV(�Q/6j�C�ǰ)CeV��陸*�"����[�ށ{����g0�Z��u`�2j�Թ4m�i�O�|��!l��� Kt�{�FG��ř&$ٛ��Ŏ�ƕ� �^����4�a=_�	��'��X�������[�`����ǍR֚=�y)[1N����Nb\c�jjIEu*t�CUG�x6�@{h̚@�O/�CU����&	+Q��v?�ȴ�Gzf�fv��}C��S=�3g8C0�6Rq�SR������*�x�h1���L�L���B�.�ӊ)=�3"1��yg4���bdUR����&�x��&߬���W�K��[�M+AP�(K[w���t�	GP-�k�ޱ8�CW=���He"��������ߌ�}��-xX�)?��w>��.�����EՎ�ʸ
��d�~sF{����q˩�ͦ���0�O[�S�{1/��~��H��%T�W�=�r�S�ᶜ����?�#-yO�����0}��ݘ�3�{����#�W;�&$�k�.�ԙ���/Z:��rn;�Y2t�u�}�ϓ#3�*g�FМ�]�s9@!����ѕ(����iU.��SRd�6��g�fx��K}�<�N��	�ylDS�Q��$g��FX��Q���T�z=�S޹.Aq��z;���\�!�m��0S�j��ktSKV���?�?���������'      P   Z   x�K�)M24OL*4 �d����4���dKN���d$YC��i��iQJ�%�+��H�0�8�������E�$Y`�k��U�������� �$�     