#!/usr/bin/env bash

echo $PWD
tmux set-environment TMUXPWD_$(tmux display -p "#D" | tr -d %) 
