-- XPath to SQL

-- Les descriptions d'étage du batiment d'identifiant 0
-- //batiment[@id=0]/description/text()

PROMPT Les descriptions d étage du batiment 0
PROMPT //batiment[@id=0]/description/text()

SELECT DESCRIPTION 
FROM ETAGE
WHERE batimentID = 0;

-- Le nombre de place des salles de l'étage d'identifiant 0 du bâtiment d'identifiant 0
-- //batiment[@id=0]/etage[@id=0]/salle/nombredeplace

PROMPT Le nombre de place des salles de l étage d identifiant 0 du bâtiment d identifiant 0
PROMPT //batiment[@id=0]/etage[@id=0]/salle/nombredeplace

SELECT S.NOMBREDEPLACE
FROM SALLE S JOIN ETAGE E ON S.etageID = E.etageID
WHERE E.batimentID = 0 AND E.etageID = 0;

-- Le nombre de personne travaillant dans des bureaux
-- count(//batiment/etage/bureau/personne)

PROMPT Le nombre de personne travaillant dans des bureaux
PROMPT count(//batiment/etage/bureau/personne)

SELECT count(*)
FROM personne;

-- Le code des bureaux de l étage 1 du bâtiment 0
-- //batiment[@id=0]/etage[@id=1]/bureau/@code

PROMPT Le code des bureaux de l étage 1 du bâtiment 0
PROMPT //batiment[@id=0]/etage[@id=1]/bureau/@code

SELECT B.code
FROM BUREAU B JOIN ETAGE E ON B.etageID = E.etageID
WHERE E.batimentID = 0 AND E.etageID = 1;

-- Le nombre d'etage du bâtiment 0
-- count(//bâtiment[@id=0]/etage)

PROMPT Le nombre d etage du bâtiment 0
PROMPT count(//bâtiment[@id=0]/etage)

SELECT COUNT(*)
FROM ETAGE
WHERE batimentID = 0;

