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
	node varchar(30),
	txtval  varchar(30),
	numval int
);
CREATE TABLE PRESSE_JOURNAL (
	node varchar(30),
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNAL_NOM (
	node varchar(30),
	txtval  varchar(30),
	numval int
);
CREATE TABLE PRESSE_JOURNAL_DIRECTEUR (
	node varchar(30),
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNAL_DIRECTEUR_NOM (
	node varchar(30),
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNAL_DIRECTEUR_PRENOM (
	node varchar(30),
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNAL_ARTICLE  (
	node varchar(30),
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNAL_ARTICLE_CORPS  (
	node varchar(30),
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNAL_ARTICLE_TITRE  (
	node varchar(30),
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNAL_ARTICLE_AUTEUR  (
	node varchar(30),
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNALISTES (
	node varchar(30),
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNALISTES_JOURNALISTE (
	node varchar(30),
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNALISTES_JOURNALISTE_NOM (
	node varchar(30),
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNALISTES_JOURNALISTE_PRENOM (
	node varchar(30),
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNALISTES_JOURNALISTE_IDJ (
	node varchar(30),
	txtval  varchar(30),
	numval int
);

CREATE TABLE PRESSE_JOURNALISTES_JOURNALISTE_ANONYMISATION (
	node varchar(30),
	txtval  varchar(30),
	numval int
);

INSERT INTO PRESSE(node) VALUES('presse');
INSERT INTO PRESSE_JOURNAL(node) VALUES('journal1');
INSERT INTO PRESSE_JOURNAL_NOM(node,txtval) VALUES('nomjournal','CNEWS');
INSERT INTO PRESSE_JOURNAL_DIRECTEUR(node) VALUES('directeur');
INSERT INTO PRESSE_JOURNAL_DIRECTEUR_NOM(node,txtval) VALUES('directeurnom','Pepega');
INSERT INTO PRESSE_JOURNAL_DIRECTEUR_PRENOM(node,txtval) VALUES('directeurprenom','KEKW');
INSERT INTO PRESSE_JOURNAL_DIRECTEUR(node,txtval) VALUES('directeurprenom','KEKW');
INSERT INTO PRESSE_JOURNAL_ARTICLE(node) VALUES('article1');
INSERT INTO PRESSE_JOURNAL_ARTICLE_TITRE(node, txtval) VALUES('titrearticle1', 'fake');
INSERT INTO PRESSE_JOURNAL_ARTICLE_AUTEUR(node, txtval) VALUES('auteurarticle1', 'j1');
INSERT INTO PRESSE_JOURNAL_ARTICLE_CORPS(node,txtval) VALUES ('corpsarticle1','fakenews');
INSERT INTO PRESSE_JOURNAL_ARTICLE(node) VALUES('article2');
INSERT INTO PRESSE_JOURNAL_ARTICLE_TITRE(node, txtval) VALUES('titrearticle2', 'news');
INSERT INTO PRESSE_JOURNAL_ARTICLE_AUTEUR(node, txtval) VALUES('auteurarticle2', 'j1');
INSERT INTO PRESSE_JOURNAL_ARTICLE_CORPS(node,txtval) VALUES ('corpsarticle2',' more fakenews');
INSERT INTO PRESSE_JOURNALISTES(node) VALUES ('journalistes');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE(node) VALUES ('journaliste1');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE_NOM(node,txtval) VALUES ('nomjournaliste1','Vuillard');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE_PRENOM(node,txtval) VALUES ('prenomjournaliste1','Eric');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE_IDJ(node,txtval) VALUES ('idjournaliste1', 'j1');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE(node) VALUES ('journaliste2');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE_NOM(node,txtval) VALUES ('nomjournaliste2','Dupont');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE_PRENOM(node,txtval) VALUES ('prenomjournaliste2','Jean');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE_IDJ(node,txtval) VALUES ('idjournaliste2', 'j2');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE_ANONYMISATION(node,txtval) VALUES ('anonymisation', 'oui');



