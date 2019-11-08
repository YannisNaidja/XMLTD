<results> {
  for $auteur in /tweeter/users/user
    for $tweet in /tweeter/tweets/tweet
    where $auteur/@id = $tweet/@author_ref and count($tweet/header/retweets/retweet) > 1
    return $auteur
 }
</results>