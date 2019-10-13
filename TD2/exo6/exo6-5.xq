<results> {
  for $user in tweeter/users/user
  order by upper-case($user/user_name/text()) ascending
  return  $user
}
</results>