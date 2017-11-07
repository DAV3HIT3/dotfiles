# vim:ft=sh:fdm=marker

# [BASH] [ZSH] info
alias info='info --vi-keys'

alias vi=vim

# [BASH] [ZSH] ls
alias ls="ls -N --color=auto"
alias l1="ls -1"
alias ll="ls -lhF"
alias lll="ls -alhF"
alias ltr="ls -lhFtr"

# [BASH] [ZSH] grep
alias grep="grep --color=auto"

# Less is more!
alias less='less -R'
alias more=less

alias up='cd ..'

# -------------------------------------
# Make short cuts
#
# Make clean
alias mc='make clean'

# Make parallel (figure out how many CPUs are present)
function mj(){
	num_cpu=$(command nproc --all)
	echo "make -j${num_cpu}"
	make -j${num_cpu}
}

# -------------------------------------
# Run top for given process name
function ptop(){
    top -d0.5 -H -p $(pgrep -d',' $1)
}

