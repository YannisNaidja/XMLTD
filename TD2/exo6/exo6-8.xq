<results> {
  for $tweet in /tweeter/tweets/tweet
  where $tweet/body/hashtag
  return
    <result>
      {$tweet}
      <hashtags>
	{$tweet/body/hashtag}
      </hashtags>
    </result>
}
</results>