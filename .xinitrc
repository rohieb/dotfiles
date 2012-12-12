#!/bin/sh
# make KDE find our GTK+ style
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

xmodmap .xmodmaprc
$HOME/bin/capslock-composekey

xset b off # turn off stupid bell sound

# wrap awesome into a ConsoleKit session and also start a DBus session bus
# see bug #677456
#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session awesome
exec ck-launch-session dbus-launch --sh-syntax awesome

