#!/bin/sh
# make KDE find our GTK+ style
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

xmodmap .xmodmaprc

xset b off # turn off stupid bell sound

# Enable numlock if we have numlockx.
# (cherry-pick https://github.com/scy/dotscy/commit/080eb46fa1)
which numlockx >/dev/null 2>&1 && numlockx on

# synaptics settings
synclient HorizTwoFingerScroll=1

$HOME/bin/setkeymap

exec awesome
