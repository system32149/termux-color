#!/data/data/com.termux/files/usr/bin/bash
# termux-color - Change the colorscheme of Termux
# License: Unlicense
VERSION="v1.4"

show_usage()
{
	echo "usage: termux-color [-v] [-c colorscheme] [-C colorscheme] ..."
	exit 0
}

# Copy the colorscheme files from 'colors/file'
# to ~/.termux/colors.properties (if the directory)
# exists.
copy_colorscheme()
{
	cp $PREFIX/share/termux-color/colors/${SELECTED_COLORSCHEME} $HOME/.termux/colors.properties
}

#
# Options
#
if [ "$1" == "-v" ]; then
	echo "termux-color (termux-color) v$VERSION"
	echo "License: Unlicense <https://unlicense.org>"
	echo "This software comes with NO WARRANTY, to the extent permitted by law."
	echo
	echo "Written by System32."
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
elif [ $# -gt 0 ]; then
	show_usage
	exit 1
fi

#
# Functions
#

# Restart termux.
restart_termux()
{
	echo "Restarting Termux ..."
	termux-reload-settings
}
# List of colorschemes.
color_list()
{
	echo "[0] default"
	echo "[1] xterm_dark"
	echo "[2] monochrome"
	echo "[3] default_green"
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
	copy_colorscheme
	restart_termux
elif [ "$COLOR_OPTION" = "1" ]; then
	SELECTED_COLORSCHEME="xterm_dark"
	copy_colorscheme
	restart_termux
elif [ "$COLOR_OPTION" = "2" ]; then
	SELECTED_COLORSCHEME="monochrome"
	copy_colorscheme
	restart_termux
elif [ "$COLOR_OPTION" = "3" ]; then
	SELECTED_COLORSCHEME="default_green"
	copy_colorscheme
	restart_termux
fi

