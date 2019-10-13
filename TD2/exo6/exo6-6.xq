<results> {
for $tweet in /tweeter/tweets/tweet
return
  if(contains($tweet/body/hashtags, "#I&lt;3XML")) then      
    $tweet
}
</results>