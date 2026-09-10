# append to the history file, don't overwrite it
shopt -s histappend
# don't remember duplicate entries and entries starting with space
HISTCONTROL=ignorespace:ignoredups
# one history file per host
HISTFILE="$HOME/.bash_history.${HOSTNAME}"
# increase size of history (default: 500)
HISTSIZE=10000
# don't restrict file size (any more than HISTSIZE)
unset HISTFILESIZE
# save timestamps with the history
HISTTIMEFORMAT="%F_%R:%S ":
# save history on every prompt
PROMPT_COMMAND="${PROMPT_COMMAND}history -a;"
