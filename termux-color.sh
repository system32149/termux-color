#!/data/data/com.termux/files/usr/bin/bash
# termux-color - Change the colorscheme of Termux
# License: Unlicense
VERSION="1.6.1"

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
case $1 in
	"-v")
		echo "termux-color (termux-color) v$VERSION"
		echo "License: Unlicense <https://unlicense.org>"
		echo "This software comes with NO WARRANTY, to the extent permitted by law."
		echo
		echo "Written by System32."
		exit 0 ;;
	"-c")
		SELECTED_COLORSCHEME="$2"
		test -f ${PREFIX}/share/termux-color/colors/${2}
		if [ "$?" == "1" ]; then
			echo "termux-color: invalid colorscheme ${2}"
			exit 2
		else
			copy_colorscheme
			exit 0
		fi ;;
	"-C")
		SELECTED_COLORSCHEME="$2"
		test -f ${PREFIX}/share/termux-color/colors/${2}
		if [ "$?" == "1" ]; then
			echo "termux-color: invalid colorscheme ${2}"
			exit 2
		else
			copy_colorscheme
			termux-reload-settings
			exit 0
		fi ;;
esac
if [ $# -gt 0 ]; then
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
read -p "Select option: " COLOR_OPTION

# Set the $selected_colorscheme variable and execute the
# aforementioned functions.
case $COLOR_OPTION in
	"0")
		SELECTED_COLORSCHEME="default"
		copy_colorscheme
		restart_termux ;;
	"1")
		SELECTED_COLORSCHEME="xterm_dark"
		copy_colorscheme
		restart_termux ;;
	"2")
		SELECTED_COLORSCHEME="monochrome"
		copy_colorscheme
		restart_termux ;;
	"3")
		SELECTED_COLORSCHEME="default_green"
		copy_colorscheme
		restart_termux ;;
esac
