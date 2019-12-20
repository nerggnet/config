#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Aliases ##
alias ls='ls --color=auto'
alias ll='ls --color=auto -laF'
alias '..'='cd ..'
alias 'cd..'='cd ..'
alias mroe=more
alias mkae=make
alias m="less"

## Prompt
#PS1='[\u@\h \W]\$ '
PS1='\n($?) \u@\h: \w\n\$ '

## Variables ##
HISTSIZE=4096
HISTCONTROL=ignoredups
command_oriented_history=On
auto_resume=On
FIGNORE='~'
shopt -s histappend

# Set default less behavior
export LESS="MeS"

# Set config home for bspwm
export XDG_CONFIG_HOME="$HOME/.config"

# Add variations of local/bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# Define default editor
export EDITOR=vim

# Define Go workspace
export GOPATH=${HOME}/src/go/golib
export PATH=${PATH}:${GOPATH}/bin
export GOPATH=${GOPATH}:${HOME}/src/go/code

# Setup fzf completions
#export FZF_COMPLETION_TRIGGER='~~'
source "/usr/share/fzf/completion.bash"
source "/usr/share/fzf/key-bindings.bash"

## Functions ##

function sfind()
{
  type find  >/dev/null || exit 2
  type grep  >/dev/null || exit 3
  type xargs >/dev/null || exit 4
  local DIRECTORY=''
  local FILENAMES=''

  if [ $# = 0 -o $# = 1 -o $# = 2 ]; then
    echo 'sfind: Usage: sfind directory filename [ filename(s) ] grep-string' >&2
    return 1
  fi

  DIRECTORY="$1"
  shift

  FILENAMES="-name '$1'"
  shift

  while [ $# != 1 ]; do
    FILENAMES="$FILENAMES -o -name '$1'"
    shift
  done

  eval "find $DIRECTORY -type f \( $FILENAMES \) -print | xargs grep -ni $1"
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fh - search in your command history and execute selected command
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

