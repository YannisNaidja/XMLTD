


CREATE TABLE PRESSE {
	Source varchar(30),
	Target varchar(30),
	Ordinal int,
	txtval  varchar(30),
	numval int
};

CREATE TABLE JOURNAL {
	Source varchar(30),
	Target varchar(30),
	Ordinal int,
	txtval  varchar(30),
	numval int
};


CREATE TABLE ARTICLE {
	Source varchar(30),
	Target varchar(30),
	Ordinal int,
	txtval  varchar(30),
	numval int
};

CREATE TABLE TITREATT {
	Source varchar(30),
	Target varchar(30),
	Ordinal int,
	txtval  varchar(30),
	numval int
};


CREATE TABLE AUTEURATT {
	Source varchar(30),
	Target varchar(30),
	Ordinal int,
	txtval  varchar(30),
	numval int
};


CREATE TABLE CORPS {
	Source varchar(30),
	Target varchar(30),
	Ordinal int,
	txtval  varchar(30),
	numval int
};

CREATE TABLE JOURNALISTES {
	Source varchar(30),
	Target varchar(30),
	Ordinal int,
	txtval  varchar(30),
	numval int
};

CREATE TABLE JOURNALISTE {
	Source varchar(30),
	Target varchar(30),
	Ordinal int,
	txtval  varchar(30),
	numval int
};

CREATE TABLE JOURNALISTEIDATT {
	Source varchar(30),
	Target varchar(30),
	Ordinal int,
	txtval  varchar(30),
	numval int
};


CREATE TABLE ANONYMOUSATT {
	Source varchar(30),
	Target varchar(30),
	Ordinal int,
	txtval  varchar(30),
	numval int
};


CREATE TABLE JOURNALISTEIDATT {
	Source varchar(30),
	Target varchar(30),
	Ordinal int,
	txtval  varchar(30),
	numval int
};


CREATE TABLE PSEUDOATT {
	Source varchar(30),
	Target varchar(30),
	Ordinal int,
	txtval  varchar(30),
	numval int
};


CREATE TABLE NOM {
	Source varchar(30),
	Target varchar(30),
	Ordinal int,
	txtval  varchar(30),
	numval int
};


CREATE TABLE PRENOM {
	Source varchar(30),
	Target varchar(30),
	Ordinal int,
	txtval  varchar(30),
	numval int
};


CREATE TABLE DIRECTEUR {
	Source varchar(30),
	Target varchar(30),
	Ordinal int,
	txtval  varchar(30),
	numval int
};

INSERT INTO PRESSE (Target) VALUES ('presse');
INSERT INTO JOURNAL (Source, Target, Ordinal) VALUES ('presse', 'journal1', 1);
INSERT INTO NOM (Source, Target, Ordinal, txtval) VALUES ('journal1', 'nomjournal1', 1, 'CNEWS');
INSERT INTO DIRECTEUR (Source, Target, Ordinal) VALUES ('journal1', 'directeur1', 1);
INSERT INTO NOM (Source, Target, Ordinal, txtval) VALUES ('directeur1', 'directeur1nom', 1, 'Pepega');
INSERT INTO PRENOM (Source, Target, Ordinal, txtval) VALUES ('directeur', 'directeur1prenom', 2, 'Kekw');
INSERT INTO ARTICLE (Source, Target, Ordinal) VALUES ('journal1', 'article1', 1);
INSERT INTO CORPS (Source, Target, Ordinal, txtval) VALUES ('article1', 'corpsarticle1', 1, 'Des fake news');
INSERT INTO TITREATT (Source, Target, txtval) VALUES ('article1', 'titrearticle1', 'fake');
INSERT INTO AUTEURATT(Source, Target, txtval) VALUES ('article1', 'auteur1', 'j1');
INSERT INTO ARTICLE (Source, Target, Ordinal) VALUES ('journal1', 'article2', 1);
INSERT INTO CORPS (Source, Target, Ordinal, txtval) VALUES ('article2', 'corpsarticle2', 1,' Encore des fake news');
INSERT INTO TITREATT (Source, Target, txtval) VALUES ('article1', 'titrearticle2', 'news');
INSERT INTO AUTEURATT(Source, Target, txtval) VALUES ('article2', 'auteur2', 'j1');
INSERT INTO JOURNALISTES (Source, Target, Ordinal) VALUES ('presse', 'journalistes', 2);
INSERT INTO JOURNALISTE (Source, Target, Ordinal) VALUES ('journalistes','journaliste1', 1);
INSERT INTO JOURNALISTEIDATT (Source, Target, txtval) VALUES ('journaliste1', 'idjournaliste1', 'j1');
INSERT INTO NOM (Source, Target, Ordinal, txtval) VALUES ('journaliste1', 'nomjournaliste1', 1, 'Vuillard');
INSERT INTO PRENOM (Source, Target, Ordinal, txtval) VALUES ('journaliste1', 'prenomjournaliste1', 1, 'Eric');
INSERT INTO JOURNALISTE (Source, Target, Ordinal) VALUES ('journalistes','journaliste2', 2);
INSERT INTO JOURNALISTEIDATT (Source, Target, txtval) VALUES ('journaliste2', 'idjournaliste1', 'j2');
INSERT INTO NOM (Source, Target, Ordinal, txtval) VALUES ('journaliste2', 'nomjournaliste1', 1, 'Dupont');
INSERT INTO PRENOM (Source, Target, Ordinal, txtval) VALUES ('journaliste2', 'prenomjournaliste1', 1, 'Jean');
INSERT INTO ANONYMOUSATT(Source, Target, Ordinal, txtval) VALUES ('journaliste2', 'anonymisation1', 1, 'non');
s




