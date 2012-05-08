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


### start gpg agent
export GPG_TTY=$(tty)
GPG_AGENT_ENV_FILE=$HOME/.gnupg/gpg-agent-info
if [ -f "$GPG_AGENT_ENV_FILE" ]; then
  . "$GPG_AGENT_ENV_FILE"
  export GPG_AGENT_INFO
fi
# file may be old, try connecting
gpg-agent > /dev/null 2>&1
if [ "$?" != "0" ]; then
  eval $(gpg-agent --daemon --sh --write-env-file=$GPG_AGENT_ENV_FILE)
fi


### start ssh agent and add keys
SSH_AGENT_ENV_FILE=$HOME/.ssh/ssh-agent-info
if [ -f "$SSH_AGENT_ENV_FILE" ]; then
  . "$SSH_AGENT_ENV_FILE" > /dev/null
  # file may be old, try connecting
  if [ -z "$(ps aux|grep $SSH_AGENT_PID|grep ssh-agent)" ]; then
    # daemon does not exist with this pid, start new one
    ssh-agent -s > $SSH_AGENT_ENV_FILE
    . "$SSH_AGENT_ENV_FILE" > /dev/null
  fi
fi

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

