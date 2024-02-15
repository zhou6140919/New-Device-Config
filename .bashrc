# this is required for module to work
if [[ -f /etc/bashrc && ! $BASH_SOURCED ]]; then
    . /etc/bashrc
fi

alias ta='tmux attach -t'
alias bb='du -sh * | sort -h'
alias v='~/nvim-linux64/bin/nvim'
alias vi='~/nvim-linux64/bin/nvim'
alias tarc='tar -zcvf'
alias tarx='tar -zxvf'
alias ca='conda activate'
alias cpl='rsync -avP'
alias sb='sbatch'
alias sc='scancel'
alias sq='squeue'
alias sqzt='squeue -u tongzhou'
alias tf='tail -f'
alias line='ls | wc -l'
alias ...='cd ../..'
alias ..='cd ..'
alias ss='source ~/.bashrc'
alias h='history'
alias lf='ls -F'
alias ll='ls -l'
# git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gd='git diff'
alias gb='git branch'

mkcd() {
    mkdir -p "$1"
    cd "$1"
}

rmex() {
    # remove all except the given name
    find . -maxdepth 1 ! -name . ! -name "$1" -exec rm -rf {} \;
}

# Git branch in prompt.
parse_git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export PROMPT_DIRTRIM=3
