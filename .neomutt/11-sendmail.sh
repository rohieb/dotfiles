#!/bin/sh
# variable type of "sendmail" is "command", which does not expand ~
if [ -x $HOME/bin/sendmail ]; then
	echo set sendmail = \'$HOME/bin/sendmail -oem -oi\'
fi
