


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
INSERT INTO JOURNAL (Source,Target,Ordinal) VALUES ('presse','nomjournal',1);
INSERT INTO JOURNAL (Source,Target,Ordinal) VALUES ('presse','directeur',2);
INSERT INTO JOURNAL (Source,Target,Ordinal) VALUES ('presse','article1',3);
INSERT INTO JOURNAL (Source,Target,Ordinal) VALUES ('presse','article2',4);
INSERT INTO NOM (Source,Target,Ordinal,txtval) VALUES ('journal','nomjournal',1,'CNEWS');
INSERT INTO NOM (Source,Target,Ordinal,txtval) VALUES ('directeur','directeurnom',1,'Pepega');
INSERT INTO PRENOM (Source,Target,Ordinal,txtval) VALUES ('directeur','directeurprenom',2,'Kekw');
INSERT INTO ARTICLE(Source,Target,Ordinal) VALUES ('journal','corpsart1',1);
INSERT INTO ARTICLE(Source,Target,Ordinal) VALUES ('journal','corpsart2',1);
INSERT INTO CORPS(Source,Target,Ordinal,txtval) VALUES ('article1','corpsart1',1,'fakenews');
INSERT INTO CORPS(Source,Target,Ordinal,txtval) VALUES ('article2','corpsart2',1,' more fakenews');
INSERT INTO DIRECTEUR (Source,Target,Ordinal) VALUES ('journal','directeurnom',1);
INSERT INTO DIRECTEUR (Source,Target,Ordinal) VALUES ('journal','directeurprenom',2);
INSERT INTO JOURNALISTES(Source,Target,Ordinal) VALUES ('presse','journaliste1',2);
INSERT INTO JOURNALISTE(Source,Target,Ordinal) VALUES ('journalistes','nomjournaliste1'1);
INSERT INTO JOURNALISTE(Source,Target,Ordinal) VALUES ('journalistes','prenomjournaliste1',2);
INSERT INTO NOM(Source,Target,Ordinal,txtval) VALUES ('journaliste1','nomjournaliste1',1,'Vuillard');
INSERT INTO PRENOM(Source,Target,Ordinal,txtval) VALUES ('journaliste1','prenomjournaliste1',1,'Eric');

INSERT INTO JOURNALISTEIDATT(Source,Target,Ordinal,txtval) VALUES ('journalistes','journaliste1',1,'j1');
INSERT INTO TITREATT(Source,Target,Ordinal,txtval) VALUES ('journal','article1',1,'badarticle1');
INSERT INTO TITREATT(Source,Target,Ordinal,txtval) VALUES ('journal','article2',2,'badarticle2');
INSERT INTO AUTEURATT(Source,Target,Ordinal,txtval) VALUES ('journal','article1',1,'j1');
INSERT INTO AUTEURATT(Source,Target,Ordinal,txtval) VALUES ('journal','article2',2,'j1');
INSERT INTO ANONYMOUSATT(Source,Target,Ordinal,txtval) VALUES ('journalistes','journaliste1',1,'non');





