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
plugins=(git tmux debian history syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/heroku/bin:/home/thameera/bin/adt-bundle-linux-x86_64-20130219/sdk/tools:/home/thameera/bin/adt-bundle-linux-x86_64-20130219/sdk/platform-tools:/home/thameera/bin/phonegap-android/bin:/home/thameera/ws/bin:/home/thameera/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/thameera/ws/bin

export LESS="-aFirX"

HISTSIZE=6000

alias g='git'

# cd and ls in one
cl() { if [ -d "$1" ]; then cd "$1"; ls; else echo "bash: cl: '$1': Directory not found"; fi; }

# mkdir && cd
mcd() { mkdir -p "$@" && cd $_; }

# enhance pgrep
function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }

# find files
function fname() { find . -iname "*$@*"; }

alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'

alias lsg='ls | grep'
alias grepr='grep -r'
alias tm='ps -ef | grep'  # task manager. Much like pgrep, but better
alias vi='vim'
alias vip='vi -p' #Open tabs
alias vis='vi -S' # Open session
alias rm='rm -I'  # much nicer than rm -i
alias mv='mv -i'  # prompt before overwrite
alias delswap='rm -f .*.swp'
alias dux='du -sh *|sort -h'  # human-readable, sorted

alias gpp='g++ -std=c++11'

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
alias gpl='git pull'
alias gcon='cat .git/config'
alias gcp='git cherry-pick'
alias unstage='git reset HEAD'

alias gh='githug'

# xmonad
alias gp='gnome-panel'

# tmux
alias tmux='TERM=xterm-256color tmux'
#alias printcolors='for i in {0..255}; do printf "\x1b[38;5;${i}mcolour${i}\n"; done'
alias tc='tmux show-buffer'
alias tmli='tmux list-sessions'

# ttytter
alias tw='~/ttytter/tty2100'
alias tw1='~/ttytter/tty2100 -rc=1'

alias showip='curl icanhazip.com'

# rename JPGs in dir to random sha values
alias shuffle='for fname in *.jpg; do mv "$fname" $(echo "$fname" | sha1sum | cut -f1 -d" ").jpg; done'
# rename DAT to MPG
alias dat2mpg='for fname in *.DAT; do mv "$fname" $(echo "$fname"|cut -f1 -d".").mpg; done'


# Suffix aliases
alias -s cpp=vim
alias -s h=vim
alias -s js=vim

alias viz="vi ~/.zshrc"
alias sz="source ~/.zshrc"

# cowsay fortune each time a bash session starts
if [ -x /usr/games/cowsay -a -x /usr/games/fortune ]; then
    #fortune -a | fmt -80 -s | cowsay -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n;
    fortune -as | cowsay
fi

source ~/.privatebash

set -o vi  # Vi mode!

# Go
export GOPATH=$HOME/ws/go
export PATH=$PATH:$GOPATH/bin

# History search with arrow keys (.inputrc replacement)
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "$terminfo[kcuu1]" history-beginning-search-backward-end
bindkey "$terminfo[kcud1]" history-beginning-search-forward-end

