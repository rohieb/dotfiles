#!/bin/sh
for rc in ~/.neomutt/*.rc; do
    test -r "$rc" && echo "source \"$rc\""
done
# vim: ft=sh
