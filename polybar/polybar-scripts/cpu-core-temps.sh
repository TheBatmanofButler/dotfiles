#!/bin/sh

temps="$( sensors | grep Core | awk '{print substr($3, 2, length($3)-5)}')"

output=""
warn_temp=60
warn_temp_mult=$(($warn_temp * 4))

arr=($temps)

for element in "${arr[@]}"
do
    element_mult=$(($element * 5))
    num_spaces=$((4-${#element}))
    spacing=$(printf "%*s%s" $num_spaces)
    
    if [ "$element_mult" -lt $((warn_temp*2)) ]; then
        output="$output%{F#06d6a0}%{F-}$spacing$element°C  "

    elif [ "$element_mult" -lt $((warn_temp * 3)) ]; then
        output="$output%{F#bbff3d}%{F-}$spacing$element°C  "

    elif [ "$element_mult" -lt $((warn_temp * 4)) ]; then
        output="$output%{F#ffc43d}%{F-}$spacing$element°C  "
    else
        output="$output%{F#ef476f}%{F-}$spacing$element°C  "
    fi
done

echo "${output::-2}"
