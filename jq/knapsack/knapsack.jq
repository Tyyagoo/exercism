def knapsack(idx; cap):
  if (idx == -1 or cap == 0) then
    0
  elif (.items[idx].weight > cap) then
    knapsack(idx - 1; cap)
  else
    [
      knapsack(idx - 1; cap),
      .items[idx].value + knapsack(idx - 1; cap - .items[idx].weight)
    ] | max
  end;

knapsack(.items | length - 1; .maximumWeight)
