#!/usr/bin/env bash

# Truecolor test
echo "In truecolor this bar should be a smooth gradient:"
awk 'BEGIN{
    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
    for (colnum = 0; colnum<77; colnum++) {
        r = 255-(colnum*255/76);
        g = (colnum*510/76);
        b = (colnum*255/76);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
}'

## Termcap mode tests
echo
echo "Each line of text should be formatted as labeled:"
echo "$(tput blink)" blink "$(tput sgr0)"
echo "$(tput bold)" bold "$(tput sgr0)"
echo "$(tput dim)" dim "$(tput sgr0)"
echo "$(tput swidm)" doublewide "$(tput rwidm)"
echo "$(tput sitm)" italics "$(tput ritm)"
echo "$(tput rev)" reverse "$(tput sgr0)"
echo "$(tput invis)" invisible "$(tput sgr0)"
echo "$(tput smso)" standout "$(tput rmso)"
echo "$(tput ssubm)" subscript "$(tput rsubm)"
echo "$(tput ssupm)" superscript "$(tput rsupm)"
echo "$(tput smul)" underline "$(tput rmul)"
