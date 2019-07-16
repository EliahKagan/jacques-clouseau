#!/bin/sh
# t - View a source code file with syntax highlighting, using a brighter, more
#     complex color scheme than the default for s. Uses "xterm256" instead of
#     "ansi". This is a wrapper for s.
#
# This file is part of jacques-clouseau, various keen and handy inspectors.
#
# Written in 2019 by Eliah Kagan <degeneracypressure@gmail.com>.
#
# To the extent possible under law, the author(s) have dedicated all copyright
# and related and neighboring rights to this software to the public domain
# worldwide. This software is distributed without any warranty.
#
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software. If not, see
# <http://creativecommons.org/publicdomain/zero/1.0/>.

S_OUT_FORMAT='xterm256' exec s "$@"
