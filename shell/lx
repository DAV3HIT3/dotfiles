# vim:ft=sh:fdm=marker

# [BASH] [ZSH ]lx - Fancy dancy long dir listing 
function lx {
	ls_lines=$(command ls -afq -1 "$@" | wc -l)

	if [ "$ls_lines" -ge "$LINES" ]; then
		command ls -A --color -F --group-directories-first -h -l "$@" | command less -e -n -R -X
	else
		command ls -A --color -F --group-directories-first -h -l "$@"
	fi
}
