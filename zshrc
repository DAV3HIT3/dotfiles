# vim:ft=zsh:fdm=marker

# Path to your oh-my-zsh installation.
export ZSH=/Users/jason/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
PATH="/usr/local/mysql/bin:/usr/local/sbin:/usr/local/opt/go/libexec/bin:/Library/Frameworks/Python.framework/Versions/3.5/bin:$PATH"
# Homebrew GNU utils override default BSD utils
PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"

MANPATH="/usr/local/opt/coreutils/libexec/gnuman:/usr/local/opt/findutils/libexec/gnuman:/usr/local/opt/gnu-sed/libexec/gnuman:/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH"

# DCSS alias
[ -f '/Applications/Dungeon Crawl Stone Soup - Console.app/Contents/Resources/crawl' ] && alias crawl='/Applications/Dungeon\ Crawl\ Stone\ Soup\ -\ Console.app/Contents/Resources/crawl'

# jenv config {{{
# Only run if jenv exists and $JAVA_HOME not already set
if ( hash jenv 2>/dev/null && [ -z "${JAVA_HOME}" ] ); then
	eval "$(jenv init -)"
fi
#}}}

# Environmental variables {{{

# Editor config {{{
VISUAL="vim"
# Set EDITOR same as VISUAL
EDITOR="${VISUAL}"
#}}}

# Pager config {{{
PAGER="less"
# less config
# x4 : tabstop 4 (vs 8)
# F  : exit if output fits on one screen
# R  : raw control codes
# S  : chop long lines
# X  : don't send termcap init/deinit
# s  : combine multiple blank lines into 1
LESS="-x4FRSXs"
#}}}

# vim as man pager {{{
# Set true to enable vim as man pager
__ENABLE_VIMMANPAGER=1
if [[ "${__ENABLE_VIMMANPAGER}" ]]; then
	export MANPAGER="/bin/sh -c \"col -b | vim -NRM -c 'ru ftplugin/man.vim' -c 'set nofen ch=1 stal=0 ls=0' -c 'setlocal nonu nornu cc=' -c 'setf man' -\""
fi
unset __ENABLE_VIMMANPAGER
#}}}

# Shell variables {{{
# Append history from this session to the history
PROMPT_COMMAND='history -a'
# Don't put the following in the history
HISTIGNORE="${HISTIGNORE}:cd:cd ..:tmux:vim:alias:exit:l[slx]:history *:pwd:clear:[bf]g"
# Don't put commands that begin with space or dupes in history
HISTCONTROL='ignoreboth:erasedups'
# (500) Number of commands to remember in the command history
HISTSIZE=2000
#}}}

# jenv config {{{
# Only run if jenv exists and $JAVA_HOME not already set
if ( hash jenv 2>/dev/null && [ -z "${JAVA_HOME}" ] ); then
	eval "$(jenv init -)"
fi
#}}}

export VISUAL EDITOR PAGER LESS GROFF_NO_SGR GREP_OPTIONS
# }}}

# Functions {{{
# lx - Fancy dancy long dir listing {{{
function lx() {
	ls_lines=$(command ls -afq -1 "$@" | wc -l)

	if [ "$ls_lines" -ge "$LINES" ]; then
		command ls -A --color -F --group-directories-first -h -l "$@" | command less -e -n -R -X
	else
		command ls -A --color -F --group-directories-first -h -l "$@"
	fi
}
#}}}

# marks - quickly navigate filesystem {{{
export MARKSPATH="${HOME}/.marks"
export CDPATH=${MARKSPATH}

# mark current directory
function mark {
	mkdir -p "${MARKSPATH}"; ln -s "$PWD" "${MARKSPATH}/$1"
}

# remove specified mark
function unmark {
	rm -i "${MARKSPATH}/$1"
}

# list all marks
function marks {
	command ls -l --color=always "${MARKSPATH}" | tr -s ' ' | cut -d' ' -f9- && echo
}
#}}}

# cscoper - cscope file generator {{{
function cscoper {
	find . -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" > cscope.files
	cscope -q -R -b -i cscope.files
}
#}}}
# }}}

# Aliases {{{
# info
alias info='info --vi-keys'

# ls
alias ls="ls -N --color=auto"
alias ll="ls -N --color=auto -l -h"

# grep
alias grep="grep --color=auto"
# }}}
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval $( dircolors -b $HOME/.config/dotfiles/LS_COLORS )
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
