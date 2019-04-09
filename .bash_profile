# System Specific config
source ~/.bashrc

source ~/.git-prompt.sh

PS1="\W\$(__git_ps1)\$ "

if hash vim 2>/dev/null; then
    alias editor=vim
else
    echo "Default editor not on $PATH"
fi

# .dotfile shortcuts
alias vimrc="editor ~/.vimrc"
alias prof="editor ~/.bash_profile"
alias runprof=". ~/.bash_profile"

# Aliases:
alias g="git"

# Bash-completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
	    . /usr/share/bash-completion/bash_completion

# Git autocomplete:
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash

  # Add git completion to aliases
  __git_complete gco _git_checkout
fi
