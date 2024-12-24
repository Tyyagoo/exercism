#!/usr/bin/env bash

OUT=""
for word in "$@"; do
    if [[ $word =~ ^([aeiou]|xr|yt) ]]; then
        OUT+="${word}ay "
    elif [[ $word =~ ^(y|[^aeiouy]*qu|[^aeiouy]+)(.*) ]]; then
        OUT+="${BASH_REMATCH[2]}${BASH_REMATCH[1]}ay "
    fi
done

echo "${OUT% }"