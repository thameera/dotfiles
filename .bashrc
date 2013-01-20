# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=3000
HISTFILESIZE=6000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

set show-all-if-ambiguous on  # use 'bind "set show ...."' when using straight in command line instead of bashrc
set completion-ignore-case on 
shopt -s autocd #Auto 'cd' when entering just a path
shopt -s cdspell #Automaticall correct mistyped dir names on cd 

PATH=$PATH:/home/thameera/ws/bin

alias g='git'

function parse_git_branch {
	  BRANCH="$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
	  if [ "$BRANCH" == "" ]; then
		  return 0
	  fi
	  [[ -n "$(git status 2>/dev/null | \
	      grep -F 'working directory clean')" ]] || STATUS="*"
	  printf "(%b)" "$BRANCH$STATUS"
}

function gbr() { cur_branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'); }

function gc() {	if [ $1 ]; then	gbr; prev_branch=$cur_branch; g co $1; fi; }

function gsw() { if [ $prev_branch ]; then gbr; g co $prev_branch; prev_branch=$cur_branch; else echo "Sorry, boss, no previous branch defined"; fi; }

#cd and ls in one
cl() { if [ -d "$1" ]; then cd "$1"; ls; else echo "bash: cl: '$1': Directory not found"; fi; }

#mkdir && cd
mcd() { mkdir -p "$@" && cd $_; } 

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'

alias aptc='apt-cache search'
alias apts='apt-cache show'
alias inst='sudo apt-fast install'
alias updt='sudo apt-fast update'
alias armv='sudo apt-fast remove'

alias please='sudo' # my favorite! ;)

alias l='ls -CF' #C -> show in cols; F -> append indicators (one of */=>@|) to entries 
alias la='ls -A'
alias ll='ls -alF' 
alias lsl='ls -l'
alias lsg='ls | grep' #needs arg
alias lr='ls -R' #recursive ls
alias lx='ll -BX' #sort by extension
alias lz='ll -rS' #sort by size
alias lt='ll -rt' #sort by date
# recursive listing:
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''

alias lsg='ls | grep'
alias grepr='grep -r'
alias tm='ps -ef | grep'  # task manager. Much like pgrep, but better
alias vi='vim'
alias vip='vi -p'
alias rm='rm -I'  # much nicer than rm -i

# git!
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

alias tw='(cd ~/ttytter;./_tty203 -ansi -dostream -ssl -verify -exts=ext/r2a.pl,ext/timestamp.pl,myext/info/info.pl,myext/pocket/pocket.pl)'
alias chmem='ps -eo rss,args | grep chrome | awk '\''{total+=$1}END{print total}'\'''
alias shuffle='for fname in *.jpg; do mv "$fname" $(echo "$fname" | sha1sum | cut -f1 -d" ").jpg; done'

# extract archives
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

alias vib='vi ~/.bashrc'
alias sb='source ~/.bashrc'
alias hist='history | grep'  #requires an arg

PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u: \[\e[33m\]\w\[\e[37m\]$(parse_git_branch)\[\e[32m\] \$\[\e[0m\] '

if [ -x /usr/games/cowsay -a -x /usr/games/fortune ]; then
	fortune -as | cowsay
fi
