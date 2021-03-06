DROP TABLE PRESSE;
DROP TABLE PRESSE_JOURNALISTES_JOURNALISTE_ANONYMISATION;
DROP TABLE PRESSE_JOURNALISTES_JOURNALISTE_IDJ;
DROP TABLE PRESSE_JOURNALISTES_JOURNALISTE_PRENOM;
DROP TABLE PRESSE_JOURNALISTES_JOURNALISTE_NOM;
DROP TABLE PRESSE_JOURNALISTES_JOURNALISTE;
DROP TABLE PRESSE_JOURNALISTES;
DROP TABLE PRESSE_JOURNAL_ARTICLE_AUTEUR ;
DROP TABLE PRESSE_JOURNAL_ARTICLE_TITRE ;
DROP TABLE PRESSE_JOURNAL_ARTICLE_CORPS ;
DROP TABLE PRESSE_JOURNAL_ARTICLE ;
DROP TABLE PRESSE_JOURNAL_DIRECTEUR_PRENOM;
DROP TABLE PRESSE_JOURNAL_DIRECTEUR_NOM;
DROP TABLE PRESSE_JOURNAL_DIRECTEUR;
DROP TABLE PRESSE_JOURNAL_NOM;
DROP TABLE PRESSE_JOURNAL;
DROP TABLE PRESSE;

CREATE TABLE PRESSE (
	node int,
	txtval  varchar(30),
	numval int
);
CREATE TABLE PRESSE_JOURNAL (
	node int,
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNAL_NOM (
	node int,
	txtval  varchar(30),
	numval int
);
CREATE TABLE PRESSE_JOURNAL_DIRECTEUR (
	node int,
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNAL_DIRECTEUR_NOM (
	node int,
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNAL_DIRECTEUR_PRENOM (
	node int,
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNAL_ARTICLE  (
	node int,
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNAL_ARTICLE_CORPS  (
	node int,
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNAL_ARTICLE_TITRE  (
	node int,
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNAL_ARTICLE_AUTEUR  (
	node int,
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNALISTES (
	node int,
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNALISTES_JOURNALISTE (
	node int,
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNALISTES_JOURNALISTE_NOM (
	node int,
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNALISTES_JOURNALISTE_PRENOM (
	node int,
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNALISTES_JOURNALISTE_IDJ (
	node int,
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNALISTES_JOURNALISTE_ANONYMISATION (
	node int,
	txtval  varchar(30),
	numval int
);

INSERT INTO PRESSE(node)                                               VALUES(0);
INSERT INTO PRESSE_JOURNAL(node)                                       VALUES(1);
INSERT INTO PRESSE_JOURNAL_NOM(node,txtval)                            VALUES(2,'CNEWS');
INSERT INTO PRESSE_JOURNAL_DIRECTEUR(node)                             VALUES(3);
INSERT INTO PRESSE_JOURNAL_DIRECTEUR_NOM(node,txtval)                  VALUES(4,'Pepega');
INSERT INTO PRESSE_JOURNAL_DIRECTEUR_PRENOM(node,txtval)               VALUES(5,'KEKW');
INSERT INTO PRESSE_JOURNAL_ARTICLE(node)                               VALUES(7);
INSERT INTO PRESSE_JOURNAL_ARTICLE_TITRE(node, txtval)                 VALUES(8, 'fake');
INSERT INTO PRESSE_JOURNAL_ARTICLE_AUTEUR(node, txtval)                VALUES(9, 'j1');
INSERT INTO PRESSE_JOURNAL_ARTICLE_CORPS(node,txtval)                  VALUES (10,'fakenews');
INSERT INTO PRESSE_JOURNAL_ARTICLE(node)                               VALUES(11);
INSERT INTO PRESSE_JOURNAL_ARTICLE_TITRE(node, txtval)                 VALUES(12, 'news');
INSERT INTO PRESSE_JOURNAL_ARTICLE_AUTEUR(node, txtval)                VALUES(13, 'j1');
INSERT INTO PRESSE_JOURNAL_ARTICLE_CORPS(node,txtval)                  VALUES (14,' more fakenews');
INSERT INTO PRESSE_JOURNALISTES(node)                                  VALUES (15);
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE(node)                      VALUES (16);
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE_NOM(node,txtval)           VALUES (17,'Vuillard');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE_PRENOM(node,txtval)        VALUES (18,'Eric');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE_IDJ(node,txtval)           VALUES (19, 'j1');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE(node)                      VALUES (20);
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE_NOM(node,txtval)           VALUES (21,'Dupont');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE_PRENOM(node,txtval)        VALUES (22,'Jean');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE_IDJ(node,txtval)           VALUES (23, 'j2');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE_ANONYMISATION(node,txtval) VALUES (24, 'oui');



