--Requêtes Xquery 
-- Créez une liste de paires tweet-auteur, avec chaque paire contenue dans un element result.
PROMPT Créez une liste de paires tweet-auteur, avec chaque paire contenue dans un element result.

SELECT XMLQUERY('for $auteur in /tweeter/users/user 
  for  $tweet in /tweeter/tweets/tweet
  where $auteur/@id = $tweet/@author_ref  
  return
  <result>
  { $tweet }
  { $auteur }
  </result>' PASSING xml_content RETURNING CONTENT)FROM tweet_CLOB;

-- Listez les utilisateurs de la plateforme en ordre alphabétique.
PROMPT Listez les utilisateurs de la plateforme en ordre alphabétique.
SELECT XMLQUERY('for $user in tweeter/users/user
  order by upper-case($user/user_name/text()) ascending
  return  $user' PASSING xml_content RETURNING CONTENT)FROM tweet_CLOB;

-- Pour chaque utilisateur, listez le nom de l’utilisateur et la date de tous ses tweets, le tout regroupé dansun élément result.
PROMPT Pour chaque utilisateur, listez le nom de l’utilisateur et la date de tous ses tweets, le tout regroupé dansun élément result.

SELECT XMLQUERY('for $auteur in /tweeter/users/user
  return
  <result>
    <nom>
      { $auteur/user_name/text()}
    </nom> 
    {
      for $tweet in /tweeter/tweets/tweet
      where $auteur/@id = $tweet/@author_ref  
      return $tweet/header/date
    }
  </result>' PASSING xml_content RETURNING CONTENT)FROM tweet_CLOB;

-- Listez les utilisateurs qui ont publié un tweet qui a été retwitté au moins deux fois.
PROMPT Listez les utilisateurs qui ont publié un tweet qui a été retwitté au moins deux fois.
SELECT XMLQUERY('for $auteur in /tweeter/users/user
    for $tweet in /tweeter/tweets/tweet
    where $auteur/@id = $tweet/@author_ref and count($tweet/header/retweets/retweet) > 1
    return $auteur' PASSING xml_content RETURNING CONTENT)FROM tweet_CLOB;

-- Pour chaque tweet, listez son contenu et la date de ses deux premières réponses. Rajoutez un element vide \textless nonRetwitted/\textgreater s’il n’a pas été retwitté.
PROMPT Pour chaque tweet, listez son contenu et la date de ses deux premières réponses. Rajoutez un element vide \textless nonRetwitted/\textgreater s’il n’a pas été retwitté.
SELECT XMLQUERY('for $tweet in /tweeter/tweets/tweet
  return
  <tweet>
    <contenu>
      { $tweet/body/text}
    </contenu>
    <premieres-reponses>
      { /tweeter/tweets/tweet[@id=$tweet/header/answers/answer[1]/@ref]/header/date }
      { /tweeter/tweets/tweet[@id=$tweet/header/answers/answer[2]/@ref]/header/date }
    </premieres-reponses>
    {
      if (count($tweet/header/retweets/retweet) = 0) then
	<nonRetwitted />
      else()
    }
  </tweet>' PASSING xml_content RETURNING CONTENT)FROM tweet_CLOB;


















