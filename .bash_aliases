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

alias dd='dd status=progress conv=fsync,fdatasync'

alias sysu="systemctl --user"

complete -F _systemctl sysu

alias v="vdirsyncer sync"

alias diff='diff --color -u'

alias cal="ncal -w3"

if [ -r ~/.bash_aliases.$HOSTNAME ]; then
	source ~/.bash_aliases.$HOSTNAME
fi

alias python=python3

alias ffprobe='ffprobe -hide_banner'
alias ffmpeg='ffmpeg -hide_banner'
