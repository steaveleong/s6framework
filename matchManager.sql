/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     02/03/2017 09:11:02                          */
/*==============================================================*/


drop index FAUTE_FK;

drop index MATCH_PK;

drop table MATCH;

drop index PLAYER2_FK;

drop index PLAYER_FK;

drop index PLAYER_PK;

drop table PLAYER;

drop index TEAMMATCH_FK;

drop index TEAM_PK;

drop table TEAM;

drop index USER_PK;

drop table "USER";

/*==============================================================*/
/* Table: MATCH                                                 */
/*==============================================================*/
create table MATCH (
   IDMATCH              SERIAL               not null,
   IDUSER               INT4                 not null,
   DATEMATCH            DATE                 not null,
   constraint PK_MATCH primary key (IDMATCH)
);

/*==============================================================*/
/* Index: MATCH_PK                                              */
/*==============================================================*/
create unique index MATCH_PK on MATCH (
IDMATCH
);

/*==============================================================*/
/* Index: FAUTE_FK                                              */
/*==============================================================*/
create  index FAUTE_FK on MATCH (
IDUSER
);

/*==============================================================*/
/* Table: PLAYER                                                */
/*==============================================================*/
create table PLAYER (
   IDUSER               INT4                 not null,
   IDTEAM               INT4                 not null,
   constraint PK_PLAYER primary key (IDUSER, IDTEAM)
);

/*==============================================================*/
/* Index: PLAYER_PK                                             */
/*==============================================================*/
create unique index PLAYER_PK on PLAYER (
IDUSER,
IDTEAM
);

/*==============================================================*/
/* Index: PLAYER_FK                                             */
/*==============================================================*/
create  index PLAYER_FK on PLAYER (
IDUSER
);

/*==============================================================*/
/* Index: PLAYER2_FK                                            */
/*==============================================================*/
create  index PLAYER2_FK on PLAYER (
IDTEAM
);

/*==============================================================*/
/* Table: TEAM                                                  */
/*==============================================================*/
create table TEAM (
   IDTEAM               SERIAL               not null,
   IDMATCH              INT4                 not null,
   NAMETEAM             VARCHAR(100)         not null,
   constraint PK_TEAM primary key (IDTEAM)
);

/*==============================================================*/
/* Index: TEAM_PK                                               */
/*==============================================================*/
create unique index TEAM_PK on TEAM (
IDTEAM
);

/*==============================================================*/
/* Index: TEAMMATCH_FK                                          */
/*==============================================================*/
create  index TEAMMATCH_FK on TEAM (
IDMATCH
);

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create table "USER" (
   IDUSER               SERIAL               not null,
   NOMUSER              VARCHAR(100)         not null,
   PRENOMUSER           VARCHAR(100)         not null,
   DDNUSER              DATE                 not null,
   COMMENTAIRE          TEXT                 not null,
   TAILLE               FLOAT4               not null,
   POIDS                NUMERIC              not null,
   POSTE                VARCHAR(50)          not null,
   NAMEACOUNT           VARCHAR(100)         not null,
   PASSWRD              VARCHAR(100)         not null,
   constraint PK_USER primary key (IDUSER)
);

/*==============================================================*/
/* Index: USER_PK                                               */
/*==============================================================*/
create unique index USER_PK on "USER" (
IDUSER
);

alter table MATCH
   add constraint FK_MATCH_FAUTE_USER foreign key (IDUSER)
      references "USER" (IDUSER)
      on delete restrict on update restrict;

alter table PLAYER
   add constraint FK_PLAYER_PLAYER_USER foreign key (IDUSER)
      references "USER" (IDUSER)
      on delete restrict on update restrict;

alter table PLAYER
   add constraint FK_PLAYER_PLAYER2_TEAM foreign key (IDTEAM)
      references TEAM (IDTEAM)
      on delete restrict on update restrict;

alter table TEAM
   add constraint FK_TEAM_TEAMMATCH_MATCH foreign key (IDMATCH)
      references MATCH (IDMATCH)
      on delete restrict on update restrict;

INSERT INTO "USER"(nomuser, prenomuser, ddnuser, commentaire, taille, poids, poste, nameacount, passwrd) VALUES ('miora', 'ntsoa', '06/06/96', 'N/A', 1.75, 65, 'ailier', 'miorantsoa', 'miorantsoa');
INSERT INTO "USER"(nomuser, prenomuser, ddnuser, commentaire, taille, poids, poste, nameacount, passwrd) VALUES ('khoumal', 'henintsoa', '20/12/95', 'N/A', 1.78, 82, 'ailier fort', 'khoumal', 'khoumal');
INSERT INTO "USER"(nomuser, prenomuser, ddnuser, commentaire, taille, poids, poste, nameacount, passwrd) VALUES ('blackhat', 'raoul', '16/04/94', 'N/A', 1.79, 80, 'ailier', 'blackhat', 'blackhat');
INSERT INTO "USER"(nomuser, prenomuser, ddnuser, commentaire, taille, poids, poste, nameacount, passwrd) VALUES ('baliaka', 'irina', '06/06/97', 'N/A', 1.75, 65, 'pivot', 'baliaka', 'baliaka');
INSERT INTO "USER"(nomuser, prenomuser, ddnuser, commentaire, taille, poids, poste, nameacount, passwrd) VALUES ('boazaka', 'tahina', '06/10/96', 'N/A', 1.75, 65, 'ailier', 'bozaka', 'bozaka');

INSERT INTO fault(idplayer, idmatch)VALUES (?, ?);

INSERT INTO match(idmatch, datematch, type) VALUES (1,'12/02/17','amical');

INSERT INTO player(iduser, idteam) VALUES (1, 1);
INSERT INTO player(iduser, idteam) VALUES (2, 1);
INSERT INTO player(iduser, idteam) VALUES (3, 1);
INSERT INTO player(iduser, idteam) VALUES (4, 1);
INSERT INTO player(iduser, idteam) VALUES (5, 1);


INSERT INTO team(nameteam) VALUES ('fivox');
