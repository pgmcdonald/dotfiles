# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
#export CLICOLOR=1
#export LSCOLORS=ExFxCxDxBxegedabagacad
#export LSCOLORS=DxGxcxdxCxegedabagacad


if [[ "`uname`" == *"Darwin"* ]]
then
    # OS X uses BSD ls which is relatively restricted compared to
    # GNU ls as far as coloring options go. Stick to the basics here.
    # LSCOLORS is in pairs (fgcolor, bgcolor)

    # Colorscheme for LSCOLORS (BSD)
    # a => black    A => dark gray
    # b => red      B => bold red
    # c => green    C => bold green
    # d => brown    D => yellow
    # e => blue     E => bold blue
    # f => magenta  F => bold magenta
    # g => cyan     G => bold cyan
    # h => gray     H => white
    # x => default

    # Ordering for LSCOLORS(BSD)
    # 1. directory
    # 2. symbolic link
    # 3. socket
    # 4. pipe
    # 5. executable
    # 6. block device
    # 7. character device
    # 8. executable with setuid set
    # 9. executable with setguid set
    # 10. directory writable by others, with sticky bit
    # 11. directory writable by others, without sticky bit
    
    export LSCOLORS="ExGxbxdxCxegedabagacad"

    # Must use either CLICOLOR=1 or ls -G
    export CLICOLOR=1
fi


export SVN_EDITOR=vim

# User specific environment and startup programs
JAVA_HOME=/opt/java/jdk

PATH=/opt/python/bin:$PATH:$JAVA_HOME/bin:/opt/bin:$HOME/bin:.
#. /opt/mp/bin/etl.env
. /opt/dbx/config/etl.env

export PS1="[\u@\h \W]\$ "
export FPATH=~/func

export JAVA_HOME PATH
#export PGDATABASE=dds_prd
unset USERNAME

set -o vi

alias name='~/func/name'
alias mp_screen='~/func/mp_screen'
alias stg='cd /opt/dotomi/mp/stage_tmp'
alias bigfiles='~/ksh/bigfiles.ksh'
alias display='~/func/display'
alias cj_display='~/func/cj_display'
alias dbx_display='~/func/dbx_display'
alias mp_help='~/func/mp_help'
alias mps='cd /opt/mp/sql_scripts'
alias dbxs='cd /opt/dbx/sql_scripts'
alias cjs='cd /opt/cj/sql_scripts'
alias mps_old='cd /usr/oracle/DataImport'
alias mp='cd /opt/mp/bin'
alias dbx='cd /opt/dbx/bin'
alias cj='cd /opt/cj/bin'
alias data='cd  /opt/dotomi/mp'
alias dbxdata='cd  /opt/dotomi/dbx'
alias mplogs='cd /opt/dotomi/mp/logs'
alias dbxlogs='cd /opt/dotomi/dbx/logs'
alias cjlogs='cd /opt/dotomi/cj/logs'
alias guard='cd /opt/dotomi/guardian_development_sites/pmcdonald/guardian_site'

alias vi='vim'


function lsext()
{
find . -type f -iname '*.'${1}'' -exec ls -l {} \; ;
}

function fsize()
{
find . -type f | xargs ls -s | sort -rn | awk '{size=$1/1024; printf("%dMb %s\n", size,$2);}' | head -50;
}

unset LS_COLORS
unset PROMPT_COMMAND

# Login greeting ------------------
#f running interactively, then:
if [ "$PS1" ]; then
       # Login greeting ------------------
       if [ ! $SHOWED_SCREEN_MESSAGE ]; then
               #detached_screens=`screen -list | sed -n 's/^\(.*\)(Detached)$/|\1|/gp'`
               detached_screens=`screen -list | sed -n 's/^\(.*\)(Detached)$/|\1/gp'`
               if [ ! -z "$detached_screens" ]; then
                       echo ""
                       echo "+---------------------------------------+"
                       echo "| Detached screens are available:       |"
                       echo "+---------------------------------------+"
                       echo -n "$detached_screens"
                       echo
                       echo "+---------------------------------------+"
                       echo ""
               else
                       echo ""
                       echo "+-----------------------------------------+"
                       echo "[ There are no detached screens available ]"
                       echo "+-----------------------------------------+"
                       echo ""
               fi
               export SHOWED_SCREEN_MESSAGE="true"
       fi
fi
