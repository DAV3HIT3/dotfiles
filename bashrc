# vim:ft=sh:fdm=marker

# If not interactive, bail out
[[ $- != *i* ]] && return

# Bash options {{{
# Command name that is a directory name is treated as argument to cd
shopt -s autocd
# Correct minor directory spelling errors with cd
shopt -s cdspell
# Attempt to save all lines of a multi-line command in same history entry
shopt -s cmdhist
# History list is appended, rather than overwritten on exit
shopt -s histappend
# Pattern '**' expansion matches all files and directories and subdirectories
shopt -s globstar
# use physical path
set -o physical
#}}}

# completion
# shellcheck disable=SC1091
[[ -f /usr/local/etc/bash_completion ]] && . /usr/local/etc/bash_completion

# FZF (from fzf vim plugin)
__FZF_BASH_SCRIPT="${HOME}/.fzf.bash"
# shellcheck disable=SC1090
[ -f "${__FZF_BASH_SCRIPT}" ] && source "${__FZF_BASH_SCRIPT}"

# liquidprompt
# git clone https://github.com/nojhan/liquidprompt.git
__LIQUIDPROMPT="${HOME}/liquidprompt/liquidprompt"
# shellcheck disable=SC1090
[ -f "${__LIQUIDPROMPT}" ] && source "${__LIQUIDPROMPT}"

# gruvbox terminal colors (from gruvbox vim plugin)
__GRUVBOX_TERM_SCRIPT="${HOME}/.vim/plugged/gruvbox/gruvbox_256palette.sh"
# shellcheck disable SC1090
[ -f "${__GRUVBOX_TERM_SCRIPT}" ] && source "${__GRUVBOX_TERM_SCRIPT}"
