-- XPath to SQL - Vertical Edge

-- Le nom du journal 
-- /presse/journal/nom
PROMPT Le nom du journal
PROMPT /presse/journal/nom

SELECT N.txtval
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

SELECT N.txtval
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
SELECT T.txtval
FROM PRESSE  P,
     JOURNAL J,
     ARTICLE A,
     TITRE   T
WHERE P.Target = J.Source
AND   J.Target = A.Source
AND   A.Target = T.Source;

-- SELECT     T.txtval FROM 
-- TITREATT T 

-- -- le nombre d'article 

-- SELECT COUNT(J.target)
-- FROM JOURNAL J 
-- WHERE J.Ordinal > 2 

-- -- le nombre de journaliste


-- SELECT COUNT(J.target)
-- FROM JOURNALISTES J 

-- -- Les identifiants des journalistes
-- --TODO: 
