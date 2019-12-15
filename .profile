# simple profile/bash configuration file (.profile) - Niclas Tenggren (latest update 2019-10-20)

## Aliases ##

alias ll="ls -laFG"
alias ltr="ls -laFGtr"
alias ".."="cd .."
alias "cd.."="cd .."
alias mroe=more
alias mkae=make
alias m="less"

## Variables ##

PS1='\n($?) \u@\h: \w\n\$ '

HISTSIZE=4096
HISTCONTROL=ignoredups
command_oriented_history=On
auto_resume=On
FIGNORE='~'
shopt -s histappend

# Silence "deprecation" warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# Define default editor
export EDITOR=vim

# Change the colors for 'ls'
export LSCOLORS=GxFxCxDxBxegedabagaced

# Add variations of local/bin to PATH
export PATH=${HOME}/.local/bin:${PATH}

# Add VSCode to PATH
export PATH=${PATH}:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Add X11 to PKG_CONFIG_PATH
#export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig

# Define Go workspace
export GOPATH=${HOME}/src/go/golib
export PATH=${PATH}:${GOPATH}/bin
export GOPATH=${GOPATH}:${HOME}/src/go/code

# Setup fzf completions
#export FZF_COMPLETION_TRIGGER='~~'
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi
source "/usr/local/opt/fzf/shell/completion.bash"
source "/usr/local/opt/fzf/shell/key-bindings.bash"

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

