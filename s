#!/bin/sh

if [ "$#" -ne 1 ]; then
    printf 'Usage: %s FILENAME\n' "$0" >&2
    exit 1
fi

path="$1"

treat_as_short() {
    # We will display files known to be sufficiently short witout paging.
    height="$(tput lines)" && loc="$(wc -l <"$path")" &&
        [ "$loc" -le "$((height - 2))" ]
}

beautify() {
    highlight -O ansi -- "$path"
}

if treat_as_short; then
    beautify
else
    beautify | less -R
fi
