# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [[ "$OSTYPE" == "darwin"* ]]; then
  ZSH_THEME="wild-cherry"
else
  ZSH_THEME="afowler"
fi

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
plugins=(git tmux debian zsh-syntax-highlighting history-substring-search mosh)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export PATH=$PATH:$HOME/ws/bin:$HOME/bin

# Give priority to Gnu coreutils in OS X
if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
fi

export LESS="-aFiRX"
export LESSOPEN='|/usr/bin/lesspipe %s'  # for piping pdf files

HISTSIZE=8000
setopt appendhistory

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

# Search Google/Oxford dict with elinks
function url-encode() { setopt extendedglob; echo "${${(j: :)@}//(#b)(?)/%$[[##16]##${match[1]}]}" }
function google() { elinks "http://www.google.com/search?q=`url-encode "${(j: :)@}"`" }
function oxf() { elinks "http://oald8.oxfordlearnersdictionaries.com/dictionary/`url-encode "${(j: :)@}"`" }

# Alt-s to insert sudo (Part 1/2)
insert_sudo () { zle beginning-of-line; zle -U "sudo " }

# Usage: currency 100 jpy lkr
currency() { wget -qO- "http://www.google.com/finance/converter?a=$1&from=$2&to=$3&hl=es" |  sed '/res/!d;s/<[^>]*>//g'; }

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

# nocorrect
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'
alias tmux='nocorrect tmux'
alias npm='nocorrect npm'
alias which='nocorrect which'

# ls
alias ls='ls -F --color=auto --group-directories-first'
alias ll='ls -lhFSr --color=auto --group-directories-first'
alias lt='ls -altr'
alias lg='ls -go'
alias lsg='ll | grep'

# vim
alias vi='vim'
alias vip='vi -p' #Open tabs
alias vis='vi -S' # Open session
alias ve='vim ~/.vimrc'

alias grepr='grep -r'
alias tm='ps -ef | grep'  # task manager. Much like pgrep, but better
alias rm='rm -I'  # much nicer than rm -i
alias mv='mv -i'  # prompt before overwrite
alias delswap='rm -f **/.*.swp'
alias dux='du -sh *|sort -h'  # human-readable, sorted
alias df='df -h'

# C++
alias gpp='g++ -std=c++11'
alias make='nocorrect make'

# beets
alias bi='beet import'

# git
alias k='gitk --all &'
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

alias gh='githug'

# ps
alias psa="ps aux"
alias psg="ps aux | grep"

# xmonad
alias gp='gnome-panel'

# tmux
alias tmux='TERM=xterm-256color tmux'
#alias printcolors='for i in {0..255}; do printf "\x1b[38;5;${i}mcolour${i}\n"; done'
alias tc='tmux show-buffer'
alias tmli='tmux list-sessions'
alias ta='nocorrect tmux attach -t'
alias tk='nocorrect tmux kill-session -t'
alias tl='tmux ls'
alias tn='nocorrect tmux new -s'

# ttytter
alias tw='~/ws/bin/ttytter/tty2100'
alias tw1='~/ws/bin/ttytter/tty2100 -rc=1'
alias tw2='~/ws/bin/ttytter/tty2100 -rc=2'

# nwjs
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias nw='~/Applications/nwjs.app/Contents/MacOS/nwjs'
fi

# rupa/z
source ~/bin/z.sh
alias z='nocorrect _z 2>&1' 

# rupa/v
alias vl='v -l'

# colorized cat (needs sudo easy_install Pygments)
alias c='pygmentize -O style=monokai -f console256 -g'

# mpd
alias mpdx='mpd --no-daemon --verbose'

alias playy='mpg123 -C'

alias showip='dig +short myip.opendns.com @resolver1.opendns.com'

# rename JPGs in dir to random sha values
alias shuffle='for fname in *.jpg; do mv "$fname" $(echo "$fname" | sha1sum | cut -f1 -d" ").jpg; done'
# rename DAT to MPG
alias dat2mpg='for fname in *.DAT; do mv "$fname" $(echo "$fname"|cut -f1 -d".").mpg; done'
# battery status
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'

# Openbox
alias or='openbox --reconfigure'

alias yt='youtube-dl -i'

# Suffix aliases
alias -s cpp=vim
alias -s h=vim

alias ze="vi ~/.zshrc"
alias zr="source ~/.zshrc"

# cowsay fortune each time a bash session starts
if [ -x /usr/games/cowsay -a -x /usr/games/fortune ]; then
    #fortune -a | fmt -80 -s | cowsay -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n;
    fortune -as | cowsay
fi

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

# Go
export GOPATH=$HOME/ws/go
export PATH=$PATH:$GOPATH/bin

# Haskell
export PATH=$PATH:$HOME/.cabal/bin

# Scala
export PATH=$PATH:$HOME/bin/scala

# Play
export PATH=$PATH:$HOME/bin/play-2.2.2

# Heroku
export PATH=$PATH:/usr/local/heroku/bin

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtenv
export PROJECT_HOME=$HOME/ws
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh

## zsh-autosuggestions

source ~/.zsh-autosuggestions/autosuggestions.zsh
# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init
# Accept suggestions without leaving insert mode
bindkey '^ ' vi-forward-word

## Key bindings ##

# Alt-u to cd to parent dir
bindkey -s '\eu' '^Ucd ..^M'

# Pop the dir stack
bindkey -s '\ep' '^Upopd >/dev/null; dirs -v|head -n5^M'

# History substr search
bindkey "^R" history-incremental-search-backward
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# Alt-s for sudo (Part 2/2)
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

# Esc-V to open vim for editing command
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

## /Key bindings ##

# taskwarrior
alias t="task"
alias tt="clear; task"

### Vi mode status indicator ###
# urxvt (and family) accepts even #RRGGBB
INSERT_PROMPT="gray"
COMMAND_PROMPT="red"

# helper for setting color including all kinds of terminals
set_prompt_color() {
    if [[ $TERM = "linux" ]]; then
       # nothing
    elif [[ $TMUX != '' ]]; then
        printf '\033Ptmux;\033\033]12;%b\007\033\\' "$1"
    else
        echo -ne "\033]12;$1\007"
    fi
}

# change cursor color basing on vi mode
zle-keymap-select () {
    if [ $KEYMAP = vicmd ]; then
        set_prompt_color $COMMAND_PROMPT
    else
        set_prompt_color $INSERT_PROMPT
    fi
}

zle-line-finish() {
    set_prompt_color $INSERT_PROMPT
}

zle-line-init () {
    zle -K viins
    set_prompt_color $INSERT_PROMPT
}

zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-line-finish
### /Vi mode status indicator ###


# Use C-Z to jump back to vim after a C-Z
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

