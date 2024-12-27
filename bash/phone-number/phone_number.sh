#!/usr/bin/env bash

if [[ $1 =~ ^\ *\+?1?\ *\(?([2-9][0-9]{2})\)?[-.\ ]*([2-9][0-9]{2})[-.\ ]*([0-9]{4})\ *$ ]]; then
    echo "${BASH_REMATCH[1]}${BASH_REMATCH[2]}${BASH_REMATCH[3]}"
else
    echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
    exit 1
fi
