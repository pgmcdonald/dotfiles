# .bashrc

# User specific aliases and functions
PS1='[\t]\u@\h:\w$ '

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Login greeting ------------------
#f running interactively, then:
#if [ "$PS1" ]; then
#	# Login greeting ------------------
#	if [ ! $SHOWED_SCREEN_MESSAGE ]; then
#		detached_screens=`screen -list | sed -n 's/^\(.*\)(Detached)$/|\1|/gp'`
#		if [ ! -z "$detached_screens" ]; then
#			echo ""
#			echo "+---------------------------------------+"
#			echo "| Detached screens are available:       |"
#			echo -n "$detached_screens"
#			echo
#			echo "+---------------------------------------+"
#			echo ""
#		else
#			echo ""
#			echo "+-----------------------------------------+"
#			echo "[ There are no detached screens available ]"
#			echo "+-----------------------------------------+"
#			echo ""
#		fi
#		export SHOWED_SCREEN_MESSAGE="true"
#	fi
#fi
