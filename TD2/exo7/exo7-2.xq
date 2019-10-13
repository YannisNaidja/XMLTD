<results> {
  let $resa :=  /gare/train/voiture/resa
  for $user in /gare/usager
  where $user/@id = $resa/@id
  return
    <usager>
      { string($user/@nom) }
    </usager>
}
</results>