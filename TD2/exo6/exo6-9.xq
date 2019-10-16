<results> {
  for $tweet in /tweeter/tweets/tweet
  where $tweet/body/user_ref
  return
    <result>
      {$tweet}
      <user_references>
	{$tweet/body/user_ref}
      </user_references>
    </result>
}
</results>