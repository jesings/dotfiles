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

alias ccat="highlight --out-format=ansi"
alias def="sdcv"
alias dl="youtube-dl --add-metadata -ic"
alias dla="youtube-dl --add-metadata -xic"
alias docker="sudo docker"
alias grep="grep --color=auto"
alias kk="sudo killall -9"
alias lls="exa"
alias ls="exa --icons"
alias pac="sudo pacman"
alias srcme="source ~/.bashrc"
alias su="sudo su"
alias svim="sudo vim"
alias tmux="tmux -u -2"
alias tsrc="tmux source-file ~/.tmux.conf"
alias vim="vim -X"
alias ivim="vim -X -u ~/.vim/lsp.vim"

alias mdarg="exa -1 --sort=modified | xargs -d '\n'"
alias rndarg="exa -1 | sort -R | xargs -d '\n'"

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

source /usr/share/doc/pkgfile/command-not-found.bash
source $HOME/.config/broot/launcher/bash/br
source ~/.fonts/*.sh

export HISTCONTROL="erasedups:ignorespace"
stty -ixon
shopt -s autocd cdspell checkwinsize direxpand dirspell extglob histappend lithist


PS1="[\d \t]\033[0;33m \u@\h \[\033[0;35m\]\w \033[0m\$ "

neofetch

