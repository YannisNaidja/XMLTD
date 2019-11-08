-- TD3 - exercice 4.4

-- Les ancetres des tweets
-- /tweeter/tweets/ancestor::node()
PROMPT Les ancetres des tweets
PROMPT /tweeter/tweets/ancestor::node()

SELECT N3.*
FROM NODE N1, NODE N2, NODE N3
WHERE N1.tag = 'tweeter'   AND
      N2.tag = 'tweets'    AND
      N2.parent = N1.begin AND
      N2.begin > N3.begin  AND
      N2.end < N3.end;

-- Les prenoms des utilisateurs
-- /tweeter/users/user/child::first_name
PROMPT Les prenoms des utilisateurs
PROMPT /tweeter/users/user/child::first_name

SELECT N4.*
FROM NODE N1, NODE N2, NODE N3, NODE N4
WHERE N1.tag = 'tweeter'    AND
      N2.tag = 'users'      AND
      N3.tag = 'user'       AND
      N4.tag = 'first_name' AND
      N2.parent = N1.begin  AND
      N3.parent = N2.begin  AND
      N4.parent = N3.begin;

-- Les descendants des en-têtes de tweets
-- /tweeter/tweets/tweet/header/descendant::node()
PROMPT Les descendants des en-têtes de tweets
PROMPT /tweeter/tweets/tweet/header/descendant::node()

SELECT N5.*
FROM NODE N1, NODE N2, NODE N3, NODE N4, NODE N5
WHERE N1.tag = 'tweeter'   AND
      N2.tag = 'tweets'    AND
      N3.tag = 'tweet'     AND
      N4.tag = 'header'    AND
      N2.parent = N1.begin AND
      N3.parent = N2.begin AND
      N4.parent = N3.begin AND
      N4.begin < N5.begin  AND
      N4.end   > N5.end;

-- Le frere suivant de users si le nom de balise est tweets
-- /tweeter/users/following-sibling::tweets
PROMPT Le frere suivant de users si le nom de balise est tweets
PROMPT /tweeter/users/following-sibling::tweets

SELECT N3.*
FROM NODE N1, NODE N2, NODE N3
WHERE N1.tag = 'tweeter'    AND
      N2.tag = 'users'      AND
      N3.tag = 'tweets'     AND
      N2.parent = N3.parent AND
      N3.begin > N2.end;

-- Le frère précedent de tweets dont le nom est users
-- /tweeter/tweets/preceding-sibling::users
PROMPT Le frère précedent de tweets dont le nom est users
PROMPT /tweeter/tweets/preceding-sibling::users

SELECT N3.*
FROM NODE N1, NODE N2, NODE N3
WHERE N1.tag = 'tweeter'    AND
      N2.tag = 'tweets'     AND
      N3.tag = 'users'      AND
      N2.parent = N3.parent AND
      N3.end < N2.begin;

-- Les noeuds parents des noeuds dont le nom de balise est offset et dont les ancestres sont dans l ordre ascendant timezone, header, tweet, tweets et tweeter
-- /tweeter/tweets/tweet/header/timezone/parent::*
PROMPT Les noeuds parents des noeuds dont le nom de balise est offset et dont les ancestres sont dans l ordre ascendant timezone, header, tweet, tweets et tweeter
PROMPT /tweeter/tweets/tweet/header/timezone/parent::*

SELECT N7.*
FROM NODE N1, NODE N2, NODE N3, NODE N4, NODE N5, NODE N6, NODE N7
WHERE N1.tag = 'tweeter'   AND
      N2.tag = 'tweets'    AND
      N3.tag = 'tweet'     AND
      N4.tag = 'header'    AND
      N5.tag = 'timezone'  AND
      N6.tag = 'offset'    AND
      N2.parent = N1.begin AND
      N3.parent = N2.begin AND
      N4.parent = N3.begin AND
      N5.parent = N4.begin AND
      N6.parent = N5.begin AND
      N7.begin  = N6.parent;
