<results> {
  for $tweet in /tweeter/tweets/tweet
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
    }
  </tweet>  
}
</results>