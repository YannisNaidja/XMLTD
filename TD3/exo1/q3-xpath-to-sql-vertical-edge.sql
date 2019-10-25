
--Vedge

--article ecris par lauteur dont lid vaut j1


SELECT ID.txtval FROM
AUTEURATT ID JOIN JOURNALISTEIDATT JID
WHERE ID.txtval = "j1" and ID.txtval = JID.txtval


--le nom du journal 

SELECT txtval FROM 
NOM N
WHERE N.Source= "journal"


--le nom du directeur 


SELECT txtval FROM 
NOM N
WHERE N.Source= "directeur"
 

-- le titre de tout les articles 

SELECT 	T.txtval FROM 
TITREATT T 

-- le nombre d'article 

SELECT COUNT(J.target)
FROM JOURNAL J 
WHERE J.Ordinal > 2 

-- le nombre de journaliste


SELECT COUNT(J.target)
FROM JOURNALISTES J 
