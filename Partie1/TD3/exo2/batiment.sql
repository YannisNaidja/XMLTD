DELETE FROM PERSONNE;
DELETE FROM SALLE;
DELETE FROM BUREAU;
DELETE FROM ETAGE;
DELETE FROM BATIMENT;

DROP TABLE PERSONNE;
DROP TABLE SALLE;
DROP TABLE BUREAU;
DROP TABLE ETAGE;
DROP TABLE BATIMENT;

CREATE TABLE BATIMENT (
       batimentID int NOT NULL PRIMARY KEY,
       flagRoot int NOT NULL
);

CREATE TABLE ETAGE (
       etageID int NOT NULL PRIMARY KEY,
       batimentID int NOT NULL,
       description varchar(30),
       CONSTRAINT fk_batimentID
       FOREIGN KEY (batimentID)
       REFERENCES BATIMENT (batimentID)
);

CREATE TABLE BUREAU (
       bureauID int NOT NULL PRIMARY KEY,
       etageID int NOT NULL,
       code varchar(10),
       CONSTRAINT fk_bureau_etageID
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
       CONSTRAINT fk_salle_etageID
       FOREIGN KEY (etageID)
       REFERENCES ETAGE (etageID)
);

INSERT INTO BATIMENT (batimentID, flagRoot)          VALUES (0, 1);
INSERT INTO ETAGE (etageID, batimentID, description) VALUES (0, 0, 'descriptionETAGE1');
INSERT INTO ETAGE (etageID, batimentID, description) VALUES (1, 0, 'descriptionETAGE2');
INSERT INTO SALLE (salleID, etageID, nombreDePlace)  VALUES (0, 0, 25);
INSERT INTO SALLE (salleID, etageID, nombreDePlace)  VALUES (1, 0, 50);
INSERT INTO BUREAU (bureauID, etageID, code)         VALUES (0, 1, 'B02');
INSERT INTO PERSONNE (personneID, bureauID)          VALUES (0, 0);
INSERT INTO BUREAU (bureauID, etageID, code)         VALUES (1, 1, 'B03');
INSERT INTO PERSONNE (personneID, bureauID)          VALUES (1, 1);
INSERT INTO PERSONNE (personneID, bureauID)          VALUES (2, 1);
