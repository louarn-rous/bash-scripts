#!/bin/bash

repeat(){
	for i in {1..90}; do echo -n "$1"; done
}

d=`date '+%a %Y/%m/%d %H%M'`
l=${#d}
printf -- '-%.0s' $(seq 1 $l)
echo ''
echo $d
printf -- '-%.0s' $(seq 1 $l)
echo ''

t=`date '+%m%d'`
q=$(date --date="tomorrow" +'%m%d')

file="birthdays.txt"
while IFS=';' read -r a b; do
    a=$(echo $a|tr -d '\r')
    b=$(echo $b|tr -d '\r')
    if [ "$t" = "${a}" ]; then
        ptxt="Today is ${b}'s birthday."
        echo ${ptxt}
    elif [ "$q" = "${a}" ]; then
        ptxt="Tomorrow is ${b}'s birthday."
        echo ${ptxt}
    fi
done < "birthdays.txt"
