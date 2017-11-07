# vim:ft=sh:fdm=marker

# [BASH] [ZSH] cscoper - cscope file generator 
function cscoper {
	find . -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" > cscope.files
	cscope -q -R -b -i cscope.files
}
