# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set PATH so it includes user's private bin if it exists
PATH="$HOME/bin:$HOME/.local/bin:/sbin:/usr/sbin:$PATH"

# locally installed Node packages
export PATH="$HOME/lib/node_modules/.bin:$PATH"

# locally installed cabal packages
export PATH="$HOME/.cabal/bin:$PATH"

### exports
export NAME="Roland Hieber"
export EMAIL="rohieb@rohieb.name"

export EDITOR=vim
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

export LANGUAGE="en_US:en"
export LANG="en_US.UTF-8"
export LC_ALL=
export LC_CTYPE="de_DE.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="de_DE.UTF-8"
export LC_COLLATE="de_DE.UTF-8"
export LC_MONETARY="de_DE.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="de_DE.UTF-8"
export LC_NAME="de_DE.UTF-8"
export LC_ADDRESS="de_DE.UTF-8"
export LC_TELEPHONE="de_DE.UTF-8"
export LC_MEASUREMENT="de_DE.UTF-8"
export LC_IDENTIFICATION="de_DE.UTF-8"

export MPD_PORT=6601

# for sh compatibility
export HOSTNAME=`hostname`

# let ssh connect to ssh-agent.service
export SSH_AUTH_SOCK=/run/user/$(id -u)/openssh_agent

# prefer user.email in .git/config, or fall back to $EMAIL
unset GIT_AUTHOR_NAME GIT_AUTHOR_EMAIL GIT_COMMITTER_NAME GIT_COMMITTER_EMAIL

# set up local perl lib in ~/.perl5
if perl -Mlocal::lib=$HOME/.perl5 > /dev/null 2>&1; then
	eval $(perl -Mlocal::lib=$HOME/.perl5)
fi

# locally installed python packages
export PYTHONPATH=$HOME/.local/lib/python3

# tell Java applications to use anti-aliasing
export _JAVA_OPTIONS="$_JAVA_OPTIONS -Dawt.useSystemAAFontSettings=on"
# tell Java Swing to use our GTK+ theme by default
# (Note that GTK LAF is broken with ATK bridge, see
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=820227#10 )
export _JAVA_OPTIONS="$_JAVA_OPTIONS -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
# tell Java apps to prefer IPv4 addresses
export _JAVA_OPTIONS="$_JAVA_OPTIONS -Djava.net.preferIPv4Addresses=true"
# fix some gray windows in OpenJDK
# see https://awesome.naquadah.org/wiki/Problems_with_Java and
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=718803#63
export _JAVA_AWT_WM_NONREPARENTING=1
# GTK3 themes with SWT look ugly sometimes
export SWT_GTK3=0

# Tell Qt5 to use GTK+ style (needs qt5-styleplugins)
export QT_STYLE_OVERRIDE='gtk2'
export QT_QPA_PLATFORMTHEME=gtk2

export BC_ENV_ARGS='-l'  # load math library and print decimal points

export FZF_DEFAULT_OPTS="--no-color"

if [ -r ~/.profile.$HOSTNAME ]; then
	source ~/.profile.$HOSTNAME
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
      . "$HOME/.bashrc"
    fi
fi

### autostarts
source $HOME/.login_autostart
if [ -n "$DISPLAY" ]; then $HOME/bin/solarized-dark; fi
