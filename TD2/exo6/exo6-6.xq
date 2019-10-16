<results> {
for $tweet in /tweeter/tweets/tweet
where $tweet/body/hashtag[contains(., "#I&lt;3XML")]
return $tweet
}
</results>