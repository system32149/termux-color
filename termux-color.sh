#!/data/data/com.termux/files/usr/bin/bash
# termux-color
# License: Unlicense

#
# Options
#
if [ "$1" == "--help" ]; then
	echo "Usage: termux-color [OPTION]..."
	echo "Set the colorscheme of Termux."
	echo
	echo "  --help      display this help and exit"
	echo "  --version   output version information and exit"
	echo
	exit 0
	# TODO: add information to report bugs
fi
if [ "$1" == "--version" ]; then
	echo "termux-color (termux-color) 1.0.0"
	echo "License: Unlicense <https://unlicense.org>"
	echo "This software comes with NO WARRANTY, to the extent permitted by law."
	echo
	echo "Written by System32."
	exit 0
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
}

# Copy the colorscheme files from 'colors/file'
# to ~/.termux/colors.properties (if the directory)
# exists.
copy_colorscheme()
{
	cp $PREFIX/share/termux-color/colors/${SELECTED_COLORSCHEME} $HOME/.termux/colors.properties
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
fi

