#!/bin/sh

if [ "$#" -ne 1 ]; then
    printf 'Usage: %s FILENAME\n' "$0" >&2
    exit 1
fi

path="$1"

# We will use paging only to display files that appear long enough to need it.
# Such special-casing works around the problem that "less" with "-F" but not
# "-X" erases even non-paged output in some terminals. I don't want to pass -X
# all the time, because when the output is paged, I want old text restored.
# I've made the default to *not* page so that more cases that cause highlight
# to fail will avoid piping to less and thus show cleaner error output.
treat_as_long() {
    height="$(tput lines 2>/dev/null)" || return "$?"
    { loc="$(wc -l <"$path")"; } 2>/dev/null || return "$?"
    [ "$loc" -gt "$((height - 2))" ]
}

beautify() {
    highlight -O ansi -- "$path"
}

if treat_as_long; then
    beautify | less -R
else
    beautify
fi
