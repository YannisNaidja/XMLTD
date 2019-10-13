<results> {
  for $voiture in /gare/train/voiture
  return
    if (count($voiture/resa) >= 2) then
      <train>
      { string($voiture/parent::train/@numero) }
      </train>
   }
</results>