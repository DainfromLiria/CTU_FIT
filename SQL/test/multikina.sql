--------------------------------------------------------
--  File created - Čtvrtek-duben-19-2012   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ZAM_HISTORIE
--------------------------------------------------------

  CREATE TABLE "ZAM_HISTORIE" 
   (	"ID_HISTORIE" NUMBER(*,0), 
	"ID_ZAM" NUMBER(*,0), 
	"ID_POZICE" VARCHAR2(10 BYTE), 
	"OD" DATE, 
	"DO" DATE, 
	"PLAT" FLOAT(63)
   ) ;
--------------------------------------------------------
--  DDL for Table FILM
--------------------------------------------------------

  CREATE TABLE "FILM" 
   (	"ID_REZISERA" NUMBER(*,0), 
	"ID_FILMU" NUMBER(*,0), 
	"NAZEV" VARCHAR2(200 BYTE), 
	"ROK" NUMBER(*,0), 
	"ZANR" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table FILM_ZANR
--------------------------------------------------------

  CREATE TABLE "FILM_ZANR" 
   (	"ID_FILMU" NUMBER(*,0), 
	"ZANR_KOD" VARCHAR2(15 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table FILM_ZEME
--------------------------------------------------------

  CREATE TABLE "FILM_ZEME" 
   (	"ZEME_KOD" VARCHAR2(5 BYTE), 
	"ID_FILMU" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table HEREC
--------------------------------------------------------

  CREATE TABLE "HEREC" 
   (	"ID_HERCE" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table HRAJE
--------------------------------------------------------

  CREATE TABLE "HRAJE" 
   (	"ROLE" VARCHAR2(30 BYTE), 
	"ID_HERCE" NUMBER(*,0), 
	"ID_FILMU" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table KINO
--------------------------------------------------------

  CREATE TABLE "KINO" 
   (	"ID_KINO" NUMBER(*,0), 
	"NAZEV" VARCHAR2(100 BYTE), 
	"MESTO" VARCHAR2(50 BYTE), 
	"ULICE" VARCHAR2(100 BYTE), 
	"CISLO_POPISNE" NUMBER(*,0), 
	"CISLO_ORIENTACNI" NUMBER(*,0), 
	"PSC" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table OSOBA
--------------------------------------------------------

  CREATE TABLE "OSOBA" 
   (	"ID_OSOBY" NUMBER(*,0), 
	"PLNE_JMENO" VARCHAR2(100 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table PLATOVA_TRIDA
--------------------------------------------------------

  CREATE TABLE "PLATOVA_TRIDA" 
   (	"OZNACENI" VARCHAR2(30 BYTE), 
	"SPODNI_HRANICE" NUMBER(*,0), 
	"HORNI_HRANICE" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table PRAC_POZICE
--------------------------------------------------------

  CREATE TABLE "PRAC_POZICE" 
   (	"ID_POZICE" VARCHAR2(10 BYTE), 
	"POPIS_POZICE" VARCHAR2(1000 BYTE), 
	"POZADAVKY" VARCHAR2(2000 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table REZISER
--------------------------------------------------------

  CREATE TABLE "REZISER" 
   (	"ID_REZISERA" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table PREDSTAVENI
--------------------------------------------------------

  CREATE TABLE "PREDSTAVENI" 
   (	"ID_KINO" NUMBER(*,0), 
	"CISLO" NUMBER(*,0), 
	"ID_FILMU" NUMBER(*,0), 
	"ID_PREDSTAVENI" NUMBER(*,0), 
	"DATUM_A_CAS" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table SAL
--------------------------------------------------------

  CREATE TABLE "SAL" 
   (	"ID_KINO" NUMBER(*,0), 
	"CISLO" NUMBER(*,0), 
	"KAPACITA" NUMBER(*,0), 
	"VYBAVENI" VARCHAR2(1000 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table UMELEC
--------------------------------------------------------

  CREATE TABLE "UMELEC" 
   (	"ID_UMELCE" NUMBER(*,0), 
	"JMENO_UMELCE" VARCHAR2(80 BYTE), 
	"ROK_NAROZENI" NUMBER(*,0), 
	"ZEME_KOD" VARCHAR2(5 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table VSTUPENKA
--------------------------------------------------------

  CREATE TABLE "VSTUPENKA" 
   (	"ID_VSTUPENKY" NUMBER(*,0), 
	"PLATI_OD" DATE, 
	"PLAITI_DO" NUMBER(*,0), 
	"POCET_PREDSTAVENI" NUMBER(*,0), 
	"ID_KINO" NUMBER(*,0), 
	"ID_OSOBY" NUMBER(*,0), 
	"SEDADLO" NUMBER(*,0), 
	"ID_PREDSTAVENI" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table ZAMESTNANEC
--------------------------------------------------------

  CREATE TABLE "ZAMESTNANEC" 
   (	"ID_ZAM" NUMBER(*,0), 
	"JMENO" VARCHAR2(50 BYTE), 
	"PRIJMENI" VARCHAR2(50 BYTE), 
	"TITULY_PRED" VARCHAR2(30 BYTE), 
	"TILULY_ZA" VARCHAR2(30 BYTE), 
	"DAT_NAR" DATE, 
	"ID_POZICE" VARCHAR2(10 BYTE), 
	"PLAT" FLOAT(63), 
	"ID_KINO" NUMBER(*,0), 
	"ID_SEFA" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table ZANR
--------------------------------------------------------

  CREATE TABLE "ZANR" 
   (	"ZANR_KOD" VARCHAR2(15 BYTE), 
	"POPIS" VARCHAR2(1000 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table ZEME
--------------------------------------------------------

  CREATE TABLE "ZEME" 
   (	"ZEME_KOD" VARCHAR2(5 BYTE), 
	"NAZEV" VARCHAR2(100 BYTE)
   ) ;
REM INSERTING into ZAM_HISTORIE
Insert into ZAM_HISTORIE (ID_HISTORIE,ID_ZAM,ID_POZICE,OD,DO,PLAT) values (1,2,'VED',to_date('01. 08 .2010 00:00:00','DD. MM .YYYY HH24:MI:SS'),null,35800);
Insert into ZAM_HISTORIE (ID_HISTORIE,ID_ZAM,ID_POZICE,OD,DO,PLAT) values (2,3,'HL TECH',to_date('15. 04 .2001 00:00:00','DD. MM .YYYY HH24:MI:SS'),to_date('30. 08 .2011 00:00:00','DD. MM .YYYY HH24:MI:SS'),25000);
Insert into ZAM_HISTORIE (ID_HISTORIE,ID_ZAM,ID_POZICE,OD,DO,PLAT) values (3,4,'TECH',to_date('02. 02 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'),null,18500);
Insert into ZAM_HISTORIE (ID_HISTORIE,ID_ZAM,ID_POZICE,OD,DO,PLAT) values (4,5,'TECH',to_date('09. 04 .2011 00:00:00','DD. MM .YYYY HH24:MI:SS'),null,20000);
Insert into ZAM_HISTORIE (ID_HISTORIE,ID_ZAM,ID_POZICE,OD,DO,PLAT) values (5,12,'AS VED',to_date('02. 01 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'),null,20500);
Insert into ZAM_HISTORIE (ID_HISTORIE,ID_ZAM,ID_POZICE,OD,DO,PLAT) values (6,30,'UV',to_date('15. 09 .2010 00:00:00','DD. MM .YYYY HH24:MI:SS'),null,10500);
Insert into ZAM_HISTORIE (ID_HISTORIE,ID_ZAM,ID_POZICE,OD,DO,PLAT) values (7,29,'UKL',to_date('01. 04 .2008 00:00:00','DD. MM .YYYY HH24:MI:SS'),null,8350);
Insert into ZAM_HISTORIE (ID_HISTORIE,ID_ZAM,ID_POZICE,OD,DO,PLAT) values (8,26,'VED SM',to_date('01. 05 .2004 00:00:00','DD. MM .YYYY HH24:MI:SS'),to_date('06. 12 .2011 00:00:00','DD. MM .YYYY HH24:MI:SS'),14000);
Insert into ZAM_HISTORIE (ID_HISTORIE,ID_ZAM,ID_POZICE,OD,DO,PLAT) values (9,17,'POKL',to_date('01. 09 .2011 00:00:00','DD. MM .YYYY HH24:MI:SS'),null,13000);
Insert into ZAM_HISTORIE (ID_HISTORIE,ID_ZAM,ID_POZICE,OD,DO,PLAT) values (10,9,'VED ŘET',to_date('02. 10 .2000 00:00:00','DD. MM .YYYY HH24:MI:SS'),null,48800);
Insert into ZAM_HISTORIE (ID_HISTORIE,ID_ZAM,ID_POZICE,OD,DO,PLAT) values (11,23,'VED',to_date('01. 11 .2000 00:00:00','DD. MM .YYYY HH24:MI:SS'),to_date('28. 02 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'),38000);
Insert into ZAM_HISTORIE (ID_HISTORIE,ID_ZAM,ID_POZICE,OD,DO,PLAT) values (12,1,'UV',to_date('01. 07 .2010 00:00:00','DD. MM .YYYY HH24:MI:SS'),to_date('31. 08 .2010 00:00:00','DD. MM .YYYY HH24:MI:SS'),10500);
Insert into ZAM_HISTORIE (ID_HISTORIE,ID_ZAM,ID_POZICE,OD,DO,PLAT) values (13,11,'PROD',to_date('01. 08 .2011 00:00:00','DD. MM .YYYY HH24:MI:SS'),null,18000);
Insert into ZAM_HISTORIE (ID_HISTORIE,ID_ZAM,ID_POZICE,OD,DO,PLAT) values (14,15,'AS VED',to_date('10. 04 .2011 00:00:00','DD. MM .YYYY HH24:MI:SS'),to_date('05. 12 .2011 00:00:00','DD. MM .YYYY HH24:MI:SS'),19800);
Insert into ZAM_HISTORIE (ID_HISTORIE,ID_ZAM,ID_POZICE,OD,DO,PLAT) values (15,11,'PROD',to_date('05. 09 .2003 00:00:00','DD. MM .YYYY HH24:MI:SS'),to_date('31. 07 .2011 00:00:00','DD. MM .YYYY HH24:MI:SS'),17000);
Insert into ZAM_HISTORIE (ID_HISTORIE,ID_ZAM,ID_POZICE,OD,DO,PLAT) values (16,17,'POKL',to_date('01. 09 .2010 00:00:00','DD. MM .YYYY HH24:MI:SS'),to_date('30. 06 .2011 00:00:00','DD. MM .YYYY HH24:MI:SS'),120000);
Insert into ZAM_HISTORIE (ID_HISTORIE,ID_ZAM,ID_POZICE,OD,DO,PLAT) values (17,1,'UV',to_date('01. 07 .2011 00:00:00','DD. MM .YYYY HH24:MI:SS'),to_date('31. 08 .2011 00:00:00','DD. MM .YYYY HH24:MI:SS'),10000);
Insert into ZAM_HISTORIE (ID_HISTORIE,ID_ZAM,ID_POZICE,OD,DO,PLAT) values (18,1,'UV',to_date('01. 07 .2009 00:00:00','DD. MM .YYYY HH24:MI:SS'),to_date('31. 08 .2009 00:00:00','DD. MM .YYYY HH24:MI:SS'),9500);
Insert into ZAM_HISTORIE (ID_HISTORIE,ID_ZAM,ID_POZICE,OD,DO,PLAT) values (19,17,'HL POKL',to_date('01. 07 .2011 00:00:00','DD. MM .YYYY HH24:MI:SS'),null,17000);
Insert into ZAM_HISTORIE (ID_HISTORIE,ID_ZAM,ID_POZICE,OD,DO,PLAT) values (20,24,'UCT',to_date('02. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'),null,24000);
REM INSERTING into FILM
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (1,1,'Havran',2012,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (3,2,'Můj vysvlečenej deník ',2012,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (1,4,'V jako Vendeta ',2006,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (5,3,'Vrásky z lásky ',2012,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (9,5,'Černá labuť',2010,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (10,6,'Musíme si promluvit o Kevinovi',2011,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (12,7,'Probudím se včera ',2011,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (14,8,'Čtyři slunce ',2012,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (14,9,'Venkovský učitel ',2007,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (16,10,'Jeden musí z kola ven',2011,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (19,11,'Pátý element',1997,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (21,12,'Nebezpečná metoda',2011,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (23,13,'Den zrady',2011,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (24,14,'Lítám v tom',2009,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (25,15,'Vrchní, prchni! ',1980,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (27,16,'Na samotě u lesa',1976,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (28,17,'Bůh masakru',2011,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (31,18,'Věčný svit neposkvrněné mysli',2004,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (33,19,'Králova řeč',2010,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (34,20,'Válka Bohů',2011,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (34,21,'Sněhurka',2012,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (37,22,'Pretty Woman',1990,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (39,23,'Půlnoc v Paříži',2011,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (39,24,'Hollywood v koncích',2002,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (41,25,'Kůže, kterou nosím',2011,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (39,26,'Poznáš muže svých snů',2010,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (43,27,'Muži v naději',2011,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (45,28,'Samotáři',2000,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (46,29,'Melancholia',2011,null);
Insert into FILM (ID_REZISERA,ID_FILMU,NAZEV,ROK,ZANR) values (46,30,'Antikrist',2009,null);
REM INSERTING into FILM_ZANR
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (1,'THIL');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (2,'KOM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (3,'DRAM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (3,'KOM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (4,'AKCE');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (4,'DRAM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (4,'SCIFI');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (4,'THIL');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (5,'DRAM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (5,'MYST');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (5,'THIL');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (6,'DRAM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (6,'THIL');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (7,'KOM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (7,'SCIFI');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (8,'DRAM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (8,'KOM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (9,'DRAM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (10,'DRAM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (10,'MYST');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (10,'THIL');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (11,'AKCE');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (11,'KOM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (11,'SCIFI');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (12,'DRAM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (12,'THIL');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (12,'ŽIV');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (13,'DRAM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (14,'DRAM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (14,'KOM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (14,'ROM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (15,'KOM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (16,'KOM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (17,'DRAM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (17,'KOM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (18,'DRAM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (18,'ROM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (18,'SCIFI');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (19,'DRAM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (19,'HIST');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (19,'ŽIV');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (20,'AKCE');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (20,'DRAM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (20,'FANT');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (21,'DOBR');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (21,'DRAM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (21,'KOM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (22,'KOM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (22,'ROM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (23,'FANT');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (23,'KOM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (23,'ROM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (24,'DRAM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (24,'KOM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (25,'DRAM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (25,'MYST');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (25,'THIL');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (26,'DRAM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (26,'KOM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (26,'ROM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (27,'KOM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (28,'KOM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (29,'DRAM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (29,'SCIFI');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (30,'DRAM');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (30,'HOROR');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (30,'MYST');
Insert into FILM_ZANR (ID_FILMU,ZANR_KOD) values (30,'PSYCH');
REM INSERTING into FILM_ZEME
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('CAN',12);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('CHE',12);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('CSR',15);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('CSR',16);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('CZE',2);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('CZE',3);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('CZE',7);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('CZE',8);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('CZE',9);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('CZE',27);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('CZE',28);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('DEU',4);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('DEU',9);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('DEU',10);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('DEU',12);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('DEU',17);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('DEU',29);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('DEU',30);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('DNK',29);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('DNK',30);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('ESP',1);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('ESP',23);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('ESP',25);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('ESP',26);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('FRA',9);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('FRA',10);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('FRA',11);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('FRA',17);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('FRA',29);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('FRA',30);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('GB',4);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('GB',6);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('GB',10);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('GB',12);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('GB',19);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('HUN',1);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('SWE',29);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('SWE',30);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('USA',1);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('USA',4);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('USA',5);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('USA',6);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('USA',13);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('USA',14);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('USA',18);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('USA',20);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('USA',21);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('USA',22);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('USA',23);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('USA',24);
Insert into FILM_ZEME (ZEME_KOD,ID_FILMU) values ('USA',26);
REM INSERTING into HEREC
Insert into HEREC (ID_HERCE) values (2);
Insert into HEREC (ID_HERCE) values (4);
Insert into HEREC (ID_HERCE) values (6);
Insert into HEREC (ID_HERCE) values (7);
Insert into HEREC (ID_HERCE) values (8);
Insert into HEREC (ID_HERCE) values (11);
Insert into HEREC (ID_HERCE) values (13);
Insert into HEREC (ID_HERCE) values (15);
Insert into HEREC (ID_HERCE) values (17);
Insert into HEREC (ID_HERCE) values (18);
Insert into HEREC (ID_HERCE) values (20);
Insert into HEREC (ID_HERCE) values (22);
Insert into HEREC (ID_HERCE) values (23);
Insert into HEREC (ID_HERCE) values (25);
Insert into HEREC (ID_HERCE) values (26);
Insert into HEREC (ID_HERCE) values (29);
Insert into HEREC (ID_HERCE) values (30);
Insert into HEREC (ID_HERCE) values (32);
Insert into HEREC (ID_HERCE) values (35);
Insert into HEREC (ID_HERCE) values (36);
Insert into HEREC (ID_HERCE) values (38);
Insert into HEREC (ID_HERCE) values (39);
Insert into HEREC (ID_HERCE) values (40);
Insert into HEREC (ID_HERCE) values (42);
Insert into HEREC (ID_HERCE) values (44);
Insert into HEREC (ID_HERCE) values (47);
Insert into HEREC (ID_HERCE) values (48);
REM INSERTING into HRAJE
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Edgar Allan Poe',2,1);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Dr. Lichá',4,2);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Jana',7,3);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Evey',8,4);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Nina Sayers',8,5);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Eva Khatchadourian',11,6);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Petr',13,7);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Jerry',13,8);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Učitel',15,9);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('George Smiley',17,10);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Jean-Baptiste Emanuel Zorg',17,11);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Bill Haydon',18,10);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Král Jindřich VI.',18,19);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Korben Dallas',20,11);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Sabina Spielrein',22,12);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Governor Mike Morris',23,13);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Ryan Bingham',23,14);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Radim Zvon',25,16);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('soused Pařízek',26,15);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Oldřich Lavička',26,16);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Nancy Cowan',29,17);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Clementine Kruczynski',29,18);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Penelope Longstreet',30,17);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Joel Barish',32,18);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Theseus',35,20);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Královna',36,21);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Vivian Ward',36,22);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Edward Lewis',38,22);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Val',39,24);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Gil',40,23);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Robert Ledgard',42,25);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Alfie Shepridge',42,26);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Ondřej',44,27);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Jakub',44,28);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Justine',47,29);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Claire',48,29);
Insert into HRAJE (ROLE,ID_HERCE,ID_FILMU) values ('Ona',48,30);
REM INSERTING into KINO
Insert into KINO (ID_KINO,NAZEV,MESTO,ULICE,CISLO_POPISNE,CISLO_ORIENTACNI,PSC) values (1,'CineStar Olomouc','Olomouc','Pražská ',255,44,77900);
Insert into KINO (ID_KINO,NAZEV,MESTO,ULICE,CISLO_POPISNE,CISLO_ORIENTACNI,PSC) values (2,'CineStar Plzeň','Plzeň','Písecká',972,1,32600);
Insert into KINO (ID_KINO,NAZEV,MESTO,ULICE,CISLO_POPISNE,CISLO_ORIENTACNI,PSC) values (3,'Palace Cinemas Olympia Centrum','Brno','U Dálnice ',777,null,66442);
Insert into KINO (ID_KINO,NAZEV,MESTO,ULICE,CISLO_POPISNE,CISLO_ORIENTACNI,PSC) values (4,'Palace Cinemas Velký Špalíček','Brno','Mečová',695,2,60200);
Insert into KINO (ID_KINO,NAZEV,MESTO,ULICE,CISLO_POPISNE,CISLO_ORIENTACNI,PSC) values (5,'Cinema City Ústí nad Labem','Ústí nad Labem','Bílinská',3490,6,40001);
Insert into KINO (ID_KINO,NAZEV,MESTO,ULICE,CISLO_POPISNE,CISLO_ORIENTACNI,PSC) values (6,'Cinema City Pardubice','Pardubice','Masarykovo náměstí ',2799,null,53002);
Insert into KINO (ID_KINO,NAZEV,MESTO,ULICE,CISLO_POPISNE,CISLO_ORIENTACNI,PSC) values (7,'Cinema City Liberec','Liberec','Soukenné náměstí',669,2,46080);
Insert into KINO (ID_KINO,NAZEV,MESTO,ULICE,CISLO_POPISNE,CISLO_ORIENTACNI,PSC) values (8,'Cinema City Flora','Praha ','Vinohradská',2828,151,13000);
Insert into KINO (ID_KINO,NAZEV,MESTO,ULICE,CISLO_POPISNE,CISLO_ORIENTACNI,PSC) values (9,'Cinema City Zličín','Praha ','Řevnická',121,1,15521);
Insert into KINO (ID_KINO,NAZEV,MESTO,ULICE,CISLO_POPISNE,CISLO_ORIENTACNI,PSC) values (10,'Palace Cinemas Slovanský dům','Praha ','Na příkopě',859,22,11000);
Insert into KINO (ID_KINO,NAZEV,MESTO,ULICE,CISLO_POPISNE,CISLO_ORIENTACNI,PSC) values (11,'Cinestar Černý Most','Praha ','Chlumecká',712,8,19800);
Insert into KINO (ID_KINO,NAZEV,MESTO,ULICE,CISLO_POPISNE,CISLO_ORIENTACNI,PSC) values (12,'Cinestar České Budějovice
','České Budějovice','Milady Horákové',1498,null,37005);
Insert into KINO (ID_KINO,NAZEV,MESTO,ULICE,CISLO_POPISNE,CISLO_ORIENTACNI,PSC) values (13,'Cinestar Mladá Boleslav','Mladá Boleslav','třída Václava Klementa',1459,null,29301);
Insert into KINO (ID_KINO,NAZEV,MESTO,ULICE,CISLO_POPISNE,CISLO_ORIENTACNI,PSC) values (14,'Cinema City Ostrava','Ostrava','Jantarová',3344,4,70200);
Insert into KINO (ID_KINO,NAZEV,MESTO,ULICE,CISLO_POPISNE,CISLO_ORIENTACNI,PSC) values (15,'Golden Apple Cinema','Zlín','nám. Míru',174,null,76001);
REM INSERTING into OSOBA
Insert into OSOBA (ID_OSOBY,PLNE_JMENO) values (1,'Jana Smutná');
Insert into OSOBA (ID_OSOBY,PLNE_JMENO) values (2,'Jiří Loskot');
Insert into OSOBA (ID_OSOBY,PLNE_JMENO) values (3,'Jaroslav Krutina');
Insert into OSOBA (ID_OSOBY,PLNE_JMENO) values (4,'Petra Zahradníková');
Insert into OSOBA (ID_OSOBY,PLNE_JMENO) values (5,'František Janů');
Insert into OSOBA (ID_OSOBY,PLNE_JMENO) values (6,'Jana Thomson');
Insert into OSOBA (ID_OSOBY,PLNE_JMENO) values (7,'Petar Skala');
Insert into OSOBA (ID_OSOBY,PLNE_JMENO) values (8,'Karolína Světlá');
Insert into OSOBA (ID_OSOBY,PLNE_JMENO) values (9,'Pavel Koukl');
Insert into OSOBA (ID_OSOBY,PLNE_JMENO) values (10,'Kateřina Králová');
Insert into OSOBA (ID_OSOBY,PLNE_JMENO) values (11,'Michael Pressl');
Insert into OSOBA (ID_OSOBY,PLNE_JMENO) values (12,'Klára Burgess');
Insert into OSOBA (ID_OSOBY,PLNE_JMENO) values (13,'Andrea Schickerová');
Insert into OSOBA (ID_OSOBY,PLNE_JMENO) values (14,'Alžběta Tachecí');
Insert into OSOBA (ID_OSOBY,PLNE_JMENO) values (15,'Marek Polanský');
Insert into OSOBA (ID_OSOBY,PLNE_JMENO) values (16,'Marie Londinová');
Insert into OSOBA (ID_OSOBY,PLNE_JMENO) values (17,'Ondřej Grussmann');
Insert into OSOBA (ID_OSOBY,PLNE_JMENO) values (18,'Petr Charvát');
Insert into OSOBA (ID_OSOBY,PLNE_JMENO) values (19,'Eva Hříbalová');
Insert into OSOBA (ID_OSOBY,PLNE_JMENO) values (20,'Jan Červenka');
REM INSERTING into PLATOVA_TRIDA
Insert into PLATOVA_TRIDA (OZNACENI,SPODNI_HRANICE,HORNI_HRANICE) values ('1.třída ',40000,50000);
Insert into PLATOVA_TRIDA (OZNACENI,SPODNI_HRANICE,HORNI_HRANICE) values ('2.třída',32000,39000);
Insert into PLATOVA_TRIDA (OZNACENI,SPODNI_HRANICE,HORNI_HRANICE) values ('3.třída',25000,20000);
Insert into PLATOVA_TRIDA (OZNACENI,SPODNI_HRANICE,HORNI_HRANICE) values ('4.třída',16000,19000);
Insert into PLATOVA_TRIDA (OZNACENI,SPODNI_HRANICE,HORNI_HRANICE) values ('5.třída',12000,15000);
Insert into PLATOVA_TRIDA (OZNACENI,SPODNI_HRANICE,HORNI_HRANICE) values ('6.třída',8000,11000);
REM INSERTING into PRAC_POZICE
Insert into PRAC_POZICE (ID_POZICE,POPIS_POZICE,POZADAVKY) values ('PROD','programový produkční','komunikační dovednosti, vysoké prac.nasazení, kulturní přehled, přehled o kinematografii');
Insert into PRAC_POZICE (ID_POZICE,POPIS_POZICE,POZADAVKY) values ('HL TECH','hlavní technik',null);
Insert into PRAC_POZICE (ID_POZICE,POPIS_POZICE,POZADAVKY) values ('HL POKL','hlavní pokladní',null);
Insert into PRAC_POZICE (ID_POZICE,POPIS_POZICE,POZADAVKY) values ('VED SM','vedoucí směny',null);
Insert into PRAC_POZICE (ID_POZICE,POPIS_POZICE,POZADAVKY) values ('AS VED','asisten vedoucího',null);
Insert into PRAC_POZICE (ID_POZICE,POPIS_POZICE,POZADAVKY) values ('UKL','uklízečka',null);
Insert into PRAC_POZICE (ID_POZICE,POPIS_POZICE,POZADAVKY) values ('VED ŘET','vedoucí řetězce kin',null);
Insert into PRAC_POZICE (ID_POZICE,POPIS_POZICE,POZADAVKY) values ('AS TECH','asistent technika',null);
Insert into PRAC_POZICE (ID_POZICE,POPIS_POZICE,POZADAVKY) values ('SPR','správce kina',null);
Insert into PRAC_POZICE (ID_POZICE,POPIS_POZICE,POZADAVKY) values ('UCT','účetní',null);
Insert into PRAC_POZICE (ID_POZICE,POPIS_POZICE,POZADAVKY) values ('UV','uvaděč','věk minimálně 17 let, dobré vystupování');
Insert into PRAC_POZICE (ID_POZICE,POPIS_POZICE,POZADAVKY) values ('POKL','pokladní',null);
Insert into PRAC_POZICE (ID_POZICE,POPIS_POZICE,POZADAVKY) values ('BAR','barman','věk minimálně 18 let');
Insert into PRAC_POZICE (ID_POZICE,POPIS_POZICE,POZADAVKY) values ('PROM','promítač','manuální zručnost, zodpovědnost, s technickým myšlením a zájmem o kinematografii. ');
Insert into PRAC_POZICE (ID_POZICE,POPIS_POZICE,POZADAVKY) values ('TECH','technik',null);
Insert into PRAC_POZICE (ID_POZICE,POPIS_POZICE,POZADAVKY) values ('VED','vedoucí kina','práce na PC(MS Office,Internet)kulturní přehled,schopnost vést kolektiv, komunikační dovednosti, vysoké prac.nasazení');
REM INSERTING into REZISER
Insert into REZISER (ID_REZISERA) values (1);
Insert into REZISER (ID_REZISERA) values (3);
Insert into REZISER (ID_REZISERA) values (5);
Insert into REZISER (ID_REZISERA) values (9);
Insert into REZISER (ID_REZISERA) values (10);
Insert into REZISER (ID_REZISERA) values (12);
Insert into REZISER (ID_REZISERA) values (14);
Insert into REZISER (ID_REZISERA) values (16);
Insert into REZISER (ID_REZISERA) values (19);
Insert into REZISER (ID_REZISERA) values (21);
Insert into REZISER (ID_REZISERA) values (23);
Insert into REZISER (ID_REZISERA) values (24);
Insert into REZISER (ID_REZISERA) values (25);
Insert into REZISER (ID_REZISERA) values (27);
Insert into REZISER (ID_REZISERA) values (28);
Insert into REZISER (ID_REZISERA) values (31);
Insert into REZISER (ID_REZISERA) values (33);
Insert into REZISER (ID_REZISERA) values (34);
Insert into REZISER (ID_REZISERA) values (37);
Insert into REZISER (ID_REZISERA) values (39);
Insert into REZISER (ID_REZISERA) values (41);
Insert into REZISER (ID_REZISERA) values (43);
Insert into REZISER (ID_REZISERA) values (45);
Insert into REZISER (ID_REZISERA) values (46);
REM INSERTING into PREDSTAVENI
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (9,2,2,2,to_date('01. 05 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (8,9,1,1,to_date('01. 05 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (3,4,10,3,to_date('01. 06 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (7,5,4,4,to_date('10. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (6,5,5,5,to_date('11. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (5,2,6,6,to_date('12. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (6,6,10,7,to_date('13. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (7,4,8,8,to_date('02. 05 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (2,1,10,9,to_date('20. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (9,3,28,10,to_date('21. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (15,6,11,11,to_date('24. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (4,2,12,12,to_date('25. 05 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (1,1,13,13,to_date('26. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (8,2,14,14,to_date('27. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (5,2,10,15,to_date('27. 05 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (4,6,10,16,to_date('29. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (1,4,16,17,to_date('28. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (9,3,18,18,to_date('28. 05 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (13,1,19,19,to_date('30. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (10,3,20,20,to_date('30. 05 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (11,5,21,21,to_date('30. 05 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (9,7,22,22,to_date('04. 05 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (2,5,23,23,to_date('05. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (4,7,24,24,to_date('05. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (13,4,15,25,to_date('05. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (14,4,26,26,to_date('05. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (7,1,27,27,to_date('06. 06 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (12,8,10,28,to_date('06. 06 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (4,2,29,29,to_date('09. 06 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (14,8,30,30,to_date('09. 06 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (15,4,10,31,to_date('28. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (14,7,17,32,to_date('28. 05 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (13,2,10,33,to_date('30. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (12,4,19,34,to_date('30. 05 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (11,6,10,35,to_date('04. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (10,3,21,36,to_date('12. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (9,6,10,37,to_date('07. 06 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (8,9,10,38,to_date('08. 06 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (7,3,10,39,to_date('29. 05 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (6,1,25,40,to_date('07. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (15,3,1,41,to_date('25. 05 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (14,5,10,42,to_date('28. 05 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (13,3,3,43,to_date('27. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (12,2,4,44,to_date('28. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (11,4,5,45,to_date('28. 05 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (10,2,6,46,to_date('30. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (9,2,7,47,to_date('30. 05 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (10,8,10,48,to_date('05. 04 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (9,8,9,49,to_date('09. 06 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
Insert into PREDSTAVENI (ID_KINO,CISLO,ID_FILMU,ID_PREDSTAVENI,DATUM_A_CAS) values (1,7,10,50,to_date('12. 06 .2012 00:00:00','DD. MM .YYYY HH24:MI:SS'));
REM INSERTING into SAL
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (4,1,212,'Dolby audio systém');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (4,2,310,'polohovatelná křesla se stolky a klimatizací');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (4,3,371,'3D projektor');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (4,4,88,'Dolby audio systém');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (4,5,149,'Dolby audio systém');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (4,6,164,'Dolby audio systém');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (4,7,119,'Dolby audio systém');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (5,1,121,'Dolby audio systém');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (5,2,121,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (5,3,121,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (5,4,121,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (5,5,190,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (6,1,124,'projekční technika KINOTON');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (6,2,124,'polohovatelná křesla se stolky a klimatizací');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (6,3,226,'polohovatelná křesla se stolky a klimatizací');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (6,4,103,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (6,5,103,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (6,6,91,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (7,1,82,'Dolby Surround 7.1');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (7,2,82,'Dolby Surround 7.1');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (7,3,137,'Dolby Surround 7.1');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (7,4,96,'Dolby audio systém');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (7,5,170,'Dolby audio systém');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (7,6,96,'Dolby audio systém');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (7,7,218,'3D projektor');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (7,8,368,'3D projektor');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (1,1,107,'Dolby audio systém');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (1,2,90,'digitální šestikanálový prostorový zvuk');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (1,3,133,'digitální šestikanálový prostorový zvuk');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (1,4,90,'digitální šestikanálový prostorový zvuk');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (1,5,107,'Sedačky pro zamilované');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (1,6,191,'3D projektor');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (1,7,264,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (2,1,217,'Imax');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (2,2,120,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (2,3,96,'Videomix Edirol V-8 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (2,4,306,'Dolby Digital Surround EX');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (2,5,143,'Dolby Digital Surround EX');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (2,6,120,'Dolby Digital Surround EX');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (2,7,96,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (2,8,416,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (3,1,113,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (3,2,113,'Dolby audio systém');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (3,3,111,'3D projektor');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (3,4,147,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (3,5,153,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (3,6,313,'Dolby Digital Surround EX');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (3,7,359,'3D projektor');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (3,8,285,'Videomix Edirol V-8 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (3,9,415,'Dolby Surround 7.1');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (3,10,239,'Dolby Surround 7.1');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (8,1,400,'Sedačky pro zamilované');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (8,2,290,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (8,3,143,'Videomix Edirol V-8 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (8,4,128,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (8,5,286,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (8,6,356,'Videomix Edirol V-8 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (8,7,224,'Videomix Edirol V-8 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (8,8,153,'Videomix Edirol V-8 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (8,9,160,'Videomix Edirol V-8 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (9,1,167,'Dolby Digital Surround EX');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (9,2,148,'Dolby Digital Surround EX');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (9,3,179,'Dolby Digital Surround EX');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (9,4,184,'Dolby Digital Surround EX');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (9,5,276,'Dolby Digital Surround EX');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (9,6,396,'Dolby Digital Surround EX');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (9,7,98,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (9,8,119,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (9,9,96,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (9,10,178,'Dolby Surround 7.1');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (10,1,307,'Dolby Digital Surround EX');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (10,2,335,'Dolby Surround 7.1');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (10,3,292,'Dolby Digital Surround EX');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (10,4,167,'projekční technika KINOTON');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (10,5,157,'Dolby audio systém');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (10,6,136,'Dolby audio systém');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (10,7,133,'Dolby audio systém');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (10,8,119,'projekční technika KINOTON');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (10,9,81,'Sedačky pro zamilované');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (10,10,125,'Dolby Surround 7.1');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (11,1,220,'Dolby Surround 7.1');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (11,2,206,'Dolby Surround 7.1');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (11,3,255,'projekční technika KINOTON');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (11,4,364,'projekční technika KINOTON');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (11,5,220,'projekční technika KINOTON');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (11,6,158,'Dolby Surround 7.1');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (11,7,158,'Dolby Surround 7.1');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (11,8,295,'projekční technika KINOTON');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (12,1,316,'digitální šestikanálový prostorový zvuk');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (12,2,316,'digitální šestikanálový prostorový zvuk');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (12,3,94,'digitální šestikanálový prostorový zvuk');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (12,4,145,'Videomix Edirol V-8 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (12,5,145,'projekční technika KINOTON');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (12,6,145,'projekční technika KINOTON');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (12,7,145,'Dolby Surround 7.1');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (12,8,94,'Dolby Surround 7.1');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (13,1,233,'3D projektor');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (13,2,140,'projekční technika KINOTON');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (13,3,96,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (13,4,96,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (14,1,156,'projekční technika KINOTON');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (14,2,172,'projekční technika KINOTON');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (14,3,172,'Dolby audio systém');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (14,4,156,'Dolby audio systém');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (14,5,81,'Videomix Edirol V-8 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (14,6,309,'3D projektor');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (14,7,70,'Sedačky pro zamilované');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (14,8,79,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (15,1,440,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (15,2,122,'Projektor Sony CineAlta 4K SRX-R220 ');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (15,3,112,'digitální šestikanálový prostorový zvuk');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (15,4,95,'3D projektor');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (15,5,90,'Dolby audio systém');
Insert into SAL (ID_KINO,CISLO,KAPACITA,VYBAVENI) values (15,6,90,'Dolby audio systém');
REM INSERTING into UMELEC
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (1,'James McTeigue',1967,'AUS');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (2,'John Cusack',1966,'USA');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (3,'Martin Dolenský',1970,'CSR');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (4,'Simona Stašová',1955,'CSR');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (5,'Jiří Strach',1973,'CSR');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (6,'Radoslav Brzobohatý',1932,'CSR');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (7,'Jiřina Bohdalová',1931,'CSR');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (8,'Natalie Portman',1981,'ISR');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (9,'Darren Aronofsky',1969,'USA');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (10,'Lynne Ramsay',1969,'GB');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (11,'Tilda Swinton',1960,'GB');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (12,'Miloslav Šmídmajer',1959,'CSR');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (13,'Jiří Mádl',1986,'CSR');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (14,'Bohdan Sláma',1967,'CSR');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (15,'Pavel Liška',1972,'CSR');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (16,'Tomas Alfredson',1965,'SWE');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (17,'Gary Oldman',1958,'GB');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (18,'Colin Firth',1960,'GB');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (19,'Luc Besson',1959,'FRA');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (20,'Bruce Willis',1955,'DEU');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (21,'David Cronenberg',1943,'CAN');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (22,'Keira Knightley',1985,'GB');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (23,'George Clooney',1961,'USA');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (24,'Jason Reitman',1977,'CAN');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (25,'Ladislav Smoljak',1931,'CSR');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (26,'Zdeněk Svěrák',1936,'CSR');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (27,'Jiří Menzel',1938,'CSR');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (28,'Roman Polanski',1933,'FRA');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (29,'Kate Winslet',1975,'GB');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (30,'Jodie Foster',1962,'USA');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (31,'Michel Gondry',1963,'FRA');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (32,'Jim Carrey',1962,'CAN');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (33,'Tom Hooper',1972,'GB');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (34,'Tarsem Singh',1961,'IND');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (35,'Henry Cavill',1983,'NO');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (36,'Julia Roberts',1967,'USA');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (37,'Garry Marshall',1934,'USA');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (38,'Richard Gere',1949,'USA');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (39,'Woody Allen',1935,'USA');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (40,'Owen Wilson',1968,'USA');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (41,'Pedro Almodóvar',1649,'ESP');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (42,'Antonio Banderas',1960,'ESP');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (43,'Jiří Vejdělek',1972,'CSR');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (44,'Jiří Macháček',1966,'CSR');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (45,'David Ondříček',1969,'CSR');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (46,'Lars von Trier',1956,'DNK');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (47,'Kirsten Dunst',1982,'USA');
Insert into UMELEC (ID_UMELCE,JMENO_UMELCE,ROK_NAROZENI,ZEME_KOD) values (48,'Charlotte Gainsbourg',1971,'GB');
REM INSERTING into VSTUPENKA
REM INSERTING into ZAMESTNANEC
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (2,'Agáta','Červinská','Mgr.',null,to_date('18. 05 .1964 00:00:00','DD. MM .YYYY HH24:MI:SS'),'VED',null,14,9);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (3,'Michal','Suk','Ing.',null,to_date('07. 11 .1975 00:00:00','DD. MM .YYYY HH24:MI:SS'),'HL TECH',null,5,7);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (4,'Martin','Petras','Bc.',null,to_date('03. 12 .1989 00:00:00','DD. MM .YYYY HH24:MI:SS'),'TECH',null,5,3);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (5,'Petr','Hrabě',null,null,to_date('30. 08 .1981 00:00:00','DD. MM .YYYY HH24:MI:SS'),'TECH',null,5,3);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (6,'Aleš ','Metzner',null,null,to_date('28. 02 .1993 00:00:00','DD. MM .YYYY HH24:MI:SS'),'AS TECH',null,5,5);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (7,'Markéta','Dorňáková','Ing.',null,to_date('06. 07 .1983 00:00:00','DD. MM .YYYY HH24:MI:SS'),'SPR',null,5,9);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (8,'Hana','Kubová',null,null,to_date('21. 09 .1992 00:00:00','DD. MM .YYYY HH24:MI:SS'),'UKL',null,6,14);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (9,'David','Kadeřábek','Ing.',null,to_date('08. 08 .1978 00:00:00','DD. MM .YYYY HH24:MI:SS'),'VED ŘET',null,null,null);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (10,'Eliška','Nejedlá','Mgr.',null,to_date('06. 02 .1984 00:00:00','DD. MM .YYYY HH24:MI:SS'),'VED',null,5,9);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (11,'Martin','Ferenz','Mgr.',null,to_date('25. 08 .1983 00:00:00','DD. MM .YYYY HH24:MI:SS'),'PROD',null,7,13);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (12,'Miloš','Suchánek','Mgr.',null,to_date('05. 05 .1978 00:00:00','DD. MM .YYYY HH24:MI:SS'),'AS VED',null,14,2);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (13,'Jan ','Zelený','DiS.',null,to_date('02. 01 .1979 00:00:00','DD. MM .YYYY HH24:MI:SS'),'VED',null,7,9);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (14,'Marek','Drábek',null,null,to_date('31. 10 .1980 00:00:00','DD. MM .YYYY HH24:MI:SS'),'VED SM',null,6,15);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (15,'Jaroslava','Hladíková','Bc.',null,to_date('09. 12 .1966 00:00:00','DD. MM .YYYY HH24:MI:SS'),'AS VED',null,6,null);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (16,'Filip','Martínek','Ing.',null,to_date('06. 10 .1977 00:00:00','DD. MM .YYYY HH24:MI:SS'),'HL POKL',null,6,15);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (1,'Adéla ','Drábková','Bc.',null,to_date('03. 05 .1987 00:00:00','DD. MM .YYYY HH24:MI:SS'),'UV',null,14,12);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (17,'Helena','Zábranská',null,null,to_date('18. 01 .2049 00:00:00','DD. MM .YYYY HH24:MI:SS'),'POKL',null,6,16);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (18,'Karel ','Sýkora',null,null,to_date('27. 04 .1982 00:00:00','DD. MM .YYYY HH24:MI:SS'),'PROM',null,13,20);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (21,'Ivan','Hošek','Mgr.','Ph.D.',to_date('08. 05 .1972 00:00:00','DD. MM .YYYY HH24:MI:SS'),'VED',null,11,22);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (19,'Karel ','Sýkora',null,null,to_date('27. 04 .1982 00:00:00','DD. MM .YYYY HH24:MI:SS'),'PROM',null,11,21);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (20,'Jana ','Staňková','MgA.',null,to_date('11. 12 .1973 00:00:00','DD. MM .YYYY HH24:MI:SS'),'VED',null,13,22);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (22,'Tomáš ','Kabát',null,null,to_date('17. 02 .1974 00:00:00','DD. MM .YYYY HH24:MI:SS'),'VED ŘET',null,null,null);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (23,'Veronika','Hollarová','Ing.',null,to_date('03. 07 .1981 00:00:00','DD. MM .YYYY HH24:MI:SS'),'VED',null,3,null);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (24,'Ivana','Holoubková','Ing.',null,to_date('29. 12 .1968 00:00:00','DD. MM .YYYY HH24:MI:SS'),'UCT',null,3,23);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (25,'Zuzana','Schramková','Bc.',null,to_date('13. 03 .1982 00:00:00','DD. MM .YYYY HH24:MI:SS'),'AS VED',null,3,23);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (26,'Terezie ','Kunftová',null,null,to_date('09. 11 .1980 00:00:00','DD. MM .YYYY HH24:MI:SS'),'VED SM',null,3,25);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (27,'Štěpán ','Sláma',null,null,to_date('01. 11 .1988 00:00:00','DD. MM .YYYY HH24:MI:SS'),'BAR',null,3,26);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (28,'Vesna','Mičeva',null,null,to_date('24. 12 .1971 00:00:00','DD. MM .YYYY HH24:MI:SS'),'UKL',null,3,26);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (29,'Vesna','Mičeva',null,null,to_date('24. 12 .1971 00:00:00','DD. MM .YYYY HH24:MI:SS'),'UKL',null,4,null);
Insert into ZAMESTNANEC (ID_ZAM,JMENO,PRIJMENI,TITULY_PRED,TILULY_ZA,DAT_NAR,ID_POZICE,PLAT,ID_KINO,ID_SEFA) values (30,'Olga','Kralewska','',null,to_date('07. 04 .1990 00:00:00','DD. MM .YYYY HH24:MI:SS'),'UV',null,12,null);
REM INSERTING into ZANR
Insert into ZANR (ZANR_KOD,POPIS) values ('THIL','Thiller');
Insert into ZANR (ZANR_KOD,POPIS) values ('KOM','Komedie');
Insert into ZANR (ZANR_KOD,POPIS) values ('DRAM','Drama');
Insert into ZANR (ZANR_KOD,POPIS) values ('AKCE','Akční');
Insert into ZANR (ZANR_KOD,POPIS) values ('SCIFI','Sci-fi');
Insert into ZANR (ZANR_KOD,POPIS) values ('MYST','Mysteriózní');
Insert into ZANR (ZANR_KOD,POPIS) values ('ŽIV','Životopisný');
Insert into ZANR (ZANR_KOD,POPIS) values ('ROM','Romantický');
Insert into ZANR (ZANR_KOD,POPIS) values ('HIST','Historický');
Insert into ZANR (ZANR_KOD,POPIS) values ('FANT','Fantasy');
Insert into ZANR (ZANR_KOD,POPIS) values ('DOBR','Dobrodružný');
Insert into ZANR (ZANR_KOD,POPIS) values ('HOROR','Horor');
Insert into ZANR (ZANR_KOD,POPIS) values ('PSYCH','Psychologický');
REM INSERTING into ZEME
Insert into ZEME (ZEME_KOD,NAZEV) values ('CZE','Česká republika');
Insert into ZEME (ZEME_KOD,NAZEV) values ('GB','Velká Británíe');
Insert into ZEME (ZEME_KOD,NAZEV) values ('AUS','Austrálie');
Insert into ZEME (ZEME_KOD,NAZEV) values ('USA','USA');
Insert into ZEME (ZEME_KOD,NAZEV) values ('CSR','Československo');
Insert into ZEME (ZEME_KOD,NAZEV) values ('ISR','Izrael');
Insert into ZEME (ZEME_KOD,NAZEV) values ('SWE','Švédsko');
Insert into ZEME (ZEME_KOD,NAZEV) values ('FRA','Francie');
Insert into ZEME (ZEME_KOD,NAZEV) values ('CAN','Kanada');
Insert into ZEME (ZEME_KOD,NAZEV) values ('IND','Indie');
Insert into ZEME (ZEME_KOD,NAZEV) values ('NO','Normanské ostrovy');
Insert into ZEME (ZEME_KOD,NAZEV) values ('ESP','Španělsko');
Insert into ZEME (ZEME_KOD,NAZEV) values ('DNK','Dánsko');
Insert into ZEME (ZEME_KOD,NAZEV) values ('DEU','Německo');
Insert into ZEME (ZEME_KOD,NAZEV) values ('HUN','Maďarsko');
Insert into ZEME (ZEME_KOD,NAZEV) values ('CHE','Švýcarsko');
--------------------------------------------------------
--  DDL for Index ZAM_historie PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ZAM_historie PK" ON "ZAM_HISTORIE" ("ID_HISTORIE") 
  ;
--------------------------------------------------------
--  DDL for Index film PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "film PK" ON "FILM" ("ID_FILMU") 
  ;
--------------------------------------------------------
--  DDL for Index FILM_ZANR__IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "FILM_ZANR__IDX" ON "FILM_ZANR" ("ID_FILMU", "ZANR_KOD") 
  ;
--------------------------------------------------------
--  DDL for Index FILM_ZEME__IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "FILM_ZEME__IDX" ON "FILM_ZEME" ("ZEME_KOD", "ID_FILMU") 
  ;
--------------------------------------------------------
--  DDL for Index PK_HEREC
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_HEREC" ON "HEREC" ("ID_HERCE") 
  ;
--------------------------------------------------------
--  DDL for Index PK_HRAJE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_HRAJE" ON "HRAJE" ("ID_HERCE", "ID_FILMU", "ROLE") 
  ;
--------------------------------------------------------
--  DDL for Index Kino PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "Kino PK" ON "KINO" ("ID_KINO") 
  ;
--------------------------------------------------------
--  DDL for Index osoba PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "osoba PK" ON "OSOBA" ("ID_OSOBY") 
  ;
--------------------------------------------------------
--  DDL for Index platova_trida PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "platova_trida PK" ON "PLATOVA_TRIDA" ("OZNACENI") 
  ;
--------------------------------------------------------
--  DDL for Index pozice PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "pozice PK" ON "PRAC_POZICE" ("ID_POZICE") 
  ;
--------------------------------------------------------
--  DDL for Index PK_REZISER
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_REZISER" ON "REZISER" ("ID_REZISERA") 
  ;
--------------------------------------------------------
--  DDL for Index predstaveni PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "predstaveni PK" ON "PREDSTAVENI" ("ID_PREDSTAVENI") 
  ;
--------------------------------------------------------
--  DDL for Index PK_SAL
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_SAL" ON "SAL" ("ID_KINO", "CISLO") 
  ;
--------------------------------------------------------
--  DDL for Index umelec PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "umelec PK" ON "UMELEC" ("ID_UMELCE") 
  ;
--------------------------------------------------------
--  DDL for Index vstupenka PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "vstupenka PK" ON "VSTUPENKA" ("ID_VSTUPENKY") 
  ;
--------------------------------------------------------
--  DDL for Index zamestnanec PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "zamestnanec PK" ON "ZAMESTNANEC" ("ID_ZAM") 
  ;
--------------------------------------------------------
--  DDL for Index zanr PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "zanr PK" ON "ZANR" ("ZANR_KOD") 
  ;
--------------------------------------------------------
--  DDL for Index zeme PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "zeme PK" ON "ZEME" ("ZEME_KOD") 
  ;
--------------------------------------------------------
--  Constraints for Table ZAM_HISTORIE
--------------------------------------------------------

  ALTER TABLE "ZAM_HISTORIE" MODIFY ("ID_HISTORIE" NOT NULL ENABLE);
 
  ALTER TABLE "ZAM_HISTORIE" MODIFY ("OD" NOT NULL ENABLE);
 
  ALTER TABLE "ZAM_HISTORIE" ADD CONSTRAINT "ZAM_historie PK" PRIMARY KEY ("ID_HISTORIE") ENABLE;
--------------------------------------------------------
--  Constraints for Table FILM
--------------------------------------------------------

  ALTER TABLE "FILM" MODIFY ("ID_FILMU" NOT NULL ENABLE);
 
  ALTER TABLE "FILM" MODIFY ("NAZEV" NOT NULL ENABLE);
 
  ALTER TABLE "FILM" MODIFY ("ROK" NOT NULL ENABLE);
 
  ALTER TABLE "FILM" ADD CONSTRAINT "film PK" PRIMARY KEY ("ID_FILMU") ENABLE;
--------------------------------------------------------
--  Constraints for Table FILM_ZANR
--------------------------------------------------------

  ALTER TABLE "FILM_ZANR" ADD CONSTRAINT "FILM_ZANR__IDX" PRIMARY KEY ("ID_FILMU", "ZANR_KOD") ENABLE;
 
  ALTER TABLE "FILM_ZANR" MODIFY ("ID_FILMU" NOT NULL ENABLE);
 
  ALTER TABLE "FILM_ZANR" MODIFY ("ZANR_KOD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FILM_ZEME
--------------------------------------------------------

  ALTER TABLE "FILM_ZEME" ADD CONSTRAINT "FILM_ZEME__IDX" PRIMARY KEY ("ZEME_KOD", "ID_FILMU") ENABLE;
 
  ALTER TABLE "FILM_ZEME" MODIFY ("ZEME_KOD" NOT NULL ENABLE);
 
  ALTER TABLE "FILM_ZEME" MODIFY ("ID_FILMU" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HEREC
--------------------------------------------------------

  ALTER TABLE "HEREC" ADD CONSTRAINT "PK_HEREC" PRIMARY KEY ("ID_HERCE") ENABLE;
 
  ALTER TABLE "HEREC" MODIFY ("ID_HERCE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HRAJE
--------------------------------------------------------

  ALTER TABLE "HRAJE" ADD CONSTRAINT "PK_HRAJE" PRIMARY KEY ("ID_HERCE", "ID_FILMU", "ROLE") ENABLE;
 
  ALTER TABLE "HRAJE" MODIFY ("ROLE" NOT NULL ENABLE);
 
  ALTER TABLE "HRAJE" MODIFY ("ID_HERCE" NOT NULL ENABLE);
 
  ALTER TABLE "HRAJE" MODIFY ("ID_FILMU" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table KINO
--------------------------------------------------------

  ALTER TABLE "KINO" ADD CONSTRAINT "Kino PK" PRIMARY KEY ("ID_KINO") ENABLE;
 
  ALTER TABLE "KINO" MODIFY ("ID_KINO" NOT NULL ENABLE);
 
  ALTER TABLE "KINO" MODIFY ("NAZEV" NOT NULL ENABLE);
 
  ALTER TABLE "KINO" MODIFY ("MESTO" NOT NULL ENABLE);
 
  ALTER TABLE "KINO" MODIFY ("CISLO_POPISNE" NOT NULL ENABLE);
 
  ALTER TABLE "KINO" MODIFY ("PSC" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table OSOBA
--------------------------------------------------------

  ALTER TABLE "OSOBA" MODIFY ("ID_OSOBY" NOT NULL ENABLE);
 
  ALTER TABLE "OSOBA" MODIFY ("PLNE_JMENO" NOT NULL ENABLE);
 
  ALTER TABLE "OSOBA" ADD CONSTRAINT "osoba PK" PRIMARY KEY ("ID_OSOBY") ENABLE;
--------------------------------------------------------
--  Constraints for Table PLATOVA_TRIDA
--------------------------------------------------------

  ALTER TABLE "PLATOVA_TRIDA" MODIFY ("OZNACENI" NOT NULL ENABLE);
 
  ALTER TABLE "PLATOVA_TRIDA" MODIFY ("SPODNI_HRANICE" NOT NULL ENABLE);
 
  ALTER TABLE "PLATOVA_TRIDA" MODIFY ("HORNI_HRANICE" NOT NULL ENABLE);
 
  ALTER TABLE "PLATOVA_TRIDA" ADD CONSTRAINT "platova_trida PK" PRIMARY KEY ("OZNACENI") ENABLE;
--------------------------------------------------------
--  Constraints for Table PRAC_POZICE
--------------------------------------------------------

  ALTER TABLE "PRAC_POZICE" MODIFY ("ID_POZICE" NOT NULL ENABLE);
 
  ALTER TABLE "PRAC_POZICE" MODIFY ("POPIS_POZICE" NOT NULL ENABLE);
 
  ALTER TABLE "PRAC_POZICE" ADD CONSTRAINT "pozice PK" PRIMARY KEY ("ID_POZICE") ENABLE;
--------------------------------------------------------
--  Constraints for Table REZISER
--------------------------------------------------------

  ALTER TABLE "REZISER" ADD CONSTRAINT "PK_REZISER" PRIMARY KEY ("ID_REZISERA") ENABLE;
 
  ALTER TABLE "REZISER" MODIFY ("ID_REZISERA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PREDSTAVENI
--------------------------------------------------------

  ALTER TABLE "PREDSTAVENI" MODIFY ("ID_KINO" NOT NULL ENABLE);
 
  ALTER TABLE "PREDSTAVENI" MODIFY ("CISLO" NOT NULL ENABLE);
 
  ALTER TABLE "PREDSTAVENI" MODIFY ("ID_FILMU" NOT NULL ENABLE);
 
  ALTER TABLE "PREDSTAVENI" MODIFY ("ID_PREDSTAVENI" NOT NULL ENABLE);
 
  ALTER TABLE "PREDSTAVENI" MODIFY ("DATUM_A_CAS" NOT NULL ENABLE);
 
  ALTER TABLE "PREDSTAVENI" ADD CONSTRAINT "predstaveni PK" PRIMARY KEY ("ID_PREDSTAVENI") ENABLE;
--------------------------------------------------------
--  Constraints for Table SAL
--------------------------------------------------------

  ALTER TABLE "SAL" ADD CONSTRAINT "PK_SAL" PRIMARY KEY ("ID_KINO", "CISLO") ENABLE;
 
  ALTER TABLE "SAL" MODIFY ("ID_KINO" NOT NULL ENABLE);
 
  ALTER TABLE "SAL" MODIFY ("CISLO" NOT NULL ENABLE);
 
  ALTER TABLE "SAL" MODIFY ("KAPACITA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table UMELEC
--------------------------------------------------------

  ALTER TABLE "UMELEC" MODIFY ("ID_UMELCE" NOT NULL ENABLE);
 
  ALTER TABLE "UMELEC" MODIFY ("JMENO_UMELCE" NOT NULL ENABLE);
 
  ALTER TABLE "UMELEC" ADD CONSTRAINT "umelec PK" PRIMARY KEY ("ID_UMELCE") ENABLE;
--------------------------------------------------------
--  Constraints for Table VSTUPENKA
--------------------------------------------------------

  ALTER TABLE "VSTUPENKA" MODIFY ("ID_VSTUPENKY" NOT NULL ENABLE);
 
  ALTER TABLE "VSTUPENKA" MODIFY ("ID_KINO" NOT NULL ENABLE);
 
  ALTER TABLE "VSTUPENKA" MODIFY ("ID_OSOBY" NOT NULL ENABLE);
 
  ALTER TABLE "VSTUPENKA" MODIFY ("ID_PREDSTAVENI" NOT NULL ENABLE);
 
  ALTER TABLE "VSTUPENKA" ADD CONSTRAINT "vstupenka PK" PRIMARY KEY ("ID_VSTUPENKY") ENABLE;
--------------------------------------------------------
--  Constraints for Table ZAMESTNANEC
--------------------------------------------------------

  ALTER TABLE "ZAMESTNANEC" MODIFY ("ID_ZAM" NOT NULL ENABLE);
 
  ALTER TABLE "ZAMESTNANEC" MODIFY ("JMENO" NOT NULL ENABLE);
 
  ALTER TABLE "ZAMESTNANEC" MODIFY ("PRIJMENI" NOT NULL ENABLE);
 
  ALTER TABLE "ZAMESTNANEC" MODIFY ("ID_POZICE" NOT NULL ENABLE);
 
  ALTER TABLE "ZAMESTNANEC" ADD CONSTRAINT "zamestnanec PK" PRIMARY KEY ("ID_ZAM") ENABLE;
--------------------------------------------------------
--  Constraints for Table ZANR
--------------------------------------------------------

  ALTER TABLE "ZANR" MODIFY ("ZANR_KOD" NOT NULL ENABLE);
 
  ALTER TABLE "ZANR" MODIFY ("POPIS" NOT NULL ENABLE);
 
  ALTER TABLE "ZANR" ADD CONSTRAINT "zanr PK" PRIMARY KEY ("ZANR_KOD") ENABLE;
--------------------------------------------------------
--  Constraints for Table ZEME
--------------------------------------------------------

  ALTER TABLE "ZEME" MODIFY ("ZEME_KOD" NOT NULL ENABLE);
 
  ALTER TABLE "ZEME" MODIFY ("NAZEV" NOT NULL ENABLE);
 
  ALTER TABLE "ZEME" ADD CONSTRAINT "zeme PK" PRIMARY KEY ("ZEME_KOD") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ZAM_HISTORIE
--------------------------------------------------------

  ALTER TABLE "ZAM_HISTORIE" ADD CONSTRAINT "POZICE_HISTORIE" FOREIGN KEY ("ID_POZICE")
	  REFERENCES "PRAC_POZICE" ("ID_POZICE") ON DELETE SET NULL ENABLE;
 
  ALTER TABLE "ZAM_HISTORIE" ADD CONSTRAINT "ZAMESTNANEC_HISTORY" FOREIGN KEY ("ID_ZAM")
	  REFERENCES "ZAMESTNANEC" ("ID_ZAM") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FILM
--------------------------------------------------------

  ALTER TABLE "FILM" ADD CONSTRAINT "REZIRUJE" FOREIGN KEY ("ID_REZISERA")
	  REFERENCES "REZISER" ("ID_REZISERA") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FILM_ZANR
--------------------------------------------------------

  ALTER TABLE "FILM_ZANR" ADD CONSTRAINT "FILM_ZANR_FILM_FK" FOREIGN KEY ("ZANR_KOD")
	  REFERENCES "ZANR" ("ZANR_KOD") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "FILM_ZANR" ADD CONSTRAINT "FILM_ZANR_ZANR_FK" FOREIGN KEY ("ID_FILMU")
	  REFERENCES "FILM" ("ID_FILMU") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FILM_ZEME
--------------------------------------------------------

  ALTER TABLE "FILM_ZEME" ADD CONSTRAINT "FILM_ZAME_ZEME_FK" FOREIGN KEY ("ZEME_KOD")
	  REFERENCES "ZEME" ("ZEME_KOD") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "FILM_ZEME" ADD CONSTRAINT "FILM_ZEME_ZEME_FK" FOREIGN KEY ("ID_FILMU")
	  REFERENCES "FILM" ("ID_FILMU") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HEREC
--------------------------------------------------------

  ALTER TABLE "HEREC" ADD CONSTRAINT "UMELEC_HEREC" FOREIGN KEY ("ID_HERCE")
	  REFERENCES "UMELEC" ("ID_UMELCE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HRAJE
--------------------------------------------------------

  ALTER TABLE "HRAJE" ADD CONSTRAINT "FILM_HRAJE" FOREIGN KEY ("ID_FILMU")
	  REFERENCES "FILM" ("ID_FILMU") ENABLE;
 
  ALTER TABLE "HRAJE" ADD CONSTRAINT "HEREC_HRAJE" FOREIGN KEY ("ID_HERCE")
	  REFERENCES "HEREC" ("ID_HERCE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REZISER
--------------------------------------------------------

  ALTER TABLE "REZISER" ADD CONSTRAINT "UMELEC_REZISER" FOREIGN KEY ("ID_REZISERA")
	  REFERENCES "UMELEC" ("ID_UMELCE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PREDSTAVENI
--------------------------------------------------------

  ALTER TABLE "PREDSTAVENI" ADD CONSTRAINT "FILM_PREDSTAVENI" FOREIGN KEY ("ID_FILMU")
	  REFERENCES "FILM" ("ID_FILMU") ENABLE;
 
  ALTER TABLE "PREDSTAVENI" ADD CONSTRAINT "SAL_PREDSTAVENII" FOREIGN KEY ("ID_KINO", "CISLO")
	  REFERENCES "SAL" ("ID_KINO", "CISLO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SAL
--------------------------------------------------------

  ALTER TABLE "SAL" ADD CONSTRAINT "SAL_V_KINE" FOREIGN KEY ("ID_KINO")
	  REFERENCES "KINO" ("ID_KINO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table UMELEC
--------------------------------------------------------

  ALTER TABLE "UMELEC" ADD CONSTRAINT "OBCANSTVI" FOREIGN KEY ("ZEME_KOD")
	  REFERENCES "ZEME" ("ZEME_KOD") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table VSTUPENKA
--------------------------------------------------------

  ALTER TABLE "VSTUPENKA" ADD CONSTRAINT "VIP_OSOBA" FOREIGN KEY ("ID_OSOBY")
	  REFERENCES "OSOBA" ("ID_OSOBY") ENABLE;
 
  ALTER TABLE "VSTUPENKA" ADD CONSTRAINT "VIP_VSTUPENKA" FOREIGN KEY ("ID_KINO")
	  REFERENCES "KINO" ("ID_KINO") ENABLE;
 
  ALTER TABLE "VSTUPENKA" ADD CONSTRAINT "VOLNA_VSTUPENKA" FOREIGN KEY ("ID_PREDSTAVENI")
	  REFERENCES "PREDSTAVENI" ("ID_PREDSTAVENI") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ZAMESTNANEC
--------------------------------------------------------

  ALTER TABLE "ZAMESTNANEC" ADD CONSTRAINT "NADRIZENY" FOREIGN KEY ("ID_SEFA")
	  REFERENCES "ZAMESTNANEC" ("ID_ZAM") ON DELETE SET NULL ENABLE;
 
  ALTER TABLE "ZAMESTNANEC" ADD CONSTRAINT "PRACUJE" FOREIGN KEY ("ID_KINO")
	  REFERENCES "KINO" ("ID_KINO") ON DELETE SET NULL ENABLE;
 
  ALTER TABLE "ZAMESTNANEC" ADD CONSTRAINT "ZAMESTNANEC_POZICE" FOREIGN KEY ("ID_POZICE")
	  REFERENCES "PRAC_POZICE" ("ID_POZICE") ENABLE;
