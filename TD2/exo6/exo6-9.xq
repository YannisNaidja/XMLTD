<results> {
  for $tweet in /tweeter/tweets/tweet
  return
    if($tweet/body/user_ref) then
    <result>
      {$tweet}
      <user_references>
	{$tweet/body/user_ref}
      </user_references>
    </result>
}
</results>