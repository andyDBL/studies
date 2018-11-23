create user airways identified by ZA;
grant dba to airways;

create table VOLPREVU(
    idVolP VARCHAR(10) PRIMARY KEY,
    avionPrevu VARCHAR(10),
    dateDepart timestamp,
    duree DECIMAL,
    lieuDepart VARCHAR(30),
    lieuArrivee VARCHAR(30),
    nbEscale INTEGER
);
create table VOLREALISE(
    idVolR VARCHAR(10) PRIMARY KEY,
    idVolP VARCHAR(10),
    avion VARCHAR(10),
    dateDepart timestamp,
    dateArrivee timestamp,
    nbPassager INTEGER
);
create table PASSAGER(
    idPassager VARCHAR(10) PRIMARY KEY,
    nom VARCHAR(30),
    prenom VARCHAR(30)
);
create table TARIF(
    idTarif VARCHAR(10) PRIMARY KEY,
    classe VARCHAR(20),
    prix DECIMAL
);
create table TRAJET(
    idTrajet VARCHAR(10) PRIMARY KEY,
    lieuDepart VARCHAR(30),
    lieuArrivee VARCHAR(30),
    nbPassager INTEGER,
    idVolR VARCHAR(10),
    dateDepart timestamp,
    dateArrivee timestamp
);
create table ESCALE(
    idEscale VARCHAR(10) PRIMARY KEY,
    idVolR VARCHAR(10)
);
create table CHANGEMENTVOL(
    idChange VARCHAR(10) PRIMARY KEY,
    idClient VARCHAR(10),
    idTrajet VARCHAR(10),
    idTarif VARCHAR(10),
    poidsTotal DECIMAL
);
create table AVION(
    idAvion VARCHAR(10) PRIMARY KEY,
    nom VARCHAR(10),
    reservoir DECIMAL,
    capacitePersonne INTEGER,
    poidsMax DECIMAL,
    consommation DECIMAL,
    vitesse DECIMAL
);
create table SIEGE(
    idSiege VARCHAR(10) PRIMARY KEY,
    idAvion VARCHAR(10),
    idTarif VARCHAR(10)
);
create table RAVITAILLEMENT(
    idRav VARCHAR(10) PRIMARY KEY,
    idLieu VARCHAR(10),
    idVol VARCHAR(10),
    volume DECIMAL,
    dateRav timestamp
);
create table LIEU(
    idLieu VARCHAR(10) PRIMARY KEY,
    nomLieu VARCHAR(10),
    tarifCarbu DECIMAL
);

-- FOREIGN KEYS
ALTER TABLE VOLPREVU 
    ADD CONSTRAINT avion_pv
    FOREIGN KEY (avionPrevu)
    REFERENCES AVION (idAvion);

ALTER TABLE VOLREALISE
    ADD CONSTRAINT vol_p
    FOREIGN KEY (idVolP)
    REFERENCES VOLPREVU (idVolP);

ALTER TABLE VOLREALISE
    ADD CONSTRAINT avion_rv
    FOREIGN KEY (avion)
    REFERENCES AVION (idAvion);

ALTER TABLE TRAJET
    ADD CONSTRAINT vol_r
    FOREIGN KEY (idVolR)
    REFERENCES VOLREALISE (idVolR);

ALTER TABLE ESCALE
    ADD CONSTRAINT vol_er
    FOREIGN KEY (idVolR)
    REFERENCES VOLREALISE (idVolR);

ALTER TABLE CHANGEMENTVOL
    ADD CONSTRAINT client_cv
    FOREIGN KEY (idClient)
    REFERENCES PASSAGER (idPassager);

ALTER TABLE CHANGEMENTVOL
    ADD CONSTRAINT trajet_cv
    FOREIGN KEY (idTrajet)
    REFERENCES TRAJET (idTrajet);

ALTER TABLE CHANGEMENTVOL
    ADD CONSTRAINT tarif_cv
    FOREIGN KEY (idTarif)
    REFERENCES TARIF (idTarif);

ALTER TABLE SIEGE
    ADD CONSTRAINT  avion_sg
    FOREIGN KEY (idAvion)
    REFERENCES AVION (idAvion);

ALTER TABLE SIEGE
    ADD CONSTRAINT tarif_sg
    FOREIGN KEY (idTarif)
    REFERENCES TARIF (idTarif);

ALTER TABLE RAVITAILLEMENT
    ADD CONSTRAINT lieu_rv
    FOREIGN KEY (idLieu)
    REFERENCES LIEU (idLieu);

ALTER TABLE RAVITAILLEMENT
    ADD CONSTRAINT vol_rv
    FOREIGN KEY (idVol)
    REFERENCES VOLREALISE (idVol);

--                  SEQUENCES
create sequence volPrevu_sequence start with 1;
create sequence volRealise_sequence start with 1;
create sequence passager_sequence start with 1;
create sequence tarif_sequence start with 1;
create sequence trajet_sequence start with 1;
create sequence escale_sequence start with 1;
create sequence changementVol_sequence start with 1;
create sequence avion_sequence start with  1;
create sequence siege_sequence start with 1;
create sequence ravitaillement_sequence start with 1;
create sequence lieu_sequence start with 1;

--                  INSERTION 
INSERT INTO AVION VALUES(avion_sequence.nextval,'A300',);