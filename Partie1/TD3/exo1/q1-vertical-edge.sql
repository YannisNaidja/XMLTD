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
	numval int
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
INSERT INTO PRENOM (source, target, ordinal, txtval)   VALUES (3, 5, 2, 'Kekw');
INSERT INTO ARTICLE (source, target, ordinal)          VALUES (1, 7, 1);
INSERT INTO CORPS (source, target, ordinal, txtval)    VALUES (7, 10, 1, 'Des fake news');
INSERT INTO TITRE (source, target, txtval)             VALUES (7, 8, 'fake');
INSERT INTO AUTEUR(source, target, txtval)             VALUES (7, 9, 'j1');
INSERT INTO ARTICLE (source, target, ordinal)          VALUES (1, 11, 1);
INSERT INTO CORPS (source, target, ordinal, txtval)    VALUES (11, 14, 1,' Encore des fake news');
INSERT INTO TITRE (source, target, txtval)             VALUES (11, 12, 'news');
INSERT INTO AUTEUR(source, target, txtval)             VALUES (11, 13, 'j1');
INSERT INTO JOURNALISTES (source, target, ordinal)     VALUES (0, 15, 2);
INSERT INTO JOURNALISTE (source, target, ordinal)      VALUES (15, 16, 1);
INSERT INTO JOURNALISTEID (source, target, txtval)     VALUES (16, 19, 'j1');
INSERT INTO NOM (source, target, ordinal, txtval)      VALUES (16, 17, 1, 'Vuillard');
INSERT INTO PRENOM (source, target, ordinal, txtval)   VALUES (16, 18, 1, 'Eric');
INSERT INTO JOURNALISTE (source, target, ordinal)      VALUES (15, 20, 2);
INSERT INTO JOURNALISTEID (source, target, txtval)     VALUES (20, 23, 'j2');
INSERT INTO NOM (source, target, ordinal, txtval)      VALUES (20, 21, 1, 'Dupont');
INSERT INTO PRENOM (source, target, ordinal, txtval)   VALUES (20, 22, 1, 'Jean');
INSERT INTO ANONYMOUS(source, target, ordinal, txtval) VALUES (20, 24, 1, 'non');
