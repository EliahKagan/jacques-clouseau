#!/bin/sh
# t - View a source code file with syntax highlighting, using a brighter, more
#     complex color scheme than the default for s. Uses "xterm256" instead of
#     "ansi". This is a wrapper for s.

S_OUT_FORMAT='xterm256' exec s "$@"
