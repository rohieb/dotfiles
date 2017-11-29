alias ll='ls -lh'
alias la='ls -A'
alias l='ls -lah'

#alias make='make -j 2'
#alias make='colormake'

alias iotop='sudo iotop'
alias iftop='sudo iftop'
alias iptraf='sudo iptraf'
alias dmesg='sudo dmesg'

psgrep() {
	ps -Af | grep "$*"
}

alias add-ssh-keys="ssh-add $HOME/.ssh/id*priv"

alias refox='killall -9 iceweasel && iceweasel > /dev/null &'

alias colorcat='pygmentize -g'

alias gpg=gpg2

alias k='khal calendar'

alias dd='dd status=progress'

if [ -r ~/.bash_aliases.$HOSTNAME ]; then
	source ~/.bash_aliases.$HOSTNAME
fi
