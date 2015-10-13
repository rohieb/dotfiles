# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
      . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
PATH="$HOME/bin:/sbin:/usr/sbin:$PATH"

### exports
export DEBEMAIL="rohieb@rohieb.name"
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

#export LANGUAGE="en_US:en"
export LANG="en_US.UTF-8"
export LC_TIME="de_DE.UTF-8"
#export LC_NUMERIC="de_DE.UTF-8"   # googleearth is fine
export LC_CTYPE="de_DE.UTF-8"
export LC_PAPER="de_DE.UTF-8"
export LC_COLLATE="de_DE.UTF-8"
export LC_MONETARY="de_DE.UTF-8"

# set up local perl lib in ~/.perl5
eval $(perl -Mlocal::lib=$HOME/.perl5)

# tell Java applications to use anti-aliasing
export _JAVA_OPTIONS="$_JAVA_OPTIONS -Dawt.useSystemAAFontSettings=on"
# tell Java Swing to use our GTK+ theme by default
export _JAVA_OPTIONS="$_JAVA_OPTIONS -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
# tell Java apps to prefer IPv4 addresses
export _JAVA_OPTIONS="$_JAVA_OPTIONS -Djava.net.preferIPv4Addresses=true"
# fix some gray windows in OpenJDK 7
# see https://awesome.naquadah.org/wiki/Problems_with_Java
export _JAVA_AWT_WM_NONREPARENTING=1
# GTK3 themes with SWT look ugly sometimes
export SWT_GTK3=0

# locally installed Node packages
export PATH="$PATH:$HOME/lib/node_modules/.bin"

### autostarts
source .login_autostart
