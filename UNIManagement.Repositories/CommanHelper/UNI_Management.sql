PGDMP      5                |            UNI_Management    16.3    16.3 N    D           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            E           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            F           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            G           1262    24773    UNI_Management    DATABASE     �   CREATE DATABASE "UNI_Management" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
     DROP DATABASE "UNI_Management";
                postgres    false            �            1259    24774    Business    TABLE     �   CREATE TABLE public."Business" (
    "BusinessID" integer NOT NULL,
    "BusinessName" character varying,
    "BusinessNumber" character varying,
    "Category" character varying
);
    DROP TABLE public."Business";
       public         heap    postgres    false            �            1259    24779    Business_BusinessID_seq    SEQUENCE     �   CREATE SEQUENCE public."Business_BusinessID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."Business_BusinessID_seq";
       public          postgres    false    215            H           0    0    Business_BusinessID_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Business_BusinessID_seq" OWNED BY public."Business"."BusinessID";
          public          postgres    false    216            �            1259    24780    Client    TABLE     �  CREATE TABLE public."Client" (
    "ClientId" integer NOT NULL,
    "Name" character varying NOT NULL,
    "Number" character varying,
    "Email" character varying,
    "BirthDate" timestamp without time zone,
    "Address" character varying,
    "BusinessName" character varying,
    "BusinessNumber" character varying,
    "Category" character varying,
    "RefferenceDetails" character varying,
    "Created" timestamp without time zone,
    "CreatedBy" integer,
    "Modified" timestamp without time zone,
    "ModifiedBy" integer,
    "AdditionInformation" character varying,
    "Description" text,
    "IsDeleted" boolean,
    "IsActive" character varying
);
    DROP TABLE public."Client";
       public         heap    postgres    false            �            1259    24785    Client_ClientId_seq    SEQUENCE     �   CREATE SEQUENCE public."Client_ClientId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Client_ClientId_seq";
       public          postgres    false    217            I           0    0    Client_ClientId_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Client_ClientId_seq" OWNED BY public."Client"."ClientId";
          public          postgres    false    218            �            1259    24786    Domain    TABLE     �  CREATE TABLE public."Domain" (
    "DomainID" integer NOT NULL,
    "DomainName" character varying NOT NULL,
    "URL" character varying,
    "PurchaseDate" timestamp without time zone,
    "RenewDuration" character varying,
    "Platform" character varying,
    "CredentialDetails" character varying,
    "IsWorkshopPurchased" character varying,
    "WorkshopPurchasedDate" timestamp without time zone,
    "WorkshopRenewalDuration" character varying,
    "IsActive" character varying,
    "IsDeleted" boolean,
    "Description" text,
    "CreatedBy" integer,
    "Modified" timestamp without time zone,
    "ModifiedBy" integer,
    "Created" timestamp without time zone,
    "ClientId" integer
);
    DROP TABLE public."Domain";
       public         heap    postgres    false            �            1259    24792    Domain_DomainID_seq    SEQUENCE     ~   CREATE SEQUENCE public."Domain_DomainID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Domain_DomainID_seq";
       public          postgres    false    219            J           0    0    Domain_DomainID_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Domain_DomainID_seq" OWNED BY public."Domain"."DomainID";
          public          postgres    false    220            �            1259    24793    Employee    TABLE     0  CREATE TABLE public."Employee" (
    "EmployeeID" integer NOT NULL,
    "FirstName" character varying NOT NULL,
    "MiddleName" character varying NOT NULL,
    "LastName" character varying NOT NULL,
    "UserName" character varying NOT NULL,
    "Password " character varying NOT NULL,
    "ContactNumber1" character varying,
    "ContactNumber2" character varying,
    "Email " character varying,
    "Address" text,
    "Country" character varying,
    "State" character varying,
    "Birthdate" timestamp without time zone,
    "Education" character varying,
    "Photo" character varying,
    "Joinningdate" timestamp without time zone,
    "IsFresher" character varying,
    "Resume" character varying,
    "Bond" character varying,
    "IsDeleted" boolean,
    "IsActive" character varying NOT NULL,
    "Description" character varying,
    "Created" timestamp without time zone NOT NULL,
    "CreatedBy" integer NOT NULL,
    "Modified" timestamp without time zone,
    "ModifiedBy" integer,
    "EmployeeType" character varying,
    "Gender" character varying
);
    DROP TABLE public."Employee";
       public         heap    postgres    false            �            1259    24798    EmployeeAttachment    TABLE     h  CREATE TABLE public."EmployeeAttachment" (
    "EmployeeAttachmentID" integer NOT NULL,
    "EmployeeID" integer NOT NULL,
    "IsAdhar" boolean,
    "AdharNo" character varying,
    "IsPassbook" boolean,
    "AccountNumber" character varying,
    "BankName" character varying,
    "IFSC" character varying,
    "UPI" character varying,
    "IsDegree" boolean,
    "IsMarksheetUpload" boolean,
    "OtherDocuments" character varying,
    "Description" text,
    "Created" timestamp without time zone,
    "CreatedBy" integer NOT NULL,
    "Modified" timestamp without time zone,
    "ModifiedBy" integer NOT NULL
);
 (   DROP TABLE public."EmployeeAttachment";
       public         heap    postgres    false            �            1259    24803 +   EmployeeAttachment_EmployeeAttachmentID_seq    SEQUENCE     �   CREATE SEQUENCE public."EmployeeAttachment_EmployeeAttachmentID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public."EmployeeAttachment_EmployeeAttachmentID_seq";
       public          postgres    false    222            K           0    0 +   EmployeeAttachment_EmployeeAttachmentID_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."EmployeeAttachment_EmployeeAttachmentID_seq" OWNED BY public."EmployeeAttachment"."EmployeeAttachmentID";
          public          postgres    false    223            �            1259    74702    EmployeeAttendance    TABLE     �  CREATE TABLE public."EmployeeAttendance" (
    "AttendanceId" integer NOT NULL,
    "EmployeeId" integer NOT NULL,
    "Status" smallint,
    "Day" integer,
    "Month" integer,
    "Year" integer,
    "IsHoliday" boolean,
    "Description" character varying,
    "Created" timestamp without time zone NOT NULL,
    "CreatedBy" integer NOT NULL,
    "Modified" timestamp without time zone,
    "ModifiedBy" integer
);
 (   DROP TABLE public."EmployeeAttendance";
       public         heap    postgres    false            �            1259    74701 #   EmployeeAttendance_AttendanceId_seq    SEQUENCE     �   CREATE SEQUENCE public."EmployeeAttendance_AttendanceId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public."EmployeeAttendance_AttendanceId_seq";
       public          postgres    false    234            L           0    0 #   EmployeeAttendance_AttendanceId_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public."EmployeeAttendance_AttendanceId_seq" OWNED BY public."EmployeeAttendance"."AttendanceId";
          public          postgres    false    233            �            1259    66498    EmployeeTask    TABLE     A  CREATE TABLE public."EmployeeTask" (
    "TaskId" integer NOT NULL,
    "TokenNumber" character varying NOT NULL,
    "ProjectId" integer,
    "ClientId" integer,
    "EmployeeId" integer NOT NULL,
    "Document" character varying,
    "TaskAssignDate" timestamp without time zone,
    "DueDate" timestamp without time zone,
    "Status" character varying,
    "Description" character varying,
    "Created" timestamp without time zone NOT NULL,
    "CreatedBy" integer NOT NULL,
    "Modified" timestamp without time zone,
    "ModifiedBy" integer,
    "IsDeleted" boolean
);
 "   DROP TABLE public."EmployeeTask";
       public         heap    postgres    false            �            1259    24804    Employee_EmployeeID_seq    SEQUENCE     �   CREATE SEQUENCE public."Employee_EmployeeID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."Employee_EmployeeID_seq";
       public          postgres    false    221            M           0    0    Employee_EmployeeID_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Employee_EmployeeID_seq" OWNED BY public."Employee"."EmployeeID";
          public          postgres    false    224            �            1259    24860    Notification    TABLE     �  CREATE TABLE public."Notification" (
    "NotificationId" integer NOT NULL,
    "Name" character varying NOT NULL,
    "Date" timestamp without time zone,
    "Document" character varying,
    "Duration" character varying,
    "IsActive" boolean,
    "IsDeleted" boolean,
    "Description" character varying,
    "Created" timestamp without time zone,
    "CreatedBy" integer,
    "Modified" timestamp without time zone,
    "ModifiedBy" integer
);
 "   DROP TABLE public."Notification";
       public         heap    postgres    false            �            1259    24859    Notification_NotificationId_seq    SEQUENCE     �   CREATE SEQUENCE public."Notification_NotificationId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public."Notification_NotificationId_seq";
       public          postgres    false    226            N           0    0    Notification_NotificationId_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public."Notification_NotificationId_seq" OWNED BY public."Notification"."NotificationId";
          public          postgres    false    225            �            1259    25547    Project    TABLE     �  CREATE TABLE public."Project" (
    "ProjectId" integer NOT NULL,
    "ClientId" integer,
    "DomainId" integer,
    "ArrivalDate" timestamp without time zone NOT NULL,
    "CommitmentDate" timestamp without time zone NOT NULL,
    "GitRepo" character varying NOT NULL,
    "AdditionalInformation" character varying NOT NULL,
    "BusinessName" character varying,
    "IsActive" character varying NOT NULL,
    "IsDeleted" boolean,
    "Description" character varying,
    "Created" timestamp without time zone NOT NULL,
    "CreatedBy" integer NOT NULL,
    "Modified" timestamp without time zone,
    "ModifiedBy" integer,
    "Name" character varying
);
    DROP TABLE public."Project";
       public         heap    postgres    false            �            1259    25566    ProjectAttachment    TABLE     �  CREATE TABLE public."ProjectAttachment" (
    "ProjectAttachmentId" integer NOT NULL,
    "ProjectId" integer NOT NULL,
    "Document" character varying NOT NULL,
    "DocDescription" character varying,
    "IsDeleted" boolean,
    "Description" character varying,
    "Created" timestamp without time zone NOT NULL,
    "CreatedBy" integer NOT NULL,
    "Modified" timestamp without time zone,
    "ModifiedBy" integer
);
 '   DROP TABLE public."ProjectAttachment";
       public         heap    postgres    false            �            1259    25565 )   ProjectAttachment_ProjectAttachmentId_seq    SEQUENCE     �   CREATE SEQUENCE public."ProjectAttachment_ProjectAttachmentId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public."ProjectAttachment_ProjectAttachmentId_seq";
       public          postgres    false    230            O           0    0 )   ProjectAttachment_ProjectAttachmentId_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public."ProjectAttachment_ProjectAttachmentId_seq" OWNED BY public."ProjectAttachment"."ProjectAttachmentId";
          public          postgres    false    229            �            1259    25546    Project_ProjectId_seq    SEQUENCE     �   CREATE SEQUENCE public."Project_ProjectId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Project_ProjectId_seq";
       public          postgres    false    228            P           0    0    Project_ProjectId_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Project_ProjectId_seq" OWNED BY public."Project"."ProjectId";
          public          postgres    false    227            �            1259    66497    Task_TaskId_seq    SEQUENCE     �   CREATE SEQUENCE public."Task_TaskId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Task_TaskId_seq";
       public          postgres    false    232            Q           0    0    Task_TaskId_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Task_TaskId_seq" OWNED BY public."EmployeeTask"."TaskId";
          public          postgres    false    231            }           2604    24805    Business BusinessID    DEFAULT     �   ALTER TABLE ONLY public."Business" ALTER COLUMN "BusinessID" SET DEFAULT nextval('public."Business_BusinessID_seq"'::regclass);
 F   ALTER TABLE public."Business" ALTER COLUMN "BusinessID" DROP DEFAULT;
       public          postgres    false    216    215            ~           2604    24806    Client ClientId    DEFAULT     x   ALTER TABLE ONLY public."Client" ALTER COLUMN "ClientId" SET DEFAULT nextval('public."Client_ClientId_seq"'::regclass);
 B   ALTER TABLE public."Client" ALTER COLUMN "ClientId" DROP DEFAULT;
       public          postgres    false    218    217                       2604    25579    Domain DomainID    DEFAULT     x   ALTER TABLE ONLY public."Domain" ALTER COLUMN "DomainID" SET DEFAULT nextval('public."Domain_DomainID_seq"'::regclass);
 B   ALTER TABLE public."Domain" ALTER COLUMN "DomainID" DROP DEFAULT;
       public          postgres    false    220    219            �           2604    24809    Employee EmployeeID    DEFAULT     �   ALTER TABLE ONLY public."Employee" ALTER COLUMN "EmployeeID" SET DEFAULT nextval('public."Employee_EmployeeID_seq"'::regclass);
 F   ALTER TABLE public."Employee" ALTER COLUMN "EmployeeID" DROP DEFAULT;
       public          postgres    false    224    221            �           2604    24810 '   EmployeeAttachment EmployeeAttachmentID    DEFAULT     �   ALTER TABLE ONLY public."EmployeeAttachment" ALTER COLUMN "EmployeeAttachmentID" SET DEFAULT nextval('public."EmployeeAttachment_EmployeeAttachmentID_seq"'::regclass);
 Z   ALTER TABLE public."EmployeeAttachment" ALTER COLUMN "EmployeeAttachmentID" DROP DEFAULT;
       public          postgres    false    223    222            �           2604    74705    EmployeeAttendance AttendanceId    DEFAULT     �   ALTER TABLE ONLY public."EmployeeAttendance" ALTER COLUMN "AttendanceId" SET DEFAULT nextval('public."EmployeeAttendance_AttendanceId_seq"'::regclass);
 R   ALTER TABLE public."EmployeeAttendance" ALTER COLUMN "AttendanceId" DROP DEFAULT;
       public          postgres    false    234    233    234            �           2604    66501    EmployeeTask TaskId    DEFAULT     x   ALTER TABLE ONLY public."EmployeeTask" ALTER COLUMN "TaskId" SET DEFAULT nextval('public."Task_TaskId_seq"'::regclass);
 F   ALTER TABLE public."EmployeeTask" ALTER COLUMN "TaskId" DROP DEFAULT;
       public          postgres    false    231    232    232            �           2604    24863    Notification NotificationId    DEFAULT     �   ALTER TABLE ONLY public."Notification" ALTER COLUMN "NotificationId" SET DEFAULT nextval('public."Notification_NotificationId_seq"'::regclass);
 N   ALTER TABLE public."Notification" ALTER COLUMN "NotificationId" DROP DEFAULT;
       public          postgres    false    225    226    226            �           2604    25550    Project ProjectId    DEFAULT     |   ALTER TABLE ONLY public."Project" ALTER COLUMN "ProjectId" SET DEFAULT nextval('public."Project_ProjectId_seq"'::regclass);
 D   ALTER TABLE public."Project" ALTER COLUMN "ProjectId" DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    25569 %   ProjectAttachment ProjectAttachmentId    DEFAULT     �   ALTER TABLE ONLY public."ProjectAttachment" ALTER COLUMN "ProjectAttachmentId" SET DEFAULT nextval('public."ProjectAttachment_ProjectAttachmentId_seq"'::regclass);
 X   ALTER TABLE public."ProjectAttachment" ALTER COLUMN "ProjectAttachmentId" DROP DEFAULT;
       public          postgres    false    230    229    230            .          0    24774    Business 
   TABLE DATA           `   COPY public."Business" ("BusinessID", "BusinessName", "BusinessNumber", "Category") FROM stdin;
    public          postgres    false    215   �s       0          0    24780    Client 
   TABLE DATA             COPY public."Client" ("ClientId", "Name", "Number", "Email", "BirthDate", "Address", "BusinessName", "BusinessNumber", "Category", "RefferenceDetails", "Created", "CreatedBy", "Modified", "ModifiedBy", "AdditionInformation", "Description", "IsDeleted", "IsActive") FROM stdin;
    public          postgres    false    217   Et       2          0    24786    Domain 
   TABLE DATA           6  COPY public."Domain" ("DomainID", "DomainName", "URL", "PurchaseDate", "RenewDuration", "Platform", "CredentialDetails", "IsWorkshopPurchased", "WorkshopPurchasedDate", "WorkshopRenewalDuration", "IsActive", "IsDeleted", "Description", "CreatedBy", "Modified", "ModifiedBy", "Created", "ClientId") FROM stdin;
    public          postgres    false    219   Mx       4          0    24793    Employee 
   TABLE DATA           �  COPY public."Employee" ("EmployeeID", "FirstName", "MiddleName", "LastName", "UserName", "Password ", "ContactNumber1", "ContactNumber2", "Email ", "Address", "Country", "State", "Birthdate", "Education", "Photo", "Joinningdate", "IsFresher", "Resume", "Bond", "IsDeleted", "IsActive", "Description", "Created", "CreatedBy", "Modified", "ModifiedBy", "EmployeeType", "Gender") FROM stdin;
    public          postgres    false    221   \|       5          0    24798    EmployeeAttachment 
   TABLE DATA             COPY public."EmployeeAttachment" ("EmployeeAttachmentID", "EmployeeID", "IsAdhar", "AdharNo", "IsPassbook", "AccountNumber", "BankName", "IFSC", "UPI", "IsDegree", "IsMarksheetUpload", "OtherDocuments", "Description", "Created", "CreatedBy", "Modified", "ModifiedBy") FROM stdin;
    public          postgres    false    222   ��       A          0    74702    EmployeeAttendance 
   TABLE DATA           �   COPY public."EmployeeAttendance" ("AttendanceId", "EmployeeId", "Status", "Day", "Month", "Year", "IsHoliday", "Description", "Created", "CreatedBy", "Modified", "ModifiedBy") FROM stdin;
    public          postgres    false    234   ��       ?          0    66498    EmployeeTask 
   TABLE DATA           �   COPY public."EmployeeTask" ("TaskId", "TokenNumber", "ProjectId", "ClientId", "EmployeeId", "Document", "TaskAssignDate", "DueDate", "Status", "Description", "Created", "CreatedBy", "Modified", "ModifiedBy", "IsDeleted") FROM stdin;
    public          postgres    false    232   \�       9          0    24860    Notification 
   TABLE DATA           �   COPY public."Notification" ("NotificationId", "Name", "Date", "Document", "Duration", "IsActive", "IsDeleted", "Description", "Created", "CreatedBy", "Modified", "ModifiedBy") FROM stdin;
    public          postgres    false    226   ʅ       ;          0    25547    Project 
   TABLE DATA           �   COPY public."Project" ("ProjectId", "ClientId", "DomainId", "ArrivalDate", "CommitmentDate", "GitRepo", "AdditionalInformation", "BusinessName", "IsActive", "IsDeleted", "Description", "Created", "CreatedBy", "Modified", "ModifiedBy", "Name") FROM stdin;
    public          postgres    false    228   F�       =          0    25566    ProjectAttachment 
   TABLE DATA           �   COPY public."ProjectAttachment" ("ProjectAttachmentId", "ProjectId", "Document", "DocDescription", "IsDeleted", "Description", "Created", "CreatedBy", "Modified", "ModifiedBy") FROM stdin;
    public          postgres    false    230   ��       R           0    0    Business_BusinessID_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Business_BusinessID_seq"', 2, true);
          public          postgres    false    216            S           0    0    Client_ClientId_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Client_ClientId_seq"', 61, true);
          public          postgres    false    218            T           0    0    Domain_DomainID_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Domain_DomainID_seq"', 61, true);
          public          postgres    false    220            U           0    0 +   EmployeeAttachment_EmployeeAttachmentID_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public."EmployeeAttachment_EmployeeAttachmentID_seq"', 76, true);
          public          postgres    false    223            V           0    0 #   EmployeeAttendance_AttendanceId_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public."EmployeeAttendance_AttendanceId_seq"', 43, true);
          public          postgres    false    233            W           0    0    Employee_EmployeeID_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Employee_EmployeeID_seq"', 148, true);
          public          postgres    false    224            X           0    0    Notification_NotificationId_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public."Notification_NotificationId_seq"', 32, true);
          public          postgres    false    225            Y           0    0 )   ProjectAttachment_ProjectAttachmentId_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public."ProjectAttachment_ProjectAttachmentId_seq"', 34, true);
          public          postgres    false    229            Z           0    0    Project_ProjectId_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Project_ProjectId_seq"', 49, true);
          public          postgres    false    227            [           0    0    Task_TaskId_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Task_TaskId_seq"', 33, true);
          public          postgres    false    231            �           2606    24812    Business Business_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Business"
    ADD CONSTRAINT "Business_pkey" PRIMARY KEY ("BusinessID");
 D   ALTER TABLE ONLY public."Business" DROP CONSTRAINT "Business_pkey";
       public            postgres    false    215            �           2606    24814    Client Client_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Client"
    ADD CONSTRAINT "Client_pkey" PRIMARY KEY ("ClientId");
 @   ALTER TABLE ONLY public."Client" DROP CONSTRAINT "Client_pkey";
       public            postgres    false    217            �           2606    25581    Domain Domain_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Domain"
    ADD CONSTRAINT "Domain_pkey" PRIMARY KEY ("DomainID");
 @   ALTER TABLE ONLY public."Domain" DROP CONSTRAINT "Domain_pkey";
       public            postgres    false    219            �           2606    24818 *   EmployeeAttachment EmployeeAttachment_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."EmployeeAttachment"
    ADD CONSTRAINT "EmployeeAttachment_pkey" PRIMARY KEY ("EmployeeAttachmentID");
 X   ALTER TABLE ONLY public."EmployeeAttachment" DROP CONSTRAINT "EmployeeAttachment_pkey";
       public            postgres    false    222            �           2606    74709 *   EmployeeAttendance EmployeeAttendance_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."EmployeeAttendance"
    ADD CONSTRAINT "EmployeeAttendance_pkey" PRIMARY KEY ("AttendanceId");
 X   ALTER TABLE ONLY public."EmployeeAttendance" DROP CONSTRAINT "EmployeeAttendance_pkey";
       public            postgres    false    234            �           2606    24820    Employee Employee_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY ("EmployeeID");
 D   ALTER TABLE ONLY public."Employee" DROP CONSTRAINT "Employee_pkey";
       public            postgres    false    221            �           2606    24867    Notification Notification_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Notification"
    ADD CONSTRAINT "Notification_pkey" PRIMARY KEY ("NotificationId");
 L   ALTER TABLE ONLY public."Notification" DROP CONSTRAINT "Notification_pkey";
       public            postgres    false    226            �           2606    25573 (   ProjectAttachment ProjectAttachment_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public."ProjectAttachment"
    ADD CONSTRAINT "ProjectAttachment_pkey" PRIMARY KEY ("ProjectAttachmentId");
 V   ALTER TABLE ONLY public."ProjectAttachment" DROP CONSTRAINT "ProjectAttachment_pkey";
       public            postgres    false    230            �           2606    25554    Project Project_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_pkey" PRIMARY KEY ("ProjectId");
 B   ALTER TABLE ONLY public."Project" DROP CONSTRAINT "Project_pkey";
       public            postgres    false    228            �           2606    66505    EmployeeTask Task_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."EmployeeTask"
    ADD CONSTRAINT "Task_pkey" PRIMARY KEY ("TaskId");
 D   ALTER TABLE ONLY public."EmployeeTask" DROP CONSTRAINT "Task_pkey";
       public            postgres    false    232            �           2606    24821 4   EmployeeAttachment FK_EmployeeAttachment_to_Employee    FK CONSTRAINT     �   ALTER TABLE ONLY public."EmployeeAttachment"
    ADD CONSTRAINT "FK_EmployeeAttachment_to_Employee" FOREIGN KEY ("EmployeeID") REFERENCES public."Employee"("EmployeeID") NOT VALID;
 b   ALTER TABLE ONLY public."EmployeeAttachment" DROP CONSTRAINT "FK_EmployeeAttachment_to_Employee";
       public          postgres    false    221    4750    222            �           2606    25574 1   ProjectAttachment FK_ProjectAttachment_to_Project    FK CONSTRAINT     �   ALTER TABLE ONLY public."ProjectAttachment"
    ADD CONSTRAINT "FK_ProjectAttachment_to_Project" FOREIGN KEY ("ProjectId") REFERENCES public."Project"("ProjectId");
 _   ALTER TABLE ONLY public."ProjectAttachment" DROP CONSTRAINT "FK_ProjectAttachment_to_Project";
       public          postgres    false    228    230    4756            �           2606    66511     EmployeeTask FK_Task_to_Employee    FK CONSTRAINT     �   ALTER TABLE ONLY public."EmployeeTask"
    ADD CONSTRAINT "FK_Task_to_Employee" FOREIGN KEY ("EmployeeId") REFERENCES public."Employee"("EmployeeID") NOT VALID;
 N   ALTER TABLE ONLY public."EmployeeTask" DROP CONSTRAINT "FK_Task_to_Employee";
       public          postgres    false    232    4750    221            �           2606    66506    EmployeeTask FK_Task_to_Project    FK CONSTRAINT     �   ALTER TABLE ONLY public."EmployeeTask"
    ADD CONSTRAINT "FK_Task_to_Project" FOREIGN KEY ("ProjectId") REFERENCES public."Project"("ProjectId") NOT VALID;
 M   ALTER TABLE ONLY public."EmployeeTask" DROP CONSTRAINT "FK_Task_to_Project";
       public          postgres    false    232    4756    228            .   @   x�3���,,MU��4426153�����2��,���SpO,�ȬL�� �p���p��qqq �T      0   �  x��U�r�H|>�
> �s����r�u��;qe+/Bw�����`@��ESEI���O�9�~dE�t>���/2p�v���h�Z�����W��φNP���v	��!�[-�U9��b	ڸB���b|�-�㨊� �E�/�*��p�A.���q�9�u>�D.Lt��Rޡ���cơD�@�-�H�2OP�sG#�������It&�Ѱ,�*i�?�C<��-�u�];鯳h^a��i�8�������5�c[�����6c١��ƣ�QLJ9�F�qY��&+g���	��YSe;/5����
ٙ�ۊx����Z�b	��Q�،��u�lZ��E[{�7ؚ��^�ڿV9��2�q�!�k(i*J�Q���Pm���5V9#�F����s�t"�s�L�t~|��nQ����$w���a4�Ӥh��	��M(Ð(r3F�%S¢'Lp�/l�h#er��f���yX�E��Y1B�4��"�kj�#[�!H����ת9�UؚcӸ�k��� ?�����W�N��w��6���|̭0���Tܸp3���Y(�c�%���$(�`Oh�X��\�GJI��o���a��):PL�Ν_ئ1F)̻Ǚ����;���|P6�,?�������`0F�+���7���|��4��"��J�ű�s��0I��@^[�Y�R�(�rG�8[�EO�����0\�v�͗]�*]I��)��Z��V�V͕FE̗60�4!�4Sȑ��9V��;�V׎PŮ�R�E!���:�m���awmUi�&�=I���o2��5�f3C(P������8�������o�a=��K��K���CRY���E��~z0U�'�M1W�+�z" �~Ɇ%(#�@�F�:�,����]
�J��0��$��2�]�pH��{�"�>M�HG$�}�[Uv=BqH:?J\��`���a���3CRj$��e]%���uXp���-��i��}��̰z�A��#�h;������� �c�      2   �  x��VKo�6>ӿ�ȡ���&�z�a{)�^Z�"�zٲ�R���H����I� m5C���7C
�����������%���OX"j���5$^c0�<mm���ٸO�~�5�&ۛ�������|�����W���'j܈�	����p�'5�i�Jhdlf�:�Qu�[:��>K�:Mαɒ4�� �c��	���C�GC�&�ħ��И���b%<dM`ە�-	
_��^޸�\p��r�L���d%	�U�N�xj:���a�Q�&���'���(*�hU�=��x��^P��r�8u7e~j⼶U��yU:�!p�|I������$}��p3�'1���G�	G� 媣�b�S-7RCS�'�R�%�ĭ����Lq�	�u���r�\�c���7�'����'�Q�j��Z��=�ן�*������"���|���R$.�<(vq�Ž�wqw~�#!�h=	~ԑ�H�-���;�R��/]b1D�l �sx�_��[BD�s8�$��v��{"�Y�U��Sӭ�;ڶ�`�Uq���?ק����8eR���a�gkn )C��k���-ܫ�<^֞[ʾq��	8�JL�֑\����S�錪|���|	q�l\/���S�.�@^�&���Wp3d،��.tk�f�{c�Kea9��<<]�GdI[B�$�����p��"H;��82|V�݂���!!z�lVHgHJ)�b�m	�}� ��4dT6���cE(2��0��� aQE�SS��vS�M�o7�:;��燬����m�O�*-�»����l7n;�mWp�K�ңu�ہ����/�D�ɮ�+���&�����g��8H�`#�����"���C�E���t=tae^�;��la��R8HQ/��Iofe<H�li��l�K�bPV��/͚;�'f��,��hn���ƀ����_�bFA�s�m�ԘxS-�5�CL9nW�w5Uv4�1 ��A� 5{� ���h�b��W��򝂉���TM�pEBz�=ؘ��{D=:���_��ߑ      4   4  x���Ys�8���_�y�G�-y���;4	�tIHz�Exg1�m���@섭��U�{�r?�s�������1������d�F�x�ѴJ���Z��k�w6~�� �Dr��;6yG�0��2�0��U0��DwfS�{�����<���%2bz	�KH5��i|����~�ow��T;���Wh_�_������ {�o>�/ՐiQl�s*T �l_7��D��<���{�	����ip���P�J�>)��X��;o=��מ5��r�@Qɒ�Ej��/�������І�~o|=��۩<}4��z������_pK]?�'�abaSG�)�3򎛹uY�<�Nf�=��ȿ�=N��uR�i{Z���\���rrs��O���˖�d5��~�{�8�G��9��|9IK,�9�-ja�3" 1@��y��, ��\N���������vn
��cnR���Ik���� �m�F�#q�X�{l-U�e�>m)/��a�i�*�d���:����6����3�S�/�1n���p/J`��$Z�wQ;Q1(�
S��Mf`��z\y��G1��2?��{�2��L�DVǊ+���Q�')��x��Tf�z��������������c"���BT��!\W1�(�(�M���`!?yNG���9p�<�r�'�'�kYҊ����]1��r�`�~֤j�B��Iv�x�८��y��Q��LQEͨ����?8������&5��ĶW6a
(�:#�\��H�yF^�E���2.�T���b��sCEL��qJ���n�_�e���,�)��WT��v)N�a�ƞ��	?�fա�:$H����BA-"���)-Տv��az`�u���}����Tp��B������:Lf�-��M�ٌ�s0\��V��x��F^r�b#R�K_g��	
g�
YW!#��M��[f�����w�M��u{��*`D�vk��2p��_N�/*nv�%��O�Ƿ�C��ڿ�ԟ�EƤ�v_�d���,+�S'sV�����@�a��ȀP��I6�Hy��7Q��_\\�F�      5   �  x��S�n�0</��?�\.⹀۠/E��آh�h�B�kG_�%Ec�!�@aC���\ M
&��H����䔆!�����A�?<�q�2�(ҍ
7�.PE��	�t%�����:�!�����+.���Z��r�Y��	�v��#�m����4�pj�f�0�변��&�=��/1��#���_\�B�C���nvl�h���R��#�ӏ���{��������O�73��f�y쾜v&��BS�6j#-9Ԧj������/F�pe��g�+s�5�,/#mR��y���v{i�ܾ����1/��=5Mَ��L�a�KY�o[e��5���W0nvЦt���c:ʖK��8�����=<t�I�L�Y�f�96J�WM�_�d��E��n�J�D�2�മ��a��$�K��E�J�F�FG5����Q���	E�V�U����K	i�Ƕ����3�cʿ sI�r�jL�/�NV�밸�B�߱�f      A   �  x���ˍ�0D��(&��'� &��?���V��]���=T�,�@ƃ=�  9~���!����Pc+��� �'�'���Qj`j��<�x��o_���%$f�l��tI�bQ�
�bS]kM��e�1Y�tqSo����"8Q�����"�LD7�|��ר7�^-C���p��Vg�e�Uf�Y��v�K]�&\,�n"�,g��g��U���d�Q�l�+H7ݑ*���j�h ��(�0Sl=YZ��+���b����+�dq��`�+�+�x2�9#~Ū�@��4]�Xg��ǀ����x�j�[��[,��5�q4���0�}����,�o���� ��k��9���E.jj~�ӸX��E�\Ck��!O���E�O���z1u��X�dA��ay�ysdn�Ш��T"Be�H��oQ����Qg4~�����2�      ?   ^  x���]K�0���_�+�\='I�&��P�	���d[��+[���IՕ�j���OʀF��>)P��q� G{ؠa�R@S��]N�Y'>U2o_e�ӗ \�������!+�o����2>v{%�9�81B���3J�.w�8�ib)'�H'�i�9Ǥ��0�1�2����`R�y�{D�������ng�M��^����o�7�M���8����j�X&���{T�F�"U(��Q�>��v�$�秊]��rQc���l��]��}v��7
|E�'e F�i3fr�12ݽ��Ⱦ-"Hj,��8���>���[�F��2�*d.���}Z�V�����s�m.�B      9   l  x��T]o1|6���@.�]���FE�VU��>�%/��H	\(��]���'넎�̮gƠ�ϲn�@��J�+�LJ���u�ԡ�eS�g�׽���q4k�*�����| Z��]_��J�2��'�[I�
*��;�ŷ���-'/{N��s���O*��j�t:�B���s�����y�C�	�On�������ל`u!wFJC�ɶ�(�j<l�ߝ*�h�jĲ��:�*T'��?C{{ܱjx�@�f�1J����`��@(���b�ʺe�O�u|$(=��5ZG��J$V�u�Kp���*��Hf��"� 7F�c&JL(��lu`iw!Ux��%��ʃ��) �a"F��}�c���D%����J:��oy�X��g�<-�	2`6��;H 0��Φ��Z��BN}4���C̋W:I��/�1=<��b<��;\���g���y�,L�d�,[��������dc������M��V1�V*#hgk�E��a;�	6=��S�����	܈�����\ԯe���q��_&O��s��s������2�Љ�����Cs�m�R1���`;%�D��n�s}����u ����ܠ*��T�����r�:�;���XcN5�M)�wy����q�/      ;   F  x�}��n�0���S�c�i{��x��nM��o��s��P����Ȓs��M�w>	� �@�v|J�u~2&�,q�%dr���O�N�����aJ.�l�-�+8���6Ē�s�-�L(���@d1#"�kQQ�dDH�c�Ϋ��DD�$��pp m���m��_�ez�g%o���t���1�3�(*�È�k�o]e�<)=�D����-�� �Z����޷�昞n��ܮ����9�U\(��!Ƥ����(N` 1⭨���EfҪ��%�x�O���3��tx��Ʀ�I�з�}�W;�S<@ r9�1���%�:�<����E      =   �   x�}�A�0����)�urۻwN"�%�ꥦ+��f��S�T�����(M���֕�9߷vh*߳�t$��ݱtw�~��ˈ#EN��*I(�@
��`�@B�h��)J���n��U����i�c� ��h��Q��}�y'�[t~���/ ���L��]��JF)}DI&     