#!/bin/sh

if [ "$#" -ne 1 ]; then
    printf 'Usage: %s FILENAME\n' "$0" >&2
    exit 1
fi

path="$1"

# We will display files known to be sufficiently short witout paging. Such
# special-casing works around the problem that "less" with "-F" but not "-X"
# erases even non-paged output in some terminals. I don't want to pass -X all
# the time, because when the output is paged, I *do* want old text restored.
treat_as_short() {
    height="$(tput lines 2>/dev/null)" || return "$?"
    loc="$(wc -l <"$path" 2>/dev/null)" || return "$?"
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
