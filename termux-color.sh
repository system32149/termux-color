#!/data/data/com.termux/files/usr/bin/bash
# termux-color - Change the colorscheme of Termux
# License: Unlicense
TERMUXCOLOR_VERSION="1.3"
COLORFILE_PATH="$HOME/.termux/colors.properties"

show_usage()
{
	echo "usage: termux-color [-hvV] [-c colorscheme] [-C colorscheme] ..."
	exit 0
}

# Copy the colorscheme files from 'colors/file'
# to ~/.termux/colors.properties (if the directory)
# exists.
copy_colorscheme()
{
	cp $PREFIX/share/termux-color/colors/${SELECTED_COLORSCHEME} ${COLORFILE_PATH}
	if [ "$VERBOSE" == "1" ]; then
		echo "[info] Copying colorscheme ${SELECTED_COLORSCHEME} to ${COLORFILE_PATH}"
	fi
}

#
# Options
#
if [ "$1" == "-h" ]; then
	show_usage
	if [ "$VERBOSE" == "1" ]; then
		echo "[info] Showed usage"
	fi
	exit 0
elif [ "$1" == "-v" ]; then
	echo "termux-color (termux-color) v$TERMUXCOLOR_VERSION"
	echo "License: Unlicense <https://unlicense.org>"
	echo "This software comes with NO WARRANTY, to the extent permitted by law."
	echo
	echo "Written by System32."
	if [ "$VERBOSE" == "1" ]; then
		echo "[info] Showed version information"
	fi
	exit 0
elif [ "$1" == "-c" ]; then
	SELECTED_COLORSCHEME="$2"
	copy_colorscheme
	exit 0
elif [ "$1" == "-C" ]; then
	SELECTED_COLORSCHEME="$2"
	copy_colorscheme
	termux-reload-settings
	exit 0
elif [ "$1" == "-V" ]; then
	VERBOSE=1
	if [ "$VERBOSE" == "1" ]; then
		echo "termux-color v$TERMUXCOLOR_VERSION"
		echo "[info] Enabled being verbose"
	fi
fi

#
# Functions
#

# Restart termux.
restart_termux()
{
	echo "Restarting Termux ..."
	termux-reload-settings
	if [ "$VERBOSE" == "1" ]; then
		echo "[info] Restarted termux."
	fi
}
# List of colorschemes.
color_list()
{
	if [ "$VERBOSE" == "1" ]; then
		echo "[info] Showing list of colorschemes ..."
	fi
	echo "[0] default"
	echo "[1] xterm_dark"
	echo "[2] monochrome"
	echo "[3] default_green"
}
# Lines to execute when being verbose.
verbose_selected_colorscheme()
{
	if [ "$VERBOSE" == "1" ]; then
		echo -e "[info] Selected colorscheme \'${SELECTED_COLORSCHEME}\'"
	fi
}

#
# Using interactively
#
echo "Select a colorscheme:"
color_list
echo -n "Select option: "
read COLOR_OPTION

# Set the $selected_colorscheme variable and execute the
# aforementioned functions.
if [ "$COLOR_OPTION" = "0" ]; then
	SELECTED_COLORSCHEME="default"
	verbose_selected_colorscheme
	copy_colorscheme
	restart_termux
elif [ "$COLOR_OPTION" = "1" ]; then
	SELECTED_COLORSCHEME="xterm_dark"
	verbose_selected_colorscheme
	copy_colorscheme
	restart_termux
elif [ "$COLOR_OPTION" = "2" ]; then
	SELECTED_COLORSCHEME="monochrome"
	verbose_selected_colorscheme
	copy_colorscheme
	restart_termux
elif [ "$COLOR_OPTION" = "3" ]; then
	SELECTED_COLORSCHEME="default_green"
	verbose_selected_colorscheme
	copy_colorscheme
	restart_termux
fi

