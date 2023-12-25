# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
 COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git history-substring-search zsh-autosuggestions asdf fzf-zsh-plugin)

# To disable backslashes being added when pasting URLs
# Should be called before sourcing oh-my-zsh.sh
DISABLE_MAGIC_FUNCTIONS=true

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export PATH=$PATH:$HOME/ws/bin:$HOME/bin:$HOME/.local/bin:$HOME/go/bin

# Give priority to Gnu coreutils in OS X
if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
fi

export LESS="-aFiRX"
export LESSOPEN='|/usr/bin/lesspipe %s'  # for piping pdf files

HISTSIZE=100000
SAVEHIST=100000
setopt inc_append_history

alias git='noglob git'
alias g='git'

## Functions ##

# cd and ls in one
cl() { cd "$1" && ls }

server() { local PORT=${1:-9000}; python -m SimpleHTTPServer $PORT; }

# mkdir && cd
mcd() { mkdir -p "$@" && cd $_; }

# enhance pgrep
function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }

# find files
function fname() { find . -iname "*$@*"; }

# convert m4a to mp3
function m43() { ffmpeg "$@".mp3 -i "$@" -codec:a libmp3lame -qscale:a 1; }

# caffeinate
caff() {
  if [ $# -eq 0 ]; then
    caffeinate -disu
  elif [ $# -eq 1 ]; then
    minutes="$1"
    seconds=$((minutes * 60))
    caffeinate -disu -t "$seconds"
  else
    echo "Usage: caff [minutes]"
  fi
}

## /Functions ##

# Global aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'

alias -g H='| head'
alias -g T='| tail'
alias -g L='| less'
alias -g G='| grep'
alias -g dot='~/ws/dotfiles'
alias -g N='; notify-send "End command"'

# ls
alias ls='gls -F --color=auto --group-directories-first'
alias ll='gls -lhFSr --color=auto --group-directories-first'
alias lt='ls -altr'

# nvim
alias vi='nvim'

alias rm='rm -I'  # much nicer than rm -i
alias mv='mv -i'  # prompt before overwrite
alias dux='du -sh *|sort -h'  # human-readable, sorted
alias df='df -h'

# git
alias gc='git checkout'
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gci='git commit -sm'
alias gd='git diff'
alias gsh='git show'
alias gps='git push'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gcon='cat .git/config'
alias gcp='git cherry-pick'
alias unstage='git reset HEAD'
alias grh='git reset --hard'

# tmux
alias tmux='TERM=xterm-256color tmux'
alias tmli='tmux list-sessions'
alias ta='nocorrect tmux attach -t'
alias tk='nocorrect tmux kill-session -t'
alias tl='tmux ls'
alias tn='nocorrect tmux new -s'

# rupa/z
source ~/bin/z.sh
alias z='nocorrect _z 2>&1' 

# rupa/v
alias vl='v -l'

alias showip='dig +short myip.opendns.com @resolver1.opendns.com'

alias ze="vi ~/.zshrc"
alias zr="source ~/.zshrc"

if [ -e ~/.secrets ]; then
  source ~/.secrets
fi

set -o vi  # Vi mode!

# man page colorization
export GROFF_NO_SGR=1
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m'   \
    LESS_TERMCAP_md=$'\E[01;38;5;74m'  \
    LESS_TERMCAP_me=$'\E[0m'           \
    LESS_TERMCAP_se=$'\E[0m'           \
    LESS_TERMCAP_so=$'\E[38;5;246m'    \
    LESS_TERMCAP_ue=$'\E[0m'           \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

## Key bindings ##

# History substr search
bindkey "^R" history-incremental-search-backward
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# Esc-V to open vim for editing command
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

## /Key bindings ##
