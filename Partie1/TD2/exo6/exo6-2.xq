<results> {
  for $auteur in /tweeter/users/user
  return
  <result>
    <nom>
      { $auteur/user_name/text()}
    </nom> 
    {
      for $tweet in /tweeter/tweets/tweet
      where $auteur/@id = $tweet/@author_ref  
      return $tweet/header/date
    }
  </result>
}
</results>