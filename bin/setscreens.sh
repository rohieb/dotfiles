#!/bin/sh
DEFAULT="--scale 1x1 --panning 0x0 --pos 0x0"
LVDS=""
VGA=""
SCREEN=""

case $1 in
  reset)
    SCREEN="--fb 1366x768"
    LVDS="--auto --primary --mode 1366x768 $DEFAULT"
    VGA="--off"
 ;;
  home-dual)
    VGA="--primary --auto --pos 0x0"
    LVDS="--auto --left-of VGA1"
    ;;
  home)
    VGA="--primary --mode 1280x1024 --auto --right-of LVDS1"
    LVDS="--off"
    ;;
  stratum-beamer)
    LVDS="--mode 640x480 $DEFAULT"
    VGA="--mode 640x480 --same-as LVDS1 $DEFAULT"
    ;;
  *)
    echo Usage: $0 '{reset|home|home-dual|stratum-beamer}';;
esac

xrandr $SCREEN --output LVDS1 $LVDS --output VGA1 $VGA

xmodmap $HOME/.xmodmaprc

xset dpms force on

# vim: set ts=2 sw=2 expandtab smartindent autoindent:
