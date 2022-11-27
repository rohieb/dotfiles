# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignorespace

# append to the history file, don't overwrite it
shopt -s histappend
shopt -s checkwinsize

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set prompt color according to last return value
__GREEN='\033[32m'
__RED='\033[31m'
__YELLOW='\033[33m'
__BLUE='\033[34m'
__RESET='\033[0m'

__ps1_status() {
	ret=$?
	if [ "$ret" != "0" ]; then
		echo -en " =$ret"
	fi
}
__ps1_shortpwd() {
	if [ -r "$HOME/.shortpwd.sed" ]; then
		pwd | sed -e "s:^$HOME:~:" -f "$HOME/.shortpwd.sed"
	else
		pwd | sed -e "s:^$HOME:~:"
	fi
}
__ps1_ptxdist_platform() {
	# 5 levels should be enough for configs/platform-*/projectroot/loader/entries/
	# after that, the prompt gets too long anyway
	for dir in . .. ../.. ../../.. ../../../.. ../../../../.. ; do
		if [ -h "$dir/selected_platformconfig" ]; then
			awk -F '"' \
				'/^PTXCONF_PLATFORM=/ { print " " $2; exit }' \
				"$dir/selected_platformconfig"
			return
		fi
	done
}

xterm_window_title() {
	printf '\033]0;%s\007' "$@"
}

# argument 1: default value if TITLE is unset
__ps1_xterm_window_title() {
	local the_title=${TITLE:+$TITLE}
	the_title=${the_title:-"$1"}
	if [ -n "$the_title" ]; then
		xterm_window_title "$the_title"
	fi
}

PS1_WITH_HOSTNAME=
if [ -n "$SSH_CONNECTION" ]; then
	PS1_WITH_HOSTNAME=1
fi

PS1="\[${__BLUE}\]\t\[${__RESET}\]"
PS1="${PS1}${debian_chroot:+($debian_chroot)}"
PS1="${PS1}\[${__RED}\]\$(__ps1_status)\[${__RESET}\]"
if [ -n "$PS1_WITH_HOSTNAME" ]; then PS1="${PS1}\[${__RED}\] \u@\h\[${__RESET}\]"; fi
PS1="${PS1} \[${__GREEN}\]\$(__ps1_shortpwd)\[${__RESET}\]"
PS1="${PS1}\[${__YELLOW}\]\$(__ps1_ptxdist_platform)\[${__RESET}\]"
PS1="${PS1}\$(__git_ps1)"    # git_ps1 already has space at the beginning
PS1="${PS1} \$ "

case "$TERM" in
	xterm*|rxvt*)
		PS1="${PS1}\[\$(__ps1_xterm_window_title \"${debian_chroot:+($debian_chroot) }\"'\w')\]"
		;;
	*)
		;;
esac

# silent tty2
if [ `tty` = "/dev/tty2" ]; then
	PS1=
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
		test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
		alias ls='ls --color=auto'
		#alias dir='dir --color=auto'
		#alias vdir='vdir --color=auto'

		alias grep='grep --color=auto'
		alias fgrep='fgrep --color=auto'
		alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
	if [ -r $HOME/.bash_completion.d/ -a -n "`ls -1 $HOME/.bash_completion.d/`" ];
	then
		for completion in $HOME/.bash_completion.d/*; do
			source $completion
		done;
	fi
fi

# always set GPG_TTY, not only for login shells (like in .profile)
export GPG_TTY=$(tty)

# add dquilt to work with debian 3.0 (quilt) packages
# see https://www.debian.org/doc/manuals/maint-guide/modify.en.html#quiltrc
alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"
complete -F _quilt_completion $_quilt_complete_opt dquilt

# cdp/cdg magic, thx to @Drahflow
cdp() { pwd > ~/tmp/.magic-cdg-path; }
cdg() { cd "`cat ~/tmp/.magic-cdg-path`"; }

# fasd init
eval "$(fasd --init bash-hook posix-alias)"
