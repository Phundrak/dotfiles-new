######################################################################
# Dotfile for the zsh shell, containing aliases and functions
# Copyright (C) 2017  Lucien Cartier-Tilet
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
######################################################################

# Line to hopefully fix tramp-mode in Spacemacs
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
bindkey ';5D' backward-word
bindkey ';5C' forward-word
bindkey -e
set -k
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/alex/.zshrc'

autoload -Uz compinit url-quote-magic
compinit
# End of lines added by compinstall


source /usr/share/zsh/site-contrib/powerline.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zshrc-private.zsh

autoload -Uz run-help
unalias run-help

export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
export EDITOR='emacs'
export PATH=$PATH:$HOME/local/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH/usr/local/bin:$HOME/local/lib

TEXINPUTS=~/.tex/scheme-listings-master/:$TEXINPUTS
TEXINPUTS=~/pgfplots/tex//:$TEXINPUTS

# Safety nets
# do not delete / or prompt if deleting more than 3 files at a time
alias rm='rm -I --preserve-root'
alias rmd='rm -r --preserve-root'
# confirmation
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
# Parenting changin perms on /
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Tune sudo and su
alias root='sudo -i'
alias su='sudo -i'

# Get system memory, CPU usage and GPU memory info
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias cpuinfo='lscpu'
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

alias ..='cd ..'
alias cd..='cd ..'
alias solo='cd ~/dotfiles/.config && ln -s compton-solo.conf compton.conf ; pkill compton ; compton'
alias multiscreen='cd ~/dotfiles/.config && ln -s compton-multi.conf compton.conf ; pkill compton ; compton'
alias ccat='highlight -O ansi'
alias grep="grep --color=auto"
alias help='run-help'
alias ll='ls -alh | less'
alias ls='ls --color'
alias lsl='ls -Alh --color'
alias la='ls -A --color'
alias mp3='youtube-dl -x --audio-format "mp3" $*'
alias mpv='mpv --no-border'
alias feh='feh -Zx.'
alias neofetch='clear && neofetch --cpu_temp C --os_arch off --cpu_cores physical --kernel_shorthand on --uptime_shorthand tiny'
alias disc-spc='~/Documents/code/Javascript/DiscordApps/launch.sh'
alias untar='tar -zxvf'
alias compress='tar -czf'
alias df='df -H'
alias du='du -ch'
mkcddir(){
    mkdir -p "$1" && cd "$1"
}
dlyt(){
    str="$1"
    youtube-dl --write-sub "${str#*=}"
}
ytdl(){
    str="$1"
    youtube-dl --write-sub "${str#*=}"
}
ytmpv(){
    str="$1"
    mpv ytdl://"${str#*=}"
}
rainymood() {
    FILE=$((RANDOM%4))
    URL="https://rainymood.com/audio1110/${FILE}.ogg"
    mpv "$URL" && rainymood
}

# Weather
we(){
    if [ -n "$1" ]; then
        str="$*";
        curl http://wttr.in/~${str// /+}
    else
        curl http://wttr.in/Aubervilliers
    fi
}
alias wea='we Aubervilliers'
alias wee='we Enghien+les+Bains'
alias wel='we Lyon'
alias wep='we Paris'

# Download
alias wget='wget -c'
alias 4chandl='wget -c -erobots=off -nd -rHD4cdn.org -Ajpg,png,gif,webm -Rs.jpg'
alias gehentaidl='wget -c -erobots=off -t4 -Umozilla -nd -rHl0 -Is,h -ERhtml'

# System
alias diskspace='du -S | sort -n -r |more'
alias hibernate='lock -t "Lucien Cartier-Tilet (Phuntsok Drak-pa), +33 (0)6 83 90 56 89" && systemctl hibernate'
alias suspend='lock -t "Lucien Cartier-Tilet (Phuntsok Drak-pa), +33 (0)6 83 90 56 89" && systemctl suspend'
alias spoweroff='systemctl poweroff -i'
alias sreboot='systemctl reboot -i'
alias zshrc='source ~/.zshrc'
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to\ full|percentage|time\ to\ empty"'
alias mountD='sudo mount -t ntfs /dev/sdb1 /mnt && cd /mnt/Phundrak/'
alias umountD='cd ~ && sudo umount /mnt'

# Emacs
alias enw='emacs -nw'
alias servemacs='emacs --daemon'
alias restartemacs='emacsclient --eval "(kill-emacs)"'

# Package Manager Pacman
alias aurupdate='pacaur -Syua'
alias forceupdate='sudo pacman -Syyu'
alias gimme='sudo pacman -Syu'
alias install='sudo pacman -S'
alias purge='sudo pacman -Sc'
alias remove='sudo pacman -Rscnd'
alias rmdb='sudo rm /var/lib/pacman/db.lck'
alias search='pacaur -Ss'
alias update='sudo pacman -Syu'
alias optimize='sudo pacman-optimize && sync'
alias pacaur='pacaur --ignore gstreamer0.10 --ignore gstreamer0.10-bad --ignore gstreamer0.10-bad-plugins --ignore gstreamer0.10-base --ignore gstreamer0.10-base-plugins --ignore gstreamer0.10-ugly --ignore gstreamer0.10-ugly-plugins'

# Dev
alias clang='clang -Wall'
alias clang++='clang++ -Wall'
alias g++='g++ -Wall'
alias gcc='gcc -Wall'
alias cdebug='cmake -DCMAKE_BUILD_TYPE=Debug'
alias crelease='cmake -DCMAKE_BUILD_TYPE=Release'
alias gitlog='git log --oneline --graph --decorate'
alias swipl='clear && swipl -q && clear'
cppnew() {
    mkdir -p "$1"
    cd "$1";
    mkdir -p src bin build debug
    cp ~/dotfiles/dev/CC/gitignore bin/.gitignore
    cp ~/dotfiles/dev/CC/gitignore build/.gitignore
    cp ~/dotfiles/dev/CC/gitignore debug/.gitignore
    cp ~/dotfiles/dev/C++/main.cc src/main.cc
    cp ~/dotfiles/dev/C++/CMakeLists.txt.part1 CMakeLists.txt
    printf "%s" "$1" >> CMakeLists.txt
    cat ~/dotfiles/dev/C++/CMakeLists.txt.part2 >> CMakeLists.txt
    printf "%s" "$1" >> CMakeLists.txt
    cat ~/dotfiles/dev/C++/CMakeLists.txt.part3 >> CMakeLists.txt
    git init
    git add .
    git commit -m "initial commit"
}
cnew() {
    mkdir -p "$1"
    cd "$1"
    mkdir -p src bin build debug
    cp ~/dotfiles/dev/CC/gitignore bin/.gitignore
    cp ~/dotfiles/dev/CC/gitignore build/.gitignore
    cp ~/dotfiles/dev/CC/gitignore debug/.gitignore
    cp ~/dotfiles/dev/C/main.c src/main.c
    cp ~/dotfiles/dev/C/CMakeLists.txt.part1 CMakeLists.txt
    printf "%s" "$1" >> CMakeLists.txt
    cat ~/dotfiles/dev/C/CMakeLists.txt.part2 >> CMakeLists.txt
    printf "%s" "$1" >> CMakeLists.txt
    cat ~/dotfiles/dev/C/CMakeLists.txt.part3 >> CMakeLists.txt
    git init
    git init
    git add .
    git commit -m "initial commit"
}


s() { # do sudo, or sudo the last command if no argument given
    if [[ $# == 0 ]]; then
        sudo $(history -p '!!')
    else
        sudo "$@"
    fi
}
