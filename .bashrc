#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi

alias cd..="cd .."
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias info='info --vi-keys'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export PAGER='less'
export NNN_PLUG='D:dups;d:diffs;h:hexview'

launch(){
    swaymsg mark swallowed
    swaymsg move window to scratchpad
    "$@"
    swaymsg [con_mark="swallowed"] scratchpad show
    swaymsg floating disable
    swaymsg unmark swallowed

}

alias c="cd"
alias ccat="highlight --out-format=ansi"
alias def="sdcv"
alias dl="youtube-dl --add-metadata -ic"
alias dla="youtube-dl --add-metadata -xic"
alias docker="sudo docker"
alias grep="grep --color=auto"
alias imv="launch imv"
alias kk="sudo killall -9"
alias lls="exa"
alias ls="exa --icons"
alias l="ls"
alias mpvw="launch mpv --force-window=yes --keep-open=yes"
alias pac="sudo pacman"
alias srcme="source ~/.bashrc"
alias su="sudo su"
alias svim="sudo vim"
alias tmux="tmux -u -2"
alias tsrc="tmux source-file ~/.tmux.conf"
alias vim="vim -X"
alias newsboat="newsboat -r"

alias mdarg="exa -1 --sort=modified | xargs -d '\n'"
alias rndarg="exa -1 | sort -R | xargs -d '\n'"

aur(){
    pushd .
    cd ~/build
    pkgloc=$1
    echo $pkgloc
    echo $pkgloc | grep '\\.' || pkgloc=https://aur.archlinux.org/$1.git
    echo $pkgloc
    git clone $pkgloc
    var=$pkgloc
    basenamedir=${var::-4}
    basenamedir=${basenamedir##*/}
    cd $basenamedir
    makepkg -sci
    sudo pacman -U *.pkg.tar.xz --noconfirm
    popd
}

#source /usr/share/doc/pkgfile/command-not-found.bash
source ~/.fonts/*.sh

export HISTCONTROL="erasedups:ignorespace"
stty -ixon
shopt -s autocd cdspell checkwinsize direxpand dirspell extglob histappend lithist


PS1="[\d \t]\033[0;33m \u@\h \[\033[0;35m\]\w \033[0m\$ "

neofetch

