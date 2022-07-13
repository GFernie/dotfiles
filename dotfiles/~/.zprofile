# Python pyenv and VirtualEnv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
#source ~/.pyenv/completions/pyenv.zsh
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects

# jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# Syntax highlighting for Less
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
export LESS=' -R '

# Vim as default
alias vless='/usr/local/Cellar/vim/7.4.1724/share/vim/vim74/macros/less.sh'
#export PAGER='vless'
export VISUAL=vim
export EDITOR="$VISUAL"
