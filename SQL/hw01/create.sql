DROP TABLE firma cascade constraints purge;
DROP TABLE inzenyr cascade constraints purge;
DROP TABLE projekt cascade constraints purge;
DROP TABLE ridic cascade constraints purge;
DROP TABLE robot cascade constraints purge;
DROP TABLE stat cascade constraints purge;
DROP TABLE soucastka cascade constraints purge;
DROP TABLE student cascade constraints purge;
DROP TABLE univerzita cascade constraints purge;
DROP TABLE vip_zakaznik cascade constraints purge;
DROP TABLE vuz cascade constraints purge;
DROP TABLE zakaznik cascade constraints purge;
DROP TABLE zamestnanec cascade constraints purge;
DROP TABLE ma cascade constraints purge;
DROP TABLE vytvoren cascade constraints purge;



CREATE TABLE firma (
    id_firma NUMBER NOT NULL,
    id_stat INTEGER NOT NULL,
    nazev VARCHAR(256) NOT NULL
);
ALTER TABLE firma ADD CONSTRAINT pk_firma PRIMARY KEY (id_firma);

CREATE TABLE inzenyr (
    id_zamestnanec INTEGER NOT NULL,
    id_projekt INTEGER NOT NULL,
    cislo_laboratore VARCHAR(256) NOT NULL
);
ALTER TABLE inzenyr ADD CONSTRAINT pk_inzenyr PRIMARY KEY (id_zamestnanec);

CREATE TABLE projekt (
    id_projekt NUMBER NOT NULL,
    nazev VARCHAR(256) NOT NULL
);
ALTER TABLE projekt ADD CONSTRAINT pk_projekt PRIMARY KEY (id_projekt);

CREATE TABLE ridic (
    id_zamestnanec INTEGER NOT NULL,
    id_vuz INTEGER NOT NULL,
    smena INTEGER NOT NULL
);
ALTER TABLE ridic ADD CONSTRAINT pk_ridic PRIMARY KEY (id_zamestnanec);

CREATE TABLE robot (
    id_robot NUMBER NOT NULL,
    id_zakaznik INTEGER,
    cena DECIMAL(10, 1) NOT NULL,
    model VARCHAR(256) NOT NULL,
    pocet_soucastek INTEGER NOT NULL
);
ALTER TABLE robot ADD CONSTRAINT pk_robot PRIMARY KEY (id_robot);

CREATE TABLE soucastka (
    id_soucastka NUMBER NOT NULL,
    id_firma INTEGER NOT NULL,
    id_robot INTEGER,
    id_vuz INTEGER NOT NULL,
    cena DECIMAL(10, 1) NOT NULL,
    cislo INTEGER NOT NULL
);
ALTER TABLE soucastka ADD CONSTRAINT pk_soucastka PRIMARY KEY (id_soucastka);

CREATE TABLE stat (
    id_stat NUMBER NOT NULL,
    nazev VARCHAR(256) NOT NULL
);
ALTER TABLE stat ADD CONSTRAINT pk_stat PRIMARY KEY (id_stat);

CREATE TABLE student (
    id_student NUMBER NOT NULL,
    id_zamestnanec INTEGER NOT NULL,
    jmeno VARCHAR(25) NOT NULL,
    obor VARCHAR(256) NOT NULL,
    plat INTEGER NOT NULL,
    prijmeni VARCHAR(25) NOT NULL,
    rocnik INTEGER
);
ALTER TABLE student ADD CONSTRAINT pk_student PRIMARY KEY (id_student);

CREATE TABLE univerzita (
    id_univerzita NUMBER NOT NULL,
    nazev VARCHAR(256) NOT NULL
);
ALTER TABLE univerzita ADD CONSTRAINT pk_univerzita PRIMARY KEY (id_univerzita);

CREATE TABLE vip_zakaznik (
    id_zakaznik INTEGER NOT NULL,
    sleva DECIMAL(10, 1) NOT NULL
);
ALTER TABLE vip_zakaznik ADD CONSTRAINT pk_vip_zakaznik PRIMARY KEY (id_zakaznik);

CREATE TABLE vuz (
    id_vuz NUMBER NOT NULL,
    cislo INTEGER NOT NULL,
    rozmer VARCHAR(256) NOT NULL
);
ALTER TABLE vuz ADD CONSTRAINT pk_vuz PRIMARY KEY (id_vuz);

CREATE TABLE zakaznik (
    id_zakaznik NUMBER NOT NULL,
    nazev VARCHAR(256) NOT NULL
);
ALTER TABLE zakaznik ADD CONSTRAINT pk_zakaznik PRIMARY KEY (id_zakaznik);

CREATE TABLE zamestnanec (
    id_zamestnanec NUMBER NOT NULL,
    jmeno VARCHAR(25) NOT NULL,
    plat INTEGER NOT NULL,
    prijmeni VARCHAR(25) NOT NULL
);
ALTER TABLE zamestnanec ADD CONSTRAINT pk_zamestnanec PRIMARY KEY (id_zamestnanec);

CREATE TABLE ma (
    id_univerzita INTEGER NOT NULL,
    id_student INTEGER NOT NULL
);
ALTER TABLE ma ADD CONSTRAINT pk_ma PRIMARY KEY (id_univerzita, id_student);

CREATE TABLE vytvoren (
    id_zamestnanec INTEGER NOT NULL,
    id_robot INTEGER NOT NULL
);
ALTER TABLE vytvoren ADD CONSTRAINT pk_vytvoren PRIMARY KEY (id_zamestnanec, id_robot);

ALTER TABLE firma ADD CONSTRAINT fk_firma_stat FOREIGN KEY (id_stat) REFERENCES stat (id_stat) ON DELETE CASCADE;

ALTER TABLE inzenyr ADD CONSTRAINT fk_inzenyr_zamestnanec FOREIGN KEY (id_zamestnanec) REFERENCES zamestnanec (id_zamestnanec) ON DELETE CASCADE;
ALTER TABLE inzenyr ADD CONSTRAINT fk_inzenyr_projekt FOREIGN KEY (id_projekt) REFERENCES projekt (id_projekt) ON DELETE CASCADE;

ALTER TABLE ridic ADD CONSTRAINT fk_ridic_zamestnanec FOREIGN KEY (id_zamestnanec) REFERENCES zamestnanec (id_zamestnanec) ON DELETE CASCADE;
ALTER TABLE ridic ADD CONSTRAINT fk_ridic_vuz FOREIGN KEY (id_vuz) REFERENCES vuz (id_vuz) ON DELETE CASCADE;

ALTER TABLE robot ADD CONSTRAINT fk_robot_zakaznik FOREIGN KEY (id_zakaznik) REFERENCES zakaznik (id_zakaznik) ON DELETE CASCADE;

ALTER TABLE soucastka ADD CONSTRAINT fk_soucastka_firma FOREIGN KEY (id_firma) REFERENCES firma (id_firma) ON DELETE CASCADE;
ALTER TABLE soucastka ADD CONSTRAINT fk_soucastka_robot FOREIGN KEY (id_robot) REFERENCES robot (id_robot) ON DELETE CASCADE;
ALTER TABLE soucastka ADD CONSTRAINT fk_soucastka_vuz FOREIGN KEY (id_vuz) REFERENCES vuz (id_vuz) ON DELETE CASCADE;

ALTER TABLE student ADD CONSTRAINT fk_student_zamestnanec FOREIGN KEY (id_zamestnanec) REFERENCES zamestnanec (id_zamestnanec) ON DELETE CASCADE;

ALTER TABLE vip_zakaznik ADD CONSTRAINT fk_vip_zakaznik_zakaznik FOREIGN KEY (id_zakaznik) REFERENCES zakaznik (id_zakaznik) ON DELETE CASCADE;

ALTER TABLE ma ADD CONSTRAINT fk_ma_univerzit FOREIGN KEY (id_univerzita) REFERENCES univerzita (id_univerzita) ON DELETE CASCADE;
ALTER TABLE ma ADD CONSTRAINT fk_ma_student FOREIGN KEY (id_student) REFERENCES student (id_student) ON DELETE CASCADE;

ALTER TABLE vytvoren ADD CONSTRAINT fk_vytvoren_zamestnane FOREIGN KEY (id_zamestnanec) REFERENCES zamestnanec (id_zamestnanec) ON DELETE CASCADE;
ALTER TABLE vytvoren ADD CONSTRAINT fk_vytvoren_robot FOREIGN KEY (id_robot) REFERENCES robot (id_robot) ON DELETE CASCADE;

--IO check

--IO4
ALTER TABLE ridic ADD CONSTRAINT chk_smena check (smena = 1 or smena = 2);
--IO2
ALTER TABLE robot ADD CONSTRAINT chk_pocet_soucastek check (pocet_soucastek >= 75  and pocet_soucastek <= 500);
--IO1
ALTER TABLE student ADD CONSTRAINT chk_size_name check(length(jmeno) < 25);
ALTER TABLE student ADD CONSTRAINT chk_size_second_name check(length(prijmeni) < 25);
ALTER TABLE zamestnanec ADD CONSTRAINT chk_sizeName check(length(jmeno) < 25);
ALTER TABLE zamestnanec ADD CONSTRAINT chk_sizeSecondName check(length(prijmeni) < 25);

