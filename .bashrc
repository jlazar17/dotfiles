# .bashrc

cat ~/.evangelion_ascii_1.txt | lolcat



test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

## Source global definitions
#if [ -f /etc/bashrc ]; then
#	. /etc/bashrc
#fi

# User specific aliases and functions #
alias combo='/home/jlazar/Code/build/env-shell.sh'
alias shovel='dataio-pyshovel'
alias jup="jupyter notebook &> ~/jup.log &"
alias c="ssh cobalt"

# combine cd as ls into one command
function cl() {
    local dir="$1"
    local dir="${dir:=$HOME}"
    if [[ -d "$dir" ]]; then
        cd "$dir" >/dev/null; ls
    else
        echo "bash: cl: $dir: Directory not found"
    fi
}

# function to move files to ~/trash rather than delete
function del() {
    local file="$1"
    if [[ -f "$file" ]]; then
        mv "$file" /Users/jlazar/.Trash/
    else
        echo "bash: del: $file is not a file"
    fi
}

extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1     ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "do not know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }


#RESET="\[\017\]"
#NORMAL="\[\033[0m\]"
#RED="\[\033[31;1m\]"
#GREEN="\[\033[32;1m\]"
#YELLOW="\[\033[33;1m\]"
#WHITE="\[\033[37;1m\]"
#SMILEY="${GREEN}:)${NORMAL}"
#FROWNY="${RED}:(${NORMAL}"
#SELECT="if [ \$? = 0 ]; then echo \"${SMILEY}\"; else echo \"${FROWNY}\"; fi"

# Throw it all together 
#export PS1="\[${RESET}\]\[${YELLOW}\]\h\[${NORMAL}\] \[\e[5m\A\] \`${SELECT}\` \[${YELLOW}\]>\[${NORMAL}\] \] "

### ETERNAL BASH HISTORY
# ---------------------
# https://stackoverflow.com/a/19533853/
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
/Users/jlazar/miniconda3/etc/profile.d/conda.sh
