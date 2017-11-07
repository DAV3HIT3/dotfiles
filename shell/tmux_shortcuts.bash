
# ----------------------------------------------------
# TMUX aliases and shortcuts

alias tls='tmux ls'

function tkill(){
    tmux kill-session -t $1
}

function tat(){
    tmux att -t $1
}

function tnew(){
    tmux new -s $1
}

