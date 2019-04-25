# System Specific config
source ~/.bashrc

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
alias fclear="printf '\033c'"

# Bash-completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
	    . /usr/share/bash-completion/bash_completion

# Git
source ~/.git-prompt.sh
source ~/.git-completion.bash

# Prompt
PS1="\W\$(__git_ps1)\$ "
