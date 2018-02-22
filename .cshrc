#echo "Hello tcsh =)"

###
# Color definitions
###
set red   = "%{\033[0;31m%}"
set RED   = "%{\033[1;31m%}"
set green = "%{\033[0;32m%}"
set GREEN = "%{\033[1;32m%}"
set yello = "%{\033[0;33m%}"
set YELLO = "%{\033[1;33m%}"
set blue  = "%{\033[0;34m%}"
set BLUE  = "%{\033[1;34m%}"
set cyan  = "%{\033[0;36m%}"
set CYAN  = "%{\033[1;36m%}"
set NC    = "%{\033[0m%}"

###
# Command line prompt
###
alias __git_current_branch 'git rev-parse --abbrev-ref HEAD >& /dev/null && echo "(`git rev-parse --abbrev-ref HEAD`) "'
alias precmd 'set prompt="${RED}%n${NC}@%m [${green}%P${NC}] ${CYAN}`__git_current_branch`${NC}[${yello}%~${NC}] ${NC}%B%# "'



###
# GIT settings
###

module add git 
module add kdiff3 
module add firefox

setenv PAGER less
setenv LESS "-M -I -R --ignore-case --quit-at-eof --LONG-PROMPT --squeeze-blank-lines --HILITE-UNREAD --search-skip-screen --RAW-CONTROL-CHARS"
