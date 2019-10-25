CREATE TABLE PRESSE {
	Node varchar(30),
	txtval  varchar(30),
	numval int
};

CREATE TABLE PRESSE_JOURNAL {
	Node varchar(30),
	txtval  varchar(30),
	numval int
};


CREATE TABLE PRESSE_JOURNAL_NOM {
	Node varchar(30),
	txtval  varchar(30),
	numval int
};

CREATE TABLE PRESSE_JOURNAL_DIRECTEUR {
	Node varchar(30),
	txtval  varchar(30),
	numval int
};


CREATE TABLE PRESSE_JOURNAL_DIRECTEUR_NOM {
	Node varchar(30),
	txtval  varchar(30),
	numval int
};



CREATE TABLE PRESSE_JOURNAL_DIRECTEUR_PRENOM {
	Node varchar(30),
	txtval  varchar(30),
	numval int
};


CREATE TABLE PRESSE_JOURNAL_ARTICLE  {
	Node varchar(30),
	txtval  varchar(30),
	numval int
};

CREATE TABLE PRESSE_JOURNAL_ARTICLE_CORPS  {
	Node varchar(30),
	txtval  varchar(30),
	numval int
};


CREATE TABLE PRESSE_JOURNAL_ARTICLE_TITRE  {
	Node varchar(30),
	txtval  varchar(30),
	numval int
};

CREATE TABLE PRESSE_JOURNAL_ARTICLE_AUTEUR  {
	Node varchar(30),
	txtval  varchar(30),
	numval int
};

CREATE TABLE PRESSE_JOURNALISTES {
	Node varchar(30),
	txtval  varchar(30),
	numval int
};


CREATE TABLE PRESSE_JOURNALISTES_JOURNALISTE {
	Node varchar(30),
	txtval  varchar(30),
	numval int
};


CREATE TABLE PRESSE_JOURNALISTES_JOURNALISTE_NOM {
	Node varchar(30),
	txtval  varchar(30),
	numval int
};

CREATE TABLE PRESSE_JOURNALISTES_JOURNALISTE_PRENOM {
	Node varchar(30),
	txtval  varchar(30),
	numval int
};

CREATE TABLE PRESSE_JOURNALISTES_JOURNALISTE_IDJ {
	Node varchar(30),
	txtval  varchar(30),
	numval int
};

CREATE TABLE PRESSE_JOURNALISTES_JOURNALISTE_ANONYMISATION {
	Node varchar(30),
	txtval  varchar(30),
	numval int
};

INSERT INTO PRESSE(Node) VALUES('presse');
INSERT INTO PRESSE_JOURNAL(Node) VALUES('journal1');
INSERT INTO PRESSE_JOURNAL_NOM(Node,txtval) VALUES('nomjournal','CNEWS');
INSERT INTO PRESSE_JOURNAL_DIRECTEUR(Node) VALUES('directeur');
INSERT INTO PRESSE_JOURNAL_DIRECTEUR_NOM(Node,txtval) VALUES('directeurnom','Pepega');
INSERT INTO PRESSE_JOURNAL_DIRECTEUR_PRENOM(Node,txtval) VALUES('directeurprenom','KEKW');
INSERT INTO PRESSE_JOURNAL_DIRECTEUR(Node,txtval) VALUES('directeurprenom','KEKW');
INSERT INTO PRESSE_JOURNAL_ARTICLE(Node) VALUES('article1');
INSERT INTO PRESSE_JOURNAL_ARTICLE_TITRE(Node, txtval) VALUES('titrearticle1', 'fake');
INSERT INTO PRESSE_JOURNAL_ARTICLE_AUTEUR(Node, txtval) VALUES('auteurarticle1', 'j1');
INSERT INTO PRESSE_JOURNAL_ARTICLE_CORPS(Node,txtval) VALUES ('corpsarticle1','fakenews');
INSERT INTO PRESSE_JOURNAL_ARTICLE(Node) VALUES('article2');
INSERT INTO PRESSE_JOURNAL_ARTICLE_TITRE(Node, txtval) VALUES('titrearticle2', 'news');
INSERT INTO PRESSE_JOURNAL_ARTICLE_AUTEUR(Node, txtval) VALUES('auteurarticle2', 'j1');
INSERT INTO PRESSE_JOURNAL_ARTICLE_CORPS(Node,txtval) VALUES ('corpsarticle2',' more fakenews');
INSERT INTO PRESSE_JOURNALISTES(Node) VALUES ('journalistes');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE(Node) VALUES ('journaliste1');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE_NOM(Node,txtval) VALUES ('nomjournaliste1','Vuillard');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE_PRENOM(Node,txtval) VALUES ('prenomjournaliste1','Eric');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE_IDJ(Node,txtval) VALUES ('idjournaliste1', 'j1');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE(Node) VALUES ('journaliste2');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE_NOM(Node,txtval) VALUES ('nomjournaliste2','Dupont');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE_PRENOM(Node,txtval) VALUES ('prenomjournaliste2','Jean');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE_IDJ(Node,txtval) VALUES ('idjournaliste2', 'j2');
INSERT INTO PRESSE_JOURNALISTES_JOURNALISTE_ANONYMISATION(Node,txtval) VALUES ('anonymisation', 'oui');


