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

## Supporting files (load if present)
__CONFIG_FILES="${HOME}/.c3e/shell/shell.d/*.bash"
for __CONFIG_FILE in ${__CONFIG_FILES}; do
# shellcheck disable=SC1090
	source "${__CONFIG_FILE}"
done
unset __CONFIG_FILES

# completion
# shellcheck disable=SC1091
[[ -f /usr/local/etc/bash_completion ]] && . /usr/local/etc/bash_completion

# bash completions {{{
__COMPLETION_FILE_DIR="${HOME}/.config/c3e/bash/bash_completion.d"
__COMPLETION_FILES="${HOME}/.config/c3e/bash/bash_completion.d/*"
if [[ -d "${__COMPLETION_FILE_DIR}" ]]; then
	for __COMPLETION_FILE in ${__COMPLETION_FILES}; do
		# shellcheck disable=SC1090
		source "${__COMPLETION_FILE}"
	done
fi
# }}}

# FZF
# shellcheck disable=SC1090
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
