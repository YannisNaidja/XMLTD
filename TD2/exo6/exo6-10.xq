declare function local:aReponduAuTweet($tweet)
{
  for $user in $tweet/parent::tweets/parent::tweeter/child::users/child::user
    where $user/@id = $tweet/parent::tweets/child::tweet[@id = $tweet/header/answers/answer/@ref]/@author_ref
    return $user
};

<results> {
for $tweet in /tweeter/tweets/tweet
return
  <tweet id="{ $tweet/@id }">
  { local:aReponduAuTweet($tweet) }
  </tweet>
}
</results>