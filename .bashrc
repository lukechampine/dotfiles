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
export PS1="$white1[$blue2\u$white1@$green1\h$white1] $white1[$blue1\w$white1]\n$blue1\$$white2\273 \e[00m"

# aliases
alias ls="ls -h --color=auto"
alias cd..="cd .."
alias rm="recycle"
alias locate="locate -i"
alias emerge="sudo emerge"
alias wicd="sudo wicd-curses"
alias updatedb="sudo updatedb"
alias poweroff="sudo poweroff"
alias reboot="sudo reboot"
alias gitpull="git pull origin master"
alias gitcommit="git add * && git commit -m"
alias gitpush="git push origin master"
alias starwars="telnet towel.blinkenlights.nl"

# functions
aeiou() { read -p "Password: " -s PASS; ./.aeiou $PASS | xclip -selection clipboard; echo ""; }
gmail() { curl -u luke.champine:`perl /home/luke/.test.pl google` --silent "https://mail.google.com/mail/feed/atom" | awk 'BEGIN{FS="\n";RS="(</entry>\n)?<entry>"}NR!=1{print "\033[0;37m"$9"\033[0;92m ("$10")\033[0m:\t\033[0;36m"$2"\033[0m"}' | sed -e 's,<[^>]*>,,g' | column -t -s $'\t'; }
hexcode() { echo $1 | hexdump | awk '{print "\\x"toupper(substr($2,3,4)) "\\x"toupper(substr($2,0,2)) "\\x"toupper(substr($3,3,4))}' | head -1; }
recycle() { mv $1 ~/.recycle/; SIZE=`du -ch ~/.recycle/ | grep total | grep M | wc -l`; if [ $SIZE == 1 ]; then echo "Empty your recycle bin!"; fi }
emptybin() { \rm -rf ~/.recycle/*;} 
vack() { cp $1 $1.bck; vim $1; }

# external scripts
alias vacate="/home/luke/scripts/vacate.sh"
alias pounce="source /home/luke/scripts/pounce.sh"
alias colors="/home/luke/scripts/colorer.sh 1 && /home/luke/scripts/colorer.sh 2 && /home/luke/scripts/colorer.sh 3"
