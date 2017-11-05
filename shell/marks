# vim:ft=sh:fdm=marker
# [TODO] Bug: marking a name of a dir that already has a mark creates a sym link
# in the target dir. Check and fix. Example to create: mark in user home dir
# then mark again specifying name "user" for mark.


# [BASH] [ZSH] mark- quickly navigate filesystem
export MARKPATH="${HOME}/.marks"
export CDPATH=${MARKPATH}

# mark current directory
# Creates MARKPATH directory if doesn't exist
function mark {
	mkdir -p "${MARKPATH}"

	ln -s "$PWD" "${MARKPATH}/$1"

	if [ $? -eq 0 ]; then
		echo "Mark added."
	else
		echo "FAILURE: Unable to add mark."
	fi
}

# remove specified mark
function unmark {
	if [ -h "${MARKPATH}/$1" ]; then
		rm -i "${MARKPATH}/$1"

		if [ $? -eq 0 ]; then
			echo "Mark removed."
		else
			echo "FAILURE: Unable to remove mark."
		fi
	else
		echo "Mark not found. Nothing to do."
	fi

}

# list all marks
function marks {
	if [ -d "${MARKPATH}" ]; then
		command ls -l --color=always "${MARKPATH}" | tr -s ' ' | cut -d' ' -f9- && echo
	else
		echo "No marks found in directory: ${MARKPATH}"
	fi
}
