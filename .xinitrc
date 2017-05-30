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
# (synclient -l exists with 1 if no synaptics driver was loaded)
if [ -x /usr/bin/synclient ] && synclient -l; then
	synclient HorizTwoFingerScroll=1
fi

$HOME/bin/setkeymap

if [ -x $HOME/bin/setscreens-$HOSTNAME ]; then
	$HOME/bin/setscreens-$HOSTNAME
fi

exec awesome
