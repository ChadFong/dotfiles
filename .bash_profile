# System Specific config
source ~/.git-prompt.sh

PS1="\W\$(__git_ps1)\$ "

if hash nvim 2>/dev/null; then
    alias editor=nvim
else
    echo "Default editor not on $PATH"
fi

# .dotfile shortcuts
alias vimrc="editor ~/.config/nvim/init.vim"
alias prof="editor ~/.bash_profile"
alias runprof=". ~/.bash_profile"


# Git shortcuts:  Refer to ~/.gitconfig
gs () { git status; }

ga () { git add $1; }

gc () { git commit $1 $2; }

gd () { git diff $1; }

gb () { git branch $1 $2; }

gco () { git checkout $1 $2; }

gcob () { git checkout -b $1 $2; }

gh () { git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short; }

gpull () { git pull $1 $2 $3; }

gpush () { git push $1 $2 $3; }

# Bash-completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
	    . /usr/share/bash-completion/bash_completion

# Git autocomplete:
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash

  # Add git completion to aliases
  __git_complete gco _git_checkout
fi

