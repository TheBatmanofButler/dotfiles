#!/bin/sh

temps="$( sensors | grep Core | awk '{print substr($3, 2, length($3)-5)}')"

output=""
warn_temp=60
warn_temp_mult=$(($warn_temp * 4))

arr=($temps)

for element in "${arr[@]}"
do
    element_mult=$(($element * 4))
    if [ "$element_mult" -lt $((warn_temp*1)) ]; then
        output="$output%{F#06d6a0}%{F-} $element°C "

    elif [ "$element_mult" -lt $((warn_temp * 2)) ]; then
        output="$output%{F#bbff3d}%{F-} $element°C "

    elif [ "$element_mult" -lt $((warn_temp * 3)) ]; then
        output="$output%{F#ffc43d}%{F-} $element°C "

    elif [ "$element_mult" -lt $((warn_temp * 4)) ]; then
        output="$output%{F#ff7a3d}%{F-} $element°C "    
    else
        output="$output%{F#ef476f}%{F-} $element°C "
    fi
done

echo "${output::-1}"