#!/bin/sh
grep "$1:" ~/.config/vdirsyncer/passwords | awk '{print $2}'
