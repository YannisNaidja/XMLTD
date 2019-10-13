<results> {
  for $tweet in /tweeter/tweets/tweet
  return
    if($tweet/body/hashtag) then
    <result>
      {$tweet}
      <hashtags>
	{$tweet/body/hashtag}
      </hashtags>
    </result>
}
</results>