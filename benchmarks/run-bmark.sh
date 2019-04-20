#!/usr/bin/env bash

result=$(make $1.riscv.out)
rc=$!

cycle_count=$(echo $result | grep -oE 'cycles\s*=\s*[0-9]*' | awk -n '{print $3}') 
instructions=$(echo $result | grep -oE 'instructions\s*=\s*[0-9]*' | awk -n '{print $3}') 

echo $cycle_count
echo $instructions

result_template="
{ \"score\": 2.0,
  \"leaderboard\":
    [
      {\"name\": \"Cycles\", \"value\": ${cycle_count}, \"order\": \"asc\"}
    ]
}"

echo $result_template >> /autograder/results/results.json

exit $!
