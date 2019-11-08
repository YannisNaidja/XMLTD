<results> {
  for $voiture in /gare/train/voiture
  where (count($voiture/resa) >= 2)
  return
    <train>
    { string($voiture/parent::train/@numero) }
    </train>
}
</results>