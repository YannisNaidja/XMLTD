-- XPath to SQL - Vertical Edge

-- Le nom du journal 
-- /presse/journal/nom
PROMPT Le nom du journal
PROMPT /presse/journal/nom

SELECT N.txtval nom_journal
FROM PRESSE  P,
     JOURNAL J,
     NOM     N
WHERE
       P.Target = J.Source
AND    J.Target = N.Source;

--le nom du directeur
-- /presse/journal/directeur/nom
PROMPT le nom du directeur
PROMPT /presse/journal/directeur/nom

SELECT N.txtval nom_directeur
FROM PRESSE    P,
     JOURNAL   J,
     DIRECTEUR D,
     NOM       N
WHERE
       P.Target = J.Source
AND    J.Target = D.Source
AND    D.Target = N.Source;

-- le titre de tout les articles 
-- /presse/journal/article/@titre
PROMPT le titre de tout les articles 
PROMPT /presse/journal/article/@titre

SELECT T.txtval titre_article
FROM PRESSE  P,
     JOURNAL J,
     ARTICLE A,
     TITRE   T
WHERE P.Target = J.Source
AND   J.Target = A.Source
AND   A.Target = T.Source;

-- le nombre d'article 
-- /presse/journal/count(article)
PROMPT le nombre d article 
PROMPT /presse/journal/count(article)

SELECT COUNT(A.Target) nombre_d_article
FROM PRESSE  P,
     JOURNAL J,
     ARTICLE A
WHERE P.Target = J.Source
AND   J.Target = A.Source;

-- Les identifiants des journalistes
-- /presse/journal/journalistes/journaliste/@idJ
PROMPT Les identifiants des journalistes
PROMPT /presse/journal/journalistes/journaliste/@idJ

SELECT J3.txtval identifiant_de_journaliste
FROM PRESSE        P,
     JOURNALISTES  J1,
     JOURNALISTE   J2,
     JOURNALISTEID J3
WHERE P.Target = J1.Source
AND   J1.Target = J2.Source
AND   J2.Target = J3.Source;
