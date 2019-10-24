# -- /presse/journal/article[auteur=/presse/journalistes[@idJ='j1']]
SELECT *
FROM ARTICLE ART
JOIN AUTEURATT AUT ON ART.Target = AUT.Source
JOIN JOURNALISTEIDATT JID
WHERE JID.txtval = 'j1'
