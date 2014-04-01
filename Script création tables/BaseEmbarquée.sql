
/*==============================================================*/
/* Table 			                                            */
/*==============================================================*/
PRAGMA FOREIGN_KEYS=ON;

create table FMP_FAMILLE_PRODUIT  (
   FMP_ID               INTEGER PRIMARY KEY             not null,
   FMP_LIBELLE          TEXT			                not null,
   DATE_MAJ             TEXT                            not null
);

create table CTP_CATEGORIE_PRODUIT  (
   CTP_ID               INTEGER PRIMARY KEY             not null,
   FMP_ID               INTEGER                         not null ,
   CTP_LIBELLE          TEXT			                not null,
   CTP_COORDONNEE_X     INTEGER                         not null,
   CTP_COORDONNE_Y      INTEGER                         not null,
   DATE_MAJ             TEXT                            not null,
   FOREIGN KEY(FMP_ID) REFERENCES FMP_FAMILLE_PRODUIT(FMP_ID)
);

create table MQP_MARQUE_PRODUIT  (
   MQP_ID               INTEGER PRIMARY KEY             not null,
   MQP_LIBELLE          TEXT		                    not null,
   MQP_DATE_MAJ         TEXT                            not null
);

create table PRD_PRODUIT  (
   PRD_ID               INTEGER PRIMARY KEY             not null,
   MQP_ID               INTEGER                         not null,
   CTP_ID               INTEGER                         not null,
   PRD_PRIX             REAL                            not null,
   PRD_CODE_BARRE       TEXT 		  			        not null,
   LIBELLE              TEXT			                not null,
   PRD_DESCRIPTION      TEXT,
   PRD_IMAGE            BLOB,
   PRD_DATE_MAJ         TEXT                            not null,
   FOREIGN KEY(MQP_ID) REFERENCES MQP_MARQUE_PRODUIT(MQP_ID),
   FOREIGN KEY(CTP_ID) REFERENCES CTP_CATEGORIE_PRODUIT(CTP_ID) 
);


/*==============================================================*/
/* Index 			                                            */
/*==============================================================*/
create unique index UQ_FMP_LIBELLE on FMP_FAMILLE_PRODUIT(FMP_LIBELLE);

create unique index UQ_CTP_LIBELLE on CTP_CATEGORIE_PRODUIT(CTP_LIBELLE);

create unique index UQ_MQP_LIBELLE on MQP_MARQUE_PRODUIT(MQP_LIBELLE);

create unique index UQ_PRD_CODE_BARRE on PRD_PRODUIT(PRD_CODE_BARRE); 







