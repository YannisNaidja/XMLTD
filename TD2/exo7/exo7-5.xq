<results> {
  for $user in /gare/usager
  let $count := count(/gare/train/voiture/resa[@id = $user/@id]) return
    if ($count = 2) then
    <usager>
      { string($user/@nom) }
    </usager>
    else()
}
</results>