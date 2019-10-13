<results> {
  (for $resa in /gare/train/voiture/resa
  order by $resa/@numero descending
  return $resa)[1]
}
</results>