DROP TABLE NODE;

CREATE TABLE NODE (
       begin int NOT NULL,
       end int NOT NULL,
       par int,
       tag varchar(20),
       type varchar(20) NOT NULL
);

INSERT INTO NODE (begin, end, tag, type) VALUES (1, 50, 'batiment', 'ELT');
INSERT INTO NODE                         VALUES (2, 19, 1, 'etage', 'ELT');
INSERT INTO NODE                         VALUES (3, 6, 2, 'description', 'ELT');
INSERT INTO NODE (begin, end, par, type) VALUES (4, 5, 3, 'TEXT');
INSERT INTO NODE                         VALUES (7, 12, 2, 'salle', 'ELT');
INSERT INTO NODE                         VALUES (8, 11, 7, 'nombrePlace', 'ELT');
INSERT INTO NODE (begin, end, par, type) VALUES (9, 10, 8, 'TEXT');
INSERT INTO NODE                         VALUES (13, 18, 2, 'salle', 'ELT');
INSERT INTO NODE                         VALUES (14, 17, 13, 'nombrePlace', 'ELT');
INSERT INTO NODE (begin, end, par, type) VALUES (9, 10, 8, 'TEXT');
INSERT INTO NODE                         VALUES (20, 49, 1, 'etage', 'ELT');
INSERT INTO NODE                         VALUES (21, 24, 20, 'description', 'ELT');
INSERT INTO NODE (begin, end, par, type) VALUES (22, 23, 21, 'TEXT');
INSERT INTO NODE                         VALUES (25, 34, 20, 'bureau', 'ELT');
INSERT INTO NODE                         VALUES (26, 29, 25, 'code', 'ELT');
INSERT INTO NODE (begin, end, par, type) VALUES (27, 28, 26, 'TEXT');
INSERT INTO NODE                         VALUES (30, 33, 25, 'personne', 'ELT');
INSERT INTO NODE (begin, end, par, type) VALUES (31, 32, 30, 'TEXT');
INSERT INTO NODE                         VALUES (35, 48, 20, 'bureau', 'ELT');
INSERT INTO NODE                         VALUES (36, 39, 35, 'code', 'ELT');
INSERT INTO NODE (begin, end, par, type) VALUES (37, 38, 36, 'TEXT');
INSERT INTO NODE                         VALUES (40, 43, 35, 'personne', 'ELT');
INSERT INTO NODE (begin, end, par, type) VALUES (41, 42, 40, 'TEXT');
INSERT INTO NODE                         VALUES (44, 47, 35, 'personne', 'ELT');
INSERT INTO NODE (begin, end, par, type) VALUES (45, 46, 44, 'TEXT');
