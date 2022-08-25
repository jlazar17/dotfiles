#.bashrc

set -o vi


export PATH=$PATH:/Users/jlazar/bin

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

## Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [[ -f ~/.bash_prompt ]]; then
  . ~/.bash_prompt
fi

# User specific aliases and functions #
alias combo='/home/jlazar/Code/build/env-shell.sh'
alias shovel='dataio-pyshovel'
alias jup="jupyter lab &> ~/jup.log &"
alias killjup="pkill -f jupyter"
alias c="ssh cobalt08.icecube.wisc.edu"
#alias cobalt="ssh cobalt"
alias cobalt="ssh cobalt -t 'cd /data/user/jlazar/; bash --login'"
alias ls='ls -GH'
alias modok='ssh mimo'
alias modok_jumper='ssh -CX -o ServerAliveInterval=30 -fN mimo'
#alias python='/usr/local/Cellar/python\@3.7/3.7.12/bin/python3'
#alias pip='python -m pip3'
alias julia='/Applications/Julia-1.7.app/Contents/Resources/julia/bin/julia'
alias jetson="sshjetson"
alias vi="vim"
alias juliatmp="julia --project=$(mktemp -d)"
alias please="sudo"
alias ipython="/usr/local/bin/ipython3"

# combine cd as ls into one command
function cl() {
    command cd "$@" && ls;
}

function cll() {
    command cd "$@" && ls -al;
}

function ml_exp() {
    command cd /Users/jlazar/IceCube/ml_experiments/; git pull; conda activate qiskit;
}

function taurunner() {
    command cd /Users/jlazar/IceCube/TauRunner/; git pull; conda activate qcml; conda-develop /Users/jlazar/IceCube/TauRunner/
}

function qcml() {
    command cd /Users/jlazar/research/qcml/; git pull; conda activate qcml; conda-develop /Users/jlazar/research/qcml/
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

function extract () {
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

export MPLCONFIGDIR=/Users/jlazar/.matplotlib/

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
[ -f "/Users/jlazar/.ghcup/env" ] && source "/Users/jlazar/.ghcup/env" # ghcup-env

cat ~/.evangelion_ascii.txt | lolcat-c
