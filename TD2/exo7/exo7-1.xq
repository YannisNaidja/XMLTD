<results> {
  for $train in /gare/train
    where $train/voiture/bar
  return
    <numero>
      {$train/@numero}
    </numero>
}
</results>