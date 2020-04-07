set -o vi
#
# ~/.bashrc
#
alias cd..="cd .."
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias info='info --vi-keys'

export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

alias wget="wget --hsts-file=$HOME/.config/wget-hsts"

alias su="sudo su"
alias vim="vim -X"
alias svim="sudo vim"
alias pac="sudo pacman"
alias lls="exa"
alias ls="exa --icons"
alias grep="grep --color=auto"
alias ccat="highlight --out-format=ansi"
alias dl="youtube-dl --add-metadata -ic"
alias dla="youtube-dl --add-metadata -xic"
alias kk="sudo killall -9"
alias def="sdcv"
alias tmux="tmux -u -2"
alias tsrc="tmux source-file ~/.tmux.conf"
source $HOME/.config/broot/launcher/bash/br

aur(){
    pushd .
    cd ~/build
    git clone $1
    var=$1
    echo $var
    basenamedir=${var::-4}
    echo $basenamedir
    basenamedir=${basenamedir##*/}
    echo $basenamedir
    cd $basenamedir
    makepkg -sci
    sudo pacman -U *.pkg.tar.xz --noconfirm
    popd
}

alias mdarg="exa -1 --sort=modified | xargs -d '\n'"
alias rndarg="exa -1 | sort -R | xargs -d '\n'"

stty -ixon

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="\[\033[1;34m\][\d \t]\[\033[32m\] \u@\h \[\033[37m\]\w \$ \[\033[0;37m\]"

neofetch
export HISTCONTROL=ignorespace

alias docker="sudo docker"
alias srcme="source ~/.bashrc"
source ~/.fonts/*.sh
