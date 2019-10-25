-- XPath to SQL - Vertical Edge

-- Le nom du journal 
-- /presse/journal/nom
PROMPT Le nom du journal
PROMPT /presse/journal/nom

SELECT txtval nom_journal
FROM   PRESSE_JOURNAL_NOM;

--le nom du directeur
-- /presse/journal/directeur/nom
PROMPT le nom du directeur
PROMPT /presse/journal/directeur/nom

SELECT txtval nom_directeur
FROM PRESSE_JOURNAL_DIRECTEUR_NOM;

-- le titre de tout les articles 
-- /presse/journal/article/@titre
PROMPT le titre de tout les articles 
PROMPT /presse/journal/article/@titre

SELECT txtval titre_article
FROM PRESSE_JOURNAL_ARTICLE_TITRE;

-- le nombre d'article 
-- /presse/journal/count(article)
PROMPT le nombre d article 
PROMPT /presse/journal/count(article)

SELECT COUNT(A.node) nombre_d_article
FROM PRESSE_JOURNAL_ARTICLE A;


-- Les identifiants des journalistes
-- /presse/journal/journalistes/journaliste/@idJ
PROMPT Les identifiants des journalistes
PROMPT /presse/journal/journalistes/journaliste/@idJ

SELECT txtval identifiant_de_journaliste
FROM PRESSE_JOURNALISTES_JOURNALISTE_IDJ;
