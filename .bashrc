# colors
black1='\[\e[0;30m\]'
black2='\[\e[1;30m\]'
red1='\[\e[0;31m\]'
red2='\[\e[1;31m\]'
green1='\[\e[0;32m\]'
green2='\[\e[1;32m\]'
yellow1='\[\e[0;33m\]'
yellow2='\[\e[1;33m\]'
blue1='\[\e[0;34m\]'
blue2='\[\e[1;34m\]'
purple1='\[\e[0;35m\]'
purple2='\[\e[1;35m\]'
cyan1='\[\e[0;36m\]'
cyan2='\[\e[1;36m\]'
white1='\[\e[0;37m\]'
white2='\[\e[1;37m\]'

# start dir
cd ~

# prompt
export PS1="$white1[$cyan2\u$white1@$green2\h$white1] $white1[$blue2\w$white1]\n$blue2\$$white2\273 \e[00m"

# aliases
alias ls="ls -h --color=auto"
alias cd..="cd .."
alias rm="recycle"
alias locate="locate -i"
alias wicd="sudo wicd-curses"
alias emerge="sudo emerge"
alias updatedb="sudo updatedb"
alias poweroff="sudo poweroff"
alias mountwin="sudo mount -t ntfs -o nls=utf8,umask=02222 /dev/sda1 /media/windows"
alias reboot="sudo reboot"
alias starwars="telnet towel.blinkenlights.nl"

# functions
recycle() { 
    if [ -n "`pwd | grep .recycle`" ];
    then 
        \rm $1;
    else
        mv $1 ~/.recycle/; 
    fi
    SIZE=`du -s ~/.recycle/ | awk '{ print $1 }'`;
    if [ "$SIZE" -ge 10000 ];
    then 
        echo "Empty your recycle bin! (Size: $SIZE KB)"; 
    fi 
}
vack() { cp $1 $1.bck; vim $1; }
bckswp() { mv $1 $1.bck.swp; mv $1.bck $1; mv $1.bck.swp $1.bck; }

# external scripts
alias vacate="/home/luke/scripts/vacate.sh"
alias pounce="source /home/luke/scripts/pounce.sh"
alias extract="/home/luke/scripts/extract.sh"
alias colors="/home/luke/scripts/colorer.sh 1 && /home/luke/scripts/colorer.sh 2 && /home/luke/scripts/colorer.sh 3"
