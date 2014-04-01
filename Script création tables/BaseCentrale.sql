/*==============================================================*/
/* Nom de SGBD :  ORACLE Version 10g                            */
/* Date de création :  01/04/2014 10:38:54                      */
/*==============================================================*/


alter table HANDYCART.CTP_CATEGORIE_PRODUIT
   drop constraint FK_CTP_FMP_ID;

alter table HANDYCART.FCT_FACTURE
   drop constraint FK_FCT_CLT_ID;

alter table HANDYCART.FCT_PRD_FACTURE_PRODUIT
   drop constraint FK_FCT_PRD_FCT_ID;

alter table HANDYCART.FCT_PRD_FACTURE_PRODUIT
   drop constraint FK_FCT_PRD_PRD_ID;

alter table HANDYCART.LDC_LISTE_DE_COURSE
   drop constraint FK_LDC_CLT_ID;

alter table HANDYCART.LDC_PRD_LISTE_COURSE_PRODUIT
   drop constraint FK_LDC_PRD_LDC_ID;

alter table HANDYCART.LDC_PRD_LISTE_COURSE_PRODUIT
   drop constraint FK_LDC_PRD_PRD_ID;

alter table HANDYCART.PRD_PRODUIT
   drop constraint FK_PRD_CTP_ID;

alter table HANDYCART.PRD_PRODUIT
   drop constraint FK_PRD_MQP_ID;

drop table HANDYCART.CLT_CLIENT cascade constraints;

drop index HANDYCART.FAIT_PARTI_DE_FK;

drop table HANDYCART.CTP_CATEGORIE_PRODUIT cascade constraints;

drop index HANDYCART.FACTURE_FK;

drop table HANDYCART.FCT_FACTURE cascade constraints;

drop index HANDYCART.PORTE2_FK;

drop index HANDYCART.PORTE_FK;

drop table HANDYCART.FCT_PRD_FACTURE_PRODUIT cascade constraints;

drop table HANDYCART.FMP_FAMILLE_PRODUIT cascade constraints;

drop index HANDYCART.CREE_FK;

drop table HANDYCART.LDC_LISTE_DE_COURSE cascade constraints;

drop index HANDYCART.CONTIENT2_FK;

drop index HANDYCART.CONTIENT_FK;

drop table HANDYCART.LDC_PRD_LISTE_COURSE_PRODUIT cascade constraints;

drop table HANDYCART.MQP_MARQUE_PRODUIT cascade constraints;

drop index HANDYCART.POSSEDE_FK;

drop index HANDYCART.APPARTIENT_A_FK;

drop table HANDYCART.PRD_PRODUIT cascade constraints;

drop sequence HANDYCART.SEQ_CLT_ID;

drop sequence HANDYCART.SEQ_CTP_ID;

drop sequence HANDYCART.SEQ_FCT_ID;

drop sequence HANDYCART.SEQ_FMP_ID;

drop sequence HANDYCART.SEQ_LDC_ID;

drop sequence HANDYCART.SEQ_MQP_ID;

drop sequence HANDYCART.SEQ_PRD_ID;

create sequence HANDYCART.SEQ_CLT_ID
increment by 1
start with 0
 maxvalue 9999999999999999999
 minvalue 0;

create sequence HANDYCART.SEQ_CTP_ID
increment by 1
start with 0
 maxvalue 9999999999999999999
 minvalue 0;

create sequence HANDYCART.SEQ_FCT_ID
increment by 1
start with 0
 maxvalue 9999999999999999999
 minvalue 0;

create sequence HANDYCART.SEQ_FMP_ID
increment by 1
start with 0
 maxvalue 9999999999999999999
 minvalue 0;

create sequence HANDYCART.SEQ_LDC_ID
increment by 1
start with 0
 maxvalue 9999999999999999999
 minvalue 0;

create sequence HANDYCART.SEQ_MQP_ID
increment by 1
start with 0
 maxvalue 9999999999999999999
 minvalue 0;

create sequence HANDYCART.SEQ_PRD_ID
increment by 1
start with 0
 maxvalue 9999999999999999999
 minvalue 0;

/*==============================================================*/
/* Table : CLT_CLIENT                                           */
/*==============================================================*/
create table HANDYCART.CLT_CLIENT  (
   CLT_ID               INTEGER                         not null,
   CLT_NOM              VARCHAR2(100 CHAR)              not null,
   CLT_PRENOM           VARCHAR2(100 CHAR)              not null,
   CLT_DATE_DE_NAISSANCE DATE,
   CLT_ADRESSE_EMAIL    VARCHAR2(100 CHAR)              not null,
   CLT_TELEPHONE        VARCHAR2(100 CHAR),
   CLT_ADRESSE          VARCHAR2(100 CHAR),
   CLT_VILLE            VARCHAR2(100 CHAR),
   CLT_CODE_POSTAL      VARCHAR2(100 CHAR),
   CLT_CODE_BARRE       VARCHAR2(100 CHAR)              not null,
   CLT_MOT_DE_PASSE     VARCHAR2(100 CHAR)              not null,
   constraint PK_CLT_CLIENT primary key (CLT_ID),
   constraint UQ_CLT_CODE_BARRE unique (CLT_CODE_BARRE),
   constraint UQ_CLT_ADRESSE_EMAIL unique (CLT_ADRESSE_EMAIL)
);

comment on column HANDYCART.CLT_CLIENT.CLT_ID is
'ID';

comment on column HANDYCART.CLT_CLIENT.CLT_NOM is
'Nom';

comment on column HANDYCART.CLT_CLIENT.CLT_PRENOM is
'Prénom';

comment on column HANDYCART.CLT_CLIENT.CLT_DATE_DE_NAISSANCE is
'Date de naissance';

comment on column HANDYCART.CLT_CLIENT.CLT_ADRESSE_EMAIL is
'Adresse email';

comment on column HANDYCART.CLT_CLIENT.CLT_TELEPHONE is
'Téléphone';

comment on column HANDYCART.CLT_CLIENT.CLT_ADRESSE is
'Adresse';

comment on column HANDYCART.CLT_CLIENT.CLT_VILLE is
'Ville';

comment on column HANDYCART.CLT_CLIENT.CLT_CODE_POSTAL is
'Code postal';

comment on column HANDYCART.CLT_CLIENT.CLT_CODE_BARRE is
'Code barre';

comment on column HANDYCART.CLT_CLIENT.CLT_MOT_DE_PASSE is
'Mot de passe';

/*==============================================================*/
/* Table : CTP_CATEGORIE_PRODUIT                                */
/*==============================================================*/
create table HANDYCART.CTP_CATEGORIE_PRODUIT  (
   CTP_ID               INTEGER                         not null,
   FMP_ID               INTEGER                         not null,
   CTP_LIBELLE          VARCHAR2(100 CHAR)              not null,
   CTP_COORDONNEE_X     INTEGER                         not null,
   CTP_COORDONNE_Y      INTEGER                         not null,
   DATE_MAJ             DATE                            not null,
   constraint PK_CTP_CATEGORIE_PRODUIT primary key (CTP_ID),
   constraint UQ_CTP_LIBELLE unique (CTP_LIBELLE)
);

comment on column HANDYCART.CTP_CATEGORIE_PRODUIT.CTP_ID is
'ID';

comment on column HANDYCART.CTP_CATEGORIE_PRODUIT.FMP_ID is
'ID FMP';

comment on column HANDYCART.CTP_CATEGORIE_PRODUIT.CTP_LIBELLE is
'Libellé';

comment on column HANDYCART.CTP_CATEGORIE_PRODUIT.CTP_COORDONNEE_X is
'Coordonnée X';

comment on column HANDYCART.CTP_CATEGORIE_PRODUIT.CTP_COORDONNE_Y is
'Coordonnée Y';

comment on column HANDYCART.CTP_CATEGORIE_PRODUIT.DATE_MAJ is
'Date mise à jour';

/*==============================================================*/
/* Index : FAIT_PARTI_DE_FK                                     */
/*==============================================================*/
create index HANDYCART.FAIT_PARTI_DE_FK on HANDYCART.CTP_CATEGORIE_PRODUIT (
   FMP_ID ASC
);

/*==============================================================*/
/* Table : FCT_FACTURE                                          */
/*==============================================================*/
create table HANDYCART.FCT_FACTURE  (
   FCT_ID               INTEGER                         not null,
   CLT_ID               INTEGER                         not null,
   FCT_DATE             DATE                            not null,
   PRD_PRIX             FLOAT                           not null,
   constraint PK_FCT_FACTURE primary key (FCT_ID)
);

comment on column HANDYCART.FCT_FACTURE.FCT_ID is
'ID';

comment on column HANDYCART.FCT_FACTURE.CLT_ID is
'ID CLT';

comment on column HANDYCART.FCT_FACTURE.FCT_DATE is
'Date';

comment on column HANDYCART.FCT_FACTURE.PRD_PRIX is
'Prix';

/*==============================================================*/
/* Index : FACTURE_FK                                           */
/*==============================================================*/
create index HANDYCART.FACTURE_FK on HANDYCART.FCT_FACTURE (
   CLT_ID ASC
);

/*==============================================================*/
/* Table : FCT_PRD_FACTURE_PRODUIT                              */
/*==============================================================*/
create table HANDYCART.FCT_PRD_FACTURE_PRODUIT  (
   FCT_ID               INTEGER                         not null,
   PRD_ID               INTEGER                         not null,
   FCT_PRD_QUANTITE     INTEGER                         not null,
   FCT_PRD_REMISE       FLOAT,
   constraint PK_FCT_PRD_FACTURE_PRODUIT primary key (FCT_ID, PRD_ID)
);

comment on column HANDYCART.FCT_PRD_FACTURE_PRODUIT.FCT_ID is
'ID FCT';

comment on column HANDYCART.FCT_PRD_FACTURE_PRODUIT.PRD_ID is
'ID PRD';

comment on column HANDYCART.FCT_PRD_FACTURE_PRODUIT.FCT_PRD_QUANTITE is
'Quantité';

comment on column HANDYCART.FCT_PRD_FACTURE_PRODUIT.FCT_PRD_REMISE is
'Remise';

/*==============================================================*/
/* Index : PORTE_FK                                             */
/*==============================================================*/
create index HANDYCART.PORTE_FK on HANDYCART.FCT_PRD_FACTURE_PRODUIT (
   FCT_ID ASC
);

/*==============================================================*/
/* Index : PORTE2_FK                                            */
/*==============================================================*/
create index HANDYCART.PORTE2_FK on HANDYCART.FCT_PRD_FACTURE_PRODUIT (
   PRD_ID ASC
);

/*==============================================================*/
/* Table : FMP_FAMILLE_PRODUIT                                  */
/*==============================================================*/
create table HANDYCART.FMP_FAMILLE_PRODUIT  (
   FMP_ID               INTEGER                         not null,
   FMP_LIBELLE          VARCHAR2(100 CHAR)              not null,
   DATE_MAJ             DATE                            not null,
   constraint PK_FMP_FAMILLE_PRODUIT primary key (FMP_ID),
   constraint UQ_FMP_LIBELLE unique (FMP_LIBELLE)
);

comment on column HANDYCART.FMP_FAMILLE_PRODUIT.FMP_ID is
'ID';

comment on column HANDYCART.FMP_FAMILLE_PRODUIT.FMP_LIBELLE is
'Libellé';

comment on column HANDYCART.FMP_FAMILLE_PRODUIT.DATE_MAJ is
'Date mise à jour';

/*==============================================================*/
/* Table : LDC_LISTE_DE_COURSE                                  */
/*==============================================================*/
create table HANDYCART.LDC_LISTE_DE_COURSE  (
   LDC_ID               INTEGER                         not null,
   CLT_ID               INTEGER                         not null,
   LDC_LIBELLE          VARCHAR2(100 CHAR)              not null,
   constraint PK_LDC_LISTE_DE_COURSE primary key (LDC_ID),
   constraint UQ_LIBELLE unique (LDC_LIBELLE)
);

comment on column HANDYCART.LDC_LISTE_DE_COURSE.LDC_ID is
'ID';

comment on column HANDYCART.LDC_LISTE_DE_COURSE.CLT_ID is
'ID CLT';

comment on column HANDYCART.LDC_LISTE_DE_COURSE.LDC_LIBELLE is
'Libellé';

/*==============================================================*/
/* Index : CREE_FK                                              */
/*==============================================================*/
create index HANDYCART.CREE_FK on HANDYCART.LDC_LISTE_DE_COURSE (
   CLT_ID ASC
);

/*==============================================================*/
/* Table : LDC_PRD_LISTE_COURSE_PRODUIT                         */
/*==============================================================*/
create table HANDYCART.LDC_PRD_LISTE_COURSE_PRODUIT  (
   LDC_ID               INTEGER                         not null,
   PRD_ID               INTEGER                         not null,
   LCD_PRD_QUANTITE     INTEGER                         not null,
   constraint PK_LDC_PRD_LISTE_COURSE_PRODUI primary key (LDC_ID, PRD_ID)
);

comment on column HANDYCART.LDC_PRD_LISTE_COURSE_PRODUIT.LDC_ID is
'ID LDC';

comment on column HANDYCART.LDC_PRD_LISTE_COURSE_PRODUIT.PRD_ID is
'ID PRD';

comment on column HANDYCART.LDC_PRD_LISTE_COURSE_PRODUIT.LCD_PRD_QUANTITE is
'Quantité';

/*==============================================================*/
/* Index : CONTIENT_FK                                          */
/*==============================================================*/
create index HANDYCART.CONTIENT_FK on HANDYCART.LDC_PRD_LISTE_COURSE_PRODUIT (
   LDC_ID ASC
);

/*==============================================================*/
/* Index : CONTIENT2_FK                                         */
/*==============================================================*/
create index HANDYCART.CONTIENT2_FK on HANDYCART.LDC_PRD_LISTE_COURSE_PRODUIT (
   PRD_ID ASC
);

/*==============================================================*/
/* Table : MQP_MARQUE_PRODUIT                                   */
/*==============================================================*/
create table HANDYCART.MQP_MARQUE_PRODUIT  (
   MQP_ID               INTEGER                         not null,
   MQP_LIBELLE          VARCHAR2(100 CHAR)              not null,
   MQP_DATE_MAJ         DATE                            not null,
   constraint PK_MQP_MARQUE_PRODUIT primary key (MQP_ID),
   constraint UQ_MQP_LIBELLE unique (MQP_LIBELLE)
);

comment on column HANDYCART.MQP_MARQUE_PRODUIT.MQP_ID is
'ID';

comment on column HANDYCART.MQP_MARQUE_PRODUIT.MQP_LIBELLE is
'Libellé';

comment on column HANDYCART.MQP_MARQUE_PRODUIT.MQP_DATE_MAJ is
'Date mise à jour';

/*==============================================================*/
/* Table : PRD_PRODUIT                                          */
/*==============================================================*/
create table HANDYCART.PRD_PRODUIT  (
   PRD_ID               INTEGER                         not null,
   MQP_ID               INTEGER                         not null,
   CTP_ID               INTEGER                         not null,
   PRD_PRIX             FLOAT                           not null,
   PRD_CODE_BARRE       VARCHAR2(100 CHAR)              not null,
   LIBELLE              VARCHAR2(100 CHAR)              not null,
   PRD_DESCRIPTION      VARCHAR2(100 CHAR),
   PRD_IMAGE            BLOB,
   PRD_DATE_MAJ         DATE                            not null,
   constraint PK_PRD_PRODUIT primary key (PRD_ID),
   constraint UQ_PRD_CODE_BARRE unique (PRD_CODE_BARRE)
);

comment on column HANDYCART.PRD_PRODUIT.PRD_ID is
'ID';

comment on column HANDYCART.PRD_PRODUIT.MQP_ID is
'ID MQP';

comment on column HANDYCART.PRD_PRODUIT.CTP_ID is
'ID CTP';

comment on column HANDYCART.PRD_PRODUIT.PRD_PRIX is
'Prix';

comment on column HANDYCART.PRD_PRODUIT.PRD_CODE_BARRE is
'Code barre';

comment on column HANDYCART.PRD_PRODUIT.LIBELLE is
'Libellé';

comment on column HANDYCART.PRD_PRODUIT.PRD_DESCRIPTION is
'Description';

comment on column HANDYCART.PRD_PRODUIT.PRD_IMAGE is
'Image';

comment on column HANDYCART.PRD_PRODUIT.PRD_DATE_MAJ is
'Date mise à jour';

/*==============================================================*/
/* Index : APPARTIENT_A_FK                                      */
/*==============================================================*/
create index HANDYCART.APPARTIENT_A_FK on HANDYCART.PRD_PRODUIT (
   CTP_ID ASC
);

/*==============================================================*/
/* Index : POSSEDE_FK                                           */
/*==============================================================*/
create index HANDYCART.POSSEDE_FK on HANDYCART.PRD_PRODUIT (
   MQP_ID ASC
);

alter table HANDYCART.CTP_CATEGORIE_PRODUIT
   add constraint FK_CTP_FMP_ID foreign key (FMP_ID)
      references HANDYCART.FMP_FAMILLE_PRODUIT (FMP_ID);

alter table HANDYCART.FCT_FACTURE
   add constraint FK_FCT_CLT_ID foreign key (CLT_ID)
      references HANDYCART.CLT_CLIENT (CLT_ID);

alter table HANDYCART.FCT_PRD_FACTURE_PRODUIT
   add constraint FK_FCT_PRD_FCT_ID foreign key (FCT_ID)
      references HANDYCART.FCT_FACTURE (FCT_ID);

alter table HANDYCART.FCT_PRD_FACTURE_PRODUIT
   add constraint FK_FCT_PRD_PRD_ID foreign key (PRD_ID)
      references HANDYCART.PRD_PRODUIT (PRD_ID);

alter table HANDYCART.LDC_LISTE_DE_COURSE
   add constraint FK_LDC_CLT_ID foreign key (CLT_ID)
      references HANDYCART.CLT_CLIENT (CLT_ID);

alter table HANDYCART.LDC_PRD_LISTE_COURSE_PRODUIT
   add constraint FK_LDC_PRD_LDC_ID foreign key (LDC_ID)
      references HANDYCART.LDC_LISTE_DE_COURSE (LDC_ID);

alter table HANDYCART.LDC_PRD_LISTE_COURSE_PRODUIT
   add constraint FK_LDC_PRD_PRD_ID foreign key (PRD_ID)
      references HANDYCART.PRD_PRODUIT (PRD_ID);

alter table HANDYCART.PRD_PRODUIT
   add constraint FK_PRD_CTP_ID foreign key (CTP_ID)
      references HANDYCART.CTP_CATEGORIE_PRODUIT (CTP_ID);

alter table HANDYCART.PRD_PRODUIT
   add constraint FK_PRD_MQP_ID foreign key (MQP_ID)
      references HANDYCART.MQP_MARQUE_PRODUIT (MQP_ID);

