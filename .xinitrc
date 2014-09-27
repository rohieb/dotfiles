#!/bin/sh
# make KDE find our GTK+ style
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

xmodmap .xmodmaprc
$HOME/bin/capslock-composekey

xset b off # turn off stupid bell sound

# Enable numlock if we have numlockx.
# (cherry-pick https://github.com/scy/dotscy/commit/080eb46fa1)
which numlockx >/dev/null 2>&1 && numlockx on

# set keymap de:nodeadkeys, map ctrl => compose, capslock => ctrl
setxkbmap de nodeadkeys -option -option ctrl:swapcaps -option compose:lctrl

# wrap awesome into a ConsoleKit session and also start a DBus session bus
# see bug #677456
#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session awesome
exec ck-launch-session dbus-launch --sh-syntax awesome
killall dbus-daemon
