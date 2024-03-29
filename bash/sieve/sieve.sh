#!/usr/bin/env bash

declare -a sieve primes

mkArray() {
  for (( c=2; c<=$1; c++ ))
  do 
    sieve[c]=1
  done
}

mkSieve() {
  for (( c=2; c<=$1; c++ )); do
    if [[ ${sieve[$c]} -eq 1 ]]; then
      primes[c]=$c
      for (( i=c*2; i<=$1; i+=c )); do
        sieve[i]=0
      done
    fi
  done
}

mkArray "$1"
mkSieve "$1"
echo "${primes[*]}"
