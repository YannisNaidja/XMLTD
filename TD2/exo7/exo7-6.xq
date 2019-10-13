<results> {
  let $resa :=  /gare/train/voiture/resa
  for $user in /gare/usager
  where not($user/@id = $resa/@id)
  return $user
}
</results>