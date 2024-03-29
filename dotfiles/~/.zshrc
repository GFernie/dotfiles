# Path to your oh-my-zsh installation.
export ZSH=/Users/garyfernie/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="gozilla"
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to automatically upgrade oh-my-zsh without
# prompting you.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    aws
    docker
    docker-compose
    docker-machine
    git
    pip
    tmux
)

# User configuration

# export PATH="/Users/garyfernie/.pyenv/shims:/Users/garyfernie/.pyenv/bin:/Users/garyfernie/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_GB.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Source directories
# Any files recursively found in these directories will be sourced.
source_dirs=(
    ~/.aliases
    ~/.environment
    ~/.functions
)
for file in $(find -E $source_dirs -regex '.+\.z?sh'); source $file

# Docker
#source ~/Projects/docker/docker/contrib/completion/zsh/_docker
#source ~/Projects/docker/compose/contrib/completion/zsh/_docker-compose
#source ~/Projects/docker/machine/contrib/completion/zsh/_docker-machine

# Zsh completion
fpath=(/usr/local/share/zsh-completions $fpath)

# Bash completion
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Tmux
source /usr/local/etc/bash_completion.d/tmux

# Pyenv
#source ~/.pyenv/completions/pyenv.zsh

# kubectl autocompletion
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# Zsh syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf - command-line fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Z directory jumper
. /usr/local/etc/profile.d/z.sh

complete -o nospace -C /usr/local/bin/grapplercat-autocomplete grapplercat

# nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
