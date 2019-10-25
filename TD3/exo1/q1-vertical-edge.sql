DROP TABLE PRESSE;
DROP TABLE DIRECTEUR;
DROP TABLE PRENOM;
DROP TABLE NOM;
DROP TABLE PSEUDO;
DROP TABLE ANONYMOUS;
DROP TABLE JOURNALISTEID;
DROP TABLE JOURNALISTE;
DROP TABLE JOURNALISTES;
DROP TABLE CORPS;
DROP TABLE AUTEUR;
DROP TABLE TITRE;
DROP TABLE ARTICLE;
DROP TABLE JOURNAL;


CREATE TABLE PRESSE (
	source int,
	target int NOT NULL PRIMARY KEY,
	ordinal int,
	txtval  varchar(30),
	numval int,
);

CREATE TABLE JOURNAL (
	source int,
	target int NOT NULL PRIMARY KEY,
	ordinal int,
	txtval  varchar(30),
	numval int
);

CREATE TABLE ARTICLE (
	source int,
	target int NOT NULL PRIMARY KEY,
	ordinal int,
	txtval  varchar(30),
	numval int
);
CREATE TABLE TITRE (
	source int,
	target int NOT NULL PRIMARY KEY,
	ordinal int,
	txtval  varchar(30),
	numval int
);

CREATE TABLE AUTEUR (
	source int,
	target int NOT NULL PRIMARY KEY,
	ordinal int,
	txtval  varchar(30),
	numval int
);

CREATE TABLE CORPS (
	source int,
	target int NOT NULL PRIMARY KEY,
	ordinal int,
	txtval  varchar(30),
	numval int
);
CREATE TABLE JOURNALISTES (
	source int,
	target int NOT NULL PRIMARY KEY,
	ordinal int,
	txtval  varchar(30),
	numval int
);
CREATE TABLE JOURNALISTE (
	source int,
	target int NOT NULL PRIMARY KEY,
	ordinal int,
	txtval  varchar(30),
	numval int
);
CREATE TABLE JOURNALISTEID (
	source int,
	target int NOT NULL PRIMARY KEY,
	ordinal int,
	txtval  varchar(30),
	numval int
);

CREATE TABLE ANONYMOUS (
	source int,
	target int NOT NULL PRIMARY KEY,
	ordinal int,
	txtval  varchar(30),
	numval int
);
CREATE TABLE PSEUDO (
	source int,
	target int NOT NULL PRIMARY KEY,
	ordinal int,
	txtval  varchar(30),
	numval int
);

CREATE TABLE NOM (
	source int,
	target int NOT NULL PRIMARY KEY,
	ordinal int,
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRENOM (
	source int,
	target int NOT NULL PRIMARY KEY,
	ordinal int,
	txtval  varchar(30),
	numval int
);

CREATE TABLE DIRECTEUR (
	source int,
	target int NOT NULL PRIMARY KEY,
	ordinal int,
	txtval  varchar(30),
	numval int
);

INSERT INTO PRESSE (target)                            VALUES (0);
INSERT INTO JOURNAL (source, target, ordinal)          VALUES (0, 1, 1);
INSERT INTO NOM (source, target, ordinal, txtval)      VALUES (1, 2, 1, 'CNEWS');
INSERT INTO DIRECTEUR (source, target, ordinal)        VALUES (1, 3, 1);
INSERT INTO NOM (source, target, ordinal, txtval)      VALUES (3, 4, 1, 'Pepega');
INSERT INTO PRENOM (source, target, ordinal, txtval)   VALUES (5, 6, 2, 'Kekw');
INSERT INTO ARTICLE (source, target, ordinal)          VALUES (1, 7, 1);
INSERT INTO CORPS (source, target, ordinal, txtval)    VALUES (7, 9, 1, 'Des fake news');
INSERT INTO TITRE (source, target, txtval)             VALUES (7, 10, 'fake');
INSERT INTO AUTEUR(source, target, txtval)             VALUES (7, 14, 'j1');
INSERT INTO ARTICLE (source, target, ordinal)          VALUES (1, 8, 1);
INSERT INTO CORPS (source, target, ordinal, txtval)    VALUES (8, 11, 1,' Encore des fake news');
INSERT INTO TITRE (source, target, txtval)             VALUES (7, 12, 'news');
INSERT INTO AUTEUR(source, target, txtval)             VALUES (8, 15, 'j1');
INSERT INTO JOURNALISTES (source, target, ordinal)     VALUES (0, 13, 2);
INSERT INTO JOURNALISTE (source, target, ordinal)      VALUES (13,14, 1);
INSERT INTO JOURNALISTEID (source, target, txtval)     VALUES (14, 16, 'j1');
INSERT INTO NOM (source, target, ordinal, txtval)      VALUES (14, 17, 1, 'Vuillard');
INSERT INTO PRENOM (source, target, ordinal, txtval)   VALUES (14, 18, 1, 'Eric');
INSERT INTO JOURNALISTE (source, target, ordinal)      VALUES (13,15, 2);
INSERT INTO JOURNALISTEID (source, target, txtval)     VALUES (15, 20, 'j2');
INSERT INTO NOM (source, target, ordinal, txtval)      VALUES (15, 20, 1, 'Dupont');
INSERT INTO PRENOM (source, target, ordinal, txtval)   VALUES (15, 21, 1, 'Jean');
INSERT INTO ANONYMOUS(source, target, ordinal, txtval) VALUES (15, 22, 1, 'non');
