#!/usr/bin/bash

echo
echo "Setting up dotfiles..."
echo `date`
echo

# TODO: install fonts...
INSTALL_FONT=false

INSTALL_BASH=true
INSTALL_CONFIGS=true
INSTALL_VIM=true
INSTALL_TMUX=true

INSTALL_GDB=false

DIR="$(cd "$( dirname "${BASH_SOURCE[0]}")" && pwd)"

SUFFIX=".bak"

# Install bash dotfiles
if $INSTALL_BASH; then
    echo "Linking bash dotfiles..."

    # note: in array, no comma seperator
    FILES=("bashrc" "bash_profile" "inputrc")

    for FILE in "${FILES[@]}"
    do
        if [ -f "${HOME}/.${FILE}" ]; then
            printf "\tExisting file: ${HOME}/.${FILE} moving to .${FILE}${SUFFIX}\n"
            mv -v "${HOME}/.${FILE}" "${HOME}/.${FILE}${SUFFIX}"
        fi

        ln -sv "${DIR}/bash/${FILE}" "${HOME}/.${FILE}"
    done
    echo
fi

# Install home dir configs...
if $INSTALL_CONFIGS; then
    echo "Linking dotfiles..."

    # note: in array, no comma seperator
    FILES=( )

    for FILE in "${FILES[@]}"
    do
        if [ -f "${HOME}/.${FILE}" ]; then
            printf "\tExisting file: ${HOME}/.${FILE} moving to .${FILE}${SUFFIX}\n"
            mv -v "${HOME}/.${FILE}" "${HOME}/.${FILE}${SUFFIX}"
        fi

        ln -sv "${DIR}/${FILE}" "${HOME}/.${FILE}"
    done
    echo

#    if [ -d "${HOME}/.config/bash.d" ]; then
#        mv -v "${HOME}/.config/bash.d" "${HOME}/.config/bash.d${SUFFIX}"
#    fi
#
#    ln -sv "${LAYER_DIR}/.config/bash.d" "${HOME}/.config/bash.d"

fi




echo "...dotfiles setup complete!"
