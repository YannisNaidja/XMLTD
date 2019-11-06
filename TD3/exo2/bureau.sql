DROP TABLE BATIMENT;
DROP TABLE ETAGE;
DROP TABLE BUREAU;
DROP TABLE PERSONNE;
DROP TABLE SALLE;

CREATE TABLE BATIMENT (
       batimentID int NOT NULL PRIMARY KEY,
       flagRoot int NOT NULL
);

CREATE TABLE ETAGE (
       etageID int NOT NULL PRIMARY KEY,
       batimentID int NOT NULL,
       description: varchar(30),
       CONSTRAINT fk_batimentID
       FOREIGN KEY (batimentID)
       REFERENCES BATIMENT (batimentID)
);

CREATE TABLE BUREAU (
       bureauID int NOT NULL PRIMARY KEY,
       etageID int NOT NULL,
       code varchar(10),
       CONSTRAINT fk_etageID
       FOREIGN KEY (etageID)
       REFERENCES ETAGE (etageID)
);

CREATE TABLE PERSONNE (
       personneID int NOT NULL PRIMARY KEY,
       bureauID int NOT NULL,
       CONSTRAINT fk_bureauID
       FOREIGN KEY (bureauID)
       REFERENCES BUREAU (bureauID)
);

CREATE TABLE SALLE (
       salleID int NOT NULL PRIMARY KEY,
       etageID int NOT NULL,
       nombreDePlace int,
       CONSTRAINT fk_etageID
       FOREIGN KEY (etageID)
       REFERENCES ETAGE (etageID)
);
