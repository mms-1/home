#################################################################

# Color definitions:
red='\e[0;31m'
RED='\e[1;31m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m'
###
clear
echo -e "${BLUE}### WELCOME TO: ###${NC}"
echo -e `${SHELL} --version`
#echo -e "${BLUE} - DISPLAY: ${RED}$DISPLAY${NC}"
#date
function _exit()
{
    echo -e "${RED}I'll be back! ${NC}"
}
trap _exit EXIT

trap 'echo -ne "${RED}Process interrupted.${NC}"' 2              # trap Ctrl+C

# ------------------------------------------------------------------
#         aliases
# ------------------------------------------------------------------
c() { cd "$1"; pwd;}
alias cp='cp -vi'
alias mv='mv -vi'
alias rm='rm -v'
alias ll='ls -lah'
alias ls='ls -F --color=auto'
alias more='less'

#alias start_miguelol='/home/xmakmik/ws/git_rep/Miguelol/config/start_miguelol.sh &'
#alias start_colestherol='/home/xmakmik/COLESTHEROL/start_colestherol.sh &'

# Cool tools made by Jenkins
alias start_miguelol='/storelab/hlr_mde/GoogolPlex/xmakmik/tools/Miguelol/miguelol_start.sh'
alias start_colestherol='/storelab/hlr_mde/GoogolPlex/xmakmik/tools/Colestherol/colestherol_start.sh'
alias start_sea='/storelab/hlr_mde/GoogolPlex/xmakmik/tools/Sea/sea_start.sh'

alias tmux='/home/xmakmik/local/bin/tmux'

source ~/git-completion.bash
export PROMPT_COMMAND='history -a'

function my_ip()
{
    MY_IP=$(/sbin/ifconfig eth0 | awk '/inet/ { print $2 } ' | sed -e s/addr://)
}

function ii() # cool info
{
    echo "######################################################################"
    echo -e "[${red}i${NC}] You are at ${BLUE}$HOST${NC}${RED}$DISPLAY${NC} now"
    echo -e "[${red}i${NC}] Additional info: ${BLUE}" ; uname -a ; echo -ne ${NC}
    # echo -e "[${red}i${NC}] Current users: " ; sudo /usr/NX/bin/nxserver --userlist
    echo -e "[${red}i${NC}] User info: " ; w -h
    echo -ne "[${red}i${NC}] Date: ${BLUE}" ; date ; echo -ne ${NC}
    echo -ne "[${red}i${NC}] Uptime: ${BLUE}" ; uptime ; echo -ne ${NC}
    echo -e "[${red}i${NC}] Memory usage: " ; free
    my_ip 2>&- ;
    echo -ne "[${red}i${NC}] OAM IP: ${BLUE}" ; echo ${MY_IP:-"No connection"} ; echo -ne ${NC}
    echo -ne "[${red}i${NC}] Traffic IP: "
    for n in {1..9}; do
        MY_IP_N=$(/sbin/ifconfig eth$n 2>/dev/null | awk '/inet/ { print $2 } ' | sed -e s/addr://)
        echo -ne "(eth$n): ${BLUE}${MY_IP_N:-}${NC} "
    done
    echo -e ${NC}
    echo "######################################################################"
}


### End of .bashrc
echo -e "### ${RED}HAPPY WORK!${NC} ###"

ii
