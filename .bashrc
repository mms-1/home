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

echo -e "${BLUE}This is BASH ${RED}${BASH_VERSION%.*}${BLUE} - DISPLAY on ${RED}$DISPLAY${NC}"
date
function _exit()
{
    echo -e "${RED}I'll be back! ${NC}"
}
trap _exit EXIT

# ------------------------------------------------------------------
#         aliases
# ------------------------------------------------------------------
c() { cd "$1"; pwd;}
alias cp='cp -vi'
alias mv='mv -vi'
alias rm='rm -v'
alias ll='ls -lah'
alias ls='ls -F --color=auto'

source ~/git-completion.bash

function my_ip()
{
    MY_IP=$(/sbin/ifconfig eth0 | awk '/inet/ { print $2 } ' | sed -e s/addr://)
    MY_IP2=$(/sbin/ifconfig eth2 | awk '/inet/ { print $2 } ' | sed -e s/addr://)
    MY_ISP=$(/sbin/ifconfig eth0 | awk '/P-t-P/ { print $3 } ' | sed -e s/P-t-P://)
}

function ii() # cool info
{
    echo "######################################################################"
    echo -e "[${red}i${NC}] You are at ${BLUE}$HOST${NC}${RED}$DISPLAY${NC} now"
    echo -e "[${red}i${NC}] Additional info: ${BLUE}" ; uname -a ; echo -ne ${NC}
    echo -e "[${red}i${NC}] Current users: " ; sudo /usr/NX/bin/nxserver --userlist
    echo -e "[${red}i${NC}] Additional user info: " ; w -h
    echo -ne "[${red}i${NC}] Date: ${BLUE}" ; date ; echo -ne ${NC}
    echo -ne "[${red}i${NC}] Uptime: ${BLUE}" ; uptime ; echo -ne ${NC}
    echo -e "[${red}i${NC}] Memory usage: " ; free
    my_ip 2>&- ;
    echo -ne "[${red}i${NC}] OAM IP: ${BLUE}" ; echo ${MY_IP:-"No connection"} ; echo -ne ${NC}
    echo -ne "[${red}i${NC}] Traffic IP: ${BLUE}" ; echo ${MY_IP2:-"No connection"} ; echo -ne ${NC}
    #echo -e "[${red}i${NC}] Provider (ISP): " ; echo ${MY_ISP:-"No connection"}
    echo "######################################################################"
}

### End of .bashrc
echo -e "### ${RED}HAPPY WORK!${NC} ###"
