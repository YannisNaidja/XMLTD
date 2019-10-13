<results> {
  for $auteur in /tweeter/users/user 
  for  $tweet in /tweeter/tweets/tweet
  where $auteur/@id = $tweet/@author_ref  
  return
  <result>
  { $tweet }
  { $auteur }
  </result>  
}
</results>