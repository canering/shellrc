# trick to make aliases available when using sudo
alias sudo='sudo '

# common ls aliases
alias ll='ls -hal'
alias la='ls -A'
alias l='ls -CF'

# always use vimproved
alias vi='vim'

# display all the history!
alias history="cat $HISTFILE"

# use colordiff if available
if which colordiff &> /dev/null; then
  alias diff='colordiff'
fi

# hexdump using od
alias hd='od -Ax -tx1z -v'

# alias for nice ps output (macos/linux versions)
if [[ "$(uname)" == "Darwin" ]]; then
  alias psc='ps xao pid,state,user,args'
elif [[ "$(uname)" == "Linux" ]]; then
  alias psc='ps xawfo pid,state,user,args'
fi

# alias for using rsync with sudo and ssh
alias rrsync='rsync --rsync-path sudo\ rsync -rvze ssh'

# sum (e.g. echo 1 2 3 |sum)
alias sum="xargs | tr ' ' '+' | bc"

# alias ag to ack/grep if ag is not available
if ! which ag &> /dev/null; then
  # Use ack if available
  if which ack &> /dev/null; then
    alias ag='ack'

  # Debian/Ubuntu executeable name is ack-grep
  elif which ack-grep &> /dev/null; then
    alias ag='ack-grep'

  # Fallback to grep -Ri
  else
    ag() { grep -Ri $1 *; }
  fi
fi

# use vimpager as pager if available
if which vimpager &> /dev/null; then
  export PAGER="vimpager"
  alias more=$PAGER
  alias less=$PAGER
fi

# use vimcat instead of pygmetize as hcat alias
if which vimcat &> /dev/null; then
  alias hcat=vimcat
fi
