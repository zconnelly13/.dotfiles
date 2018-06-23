# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

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
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Customized settings.
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/go/bin:/Users/$USER/go/bin
export PAGER="/usr/bin/less -ins"

# git autocompletion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# print out random cutesy error message if the last command errored out
get_random_failure_message () {
  failure_messages=(
    "Oh nein..."
    "Ich habe es vermasselt"
    "Wie peinlich..."
    "Jetzt ist alles vorbei, denke ich."
    "Mir fehlen die Worte."
  )
  RANDOM=$(( ( RANDOM % 133713371337133713371337 )  + 1 ))
  failure_message=${failure_messages[$RANDOM % ${#failure_messages[@]}]}
  return 0
}

set_bash_prompt () {
  get_random_failure_message
  export PS1='\[\033[01;32m\]zac@macbook\[\033[01;34m\] \w $([[ $? != 0 ]] && echo "\[\033[01;31m\]$failure_message \[\033[01;34m\]")\$\[\033[00m\] '
  history -a
  history -n
}

PROMPT_COMMAND=set_bash_prompt

# set window's name to empty when I open it
if [ $TMUX ]; then
  tmux rename-window [empty]
fi

# set editor to vim
export EDITOR=$(which vim)

# set terminal to 256 color
export TERM=screen-256color

# Keyword Love
if [ -e ~/keywordlove/venv/bin/activate ]; then
  source ~/keywordlove/venv/bin/activate
fi

export PATH="$HOME/.bin:$PATH"

comma_g () {
  vim $(git grep -in "$1" | selecta | awk -F ":" '{print "+"$2 " " $1}')
}

alias ,g="comma_g"

# nomac
# alias ls='ls --color=auto'

export PYTHONDONTWRITEBYTECODE=1

# source ~/keywordlove/venv/bin/activate

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# thefuck
eval $(thefuck --alias)
alias fuc=fuck
earp () {
  cat .circleci/config.yml | grep  "earp.*checkout " | grep -o "checkout .*" | cut -d " " -f 2
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Git fuckit
alias gityolo='git add -A && git commit -m "$(curl -s http://whatthecommit.com/index.txt)" && git push origin "$(git rev-parse --abbrev-ref HEAD)"'

alias love="/Applications/love.app/Contents/MacOS/love"

# gay
alias gay='touch log.txt; (for _ in {1..100}; do echo "8=============================================================================>" >> log.txt; sleep 0.05; done;) & (tail -f log.txt | lolcat)'
