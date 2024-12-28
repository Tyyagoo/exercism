#!/usr/bin/env bash

function rot() {
  ch=$1
  shift=$2
  ch_ord=$(printf "%d" "'$ch")

  if [[ $ch =~ [A-Za-z] ]]; then
    ord=$((ch_ord < 97 ? 65 : 97))
    new_ch=$(( (ch_ord - ord + shift) % 26 + ord ))
    printf "\\$(printf '%03o' $new_ch)"
  else
    echo -n "$ch"
  fi
}

for (( i=0; i<${#1}; i++ )); do
  char=${1:$i:1}
  rot "$char" "$2"
done
