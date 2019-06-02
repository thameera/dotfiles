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
plugins=(git history-substring-search)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export PATH=$PATH:$HOME/ws/bin:$HOME/bin

# Give priority to Gnu coreutils in OS X
if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
fi

export LESS="-aFiRX"
export LESSOPEN='|/usr/bin/lesspipe %s'  # for piping pdf files

HISTSIZE=18000
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
alias ls='gls -F --color=auto --group-directories-first'
alias ll='gls -lhFSr --color=auto --group-directories-first'
alias lt='ls -altr'

# vim
alias vi='vim'
alias vip='vi -p' #Open tabs
alias ve='vim ~/.vimrc'

alias rm='rm -I'  # much nicer than rm -i
alias mv='mv -i'  # prompt before overwrite
alias dux='du -sh *|sort -h'  # human-readable, sorted
alias df='df -h'

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

# tmux
alias tmux='TERM=xterm-256color tmux'
alias tmli='tmux list-sessions'
alias ta='nocorrect tmux attach -t'
alias tk='nocorrect tmux kill-session -t'
alias tl='tmux ls'
alias tn='nocorrect tmux new -s'

# caffeinate
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias caff='caffeinate -disu'
fi

# rupa/z
source ~/bin/z.sh
alias z='nocorrect _z 2>&1' 

# rupa/v
alias vl='v -l'

# colorized cat (needs sudo easy_install Pygments)
alias c='pygmentize -O style=monokai -f console256 -g'

alias showip='dig +short myip.opendns.com @resolver1.opendns.com'

alias yt='youtube-dl -i'
alias yta='youtube-dl --extract-audio --audio-format mp3'
alias yti='youtube-dl-interactive'

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

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtenv
export PROJECT_HOME=$HOME/ws
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh

## zsh-autosuggestions

source ~/.zsh-autosuggestions/zsh-autosuggestions.zsh
# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init
# Accept suggestions without leaving insert mode
bindkey '^ ' vi-forward-word

# zmv
autoload -U zmv
# Now you can do cool stuff like:
#     zmv '*BluRay*' '$f:gs/BluRay/HDTV'

## Key bindings ##

# Alt-u to cd to parent dir
bindkey -s '\eu' '^Ucd ..^M'

# Pop the dir stack
bindkey -s '\ep' '^Upopd >/dev/null; dirs -v|head -n5^M'

# History substr search
bindkey "^R" history-incremental-search-backward
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

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

ns() {
  echo host -a
  host -a $1
  echo
  echo freegeoip.net
  curl freegeoip.net/json/$1
}

export PATH="$HOME/.yarn/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
