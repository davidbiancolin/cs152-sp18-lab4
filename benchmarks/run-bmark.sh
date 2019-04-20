#!/usr/bin/env bash

bmark=$1
one_point_threshold=$2
two_point_threshold=$3
make $bmark.riscv.out > make.out 2> make.err
rc=$!
cat make.out

# Default failing case
result_template="{ \"score\": 0.0}"
if [[ $rc -eq 0 ]]; then
        cycle_count=$(grep -oE 'cycles\s*=\s*[0-9]*' make.out | awk -n '{print $3}')
        instructions=$(grep -oE 'instructions\s*=\s*[0-9]*' make.out | awk -n '{print $3}')

        score=1.0
        if [[ $cycle_count -lt $two_point_threshold ]]; then
           score=3.0
        elif [[ $cycle_count -lt $one_point_threshold ]]; then
           score=2.0
        fi

        result_template="
        { \"score\": ${score},
          \"leaderboard\":
            [
              {\"name\": \"Cycles\", \"value\": ${cycle_count}, \"order\": \"asc\"}
            ]
        }"
else
        echo "Run Failed. Tail of commit log follows:"
        tail -n10 $bmark.riscv.out
fi

echo $result_template >> /autograder/results/results.json
