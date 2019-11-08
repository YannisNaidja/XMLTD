<results> {
let $minDate := min(/tweeter/tweets/tweet/header/date)
  let $maxDate := max(/tweeter/tweets/tweet/header/date)
  for $tweet in /tweeter/tweets/tweet
  where $tweet/header/date = $minDate or $tweet/header/date = $maxDate
    return $tweet
}
</results>
