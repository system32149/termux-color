SHELL = /data/data/com.termux/files/usr/bin/sh
INSTALL = /data/data/com.termux/files/usr/bin/install

PREFIX = /data/data/com.termux/files/usr

.PHONY: all install uninstall

all:
	@echo "This program isn't intended for the 'all' target."

install:
	# Creating directories
	mkdir -p $(PREFIX)/share/termux-color
	mkdir -p $(PREFIX)/share/doc/termux-color
	# The exexutable
	$(INSTALL) termux-color.sh $(PREFIX)/bin/termux-color
	# Documentation
	cp README $(PREFIX)/share/doc/termux-color/README
	cp COPYING $(PREFIX)/share/doc/termux-color/LICENSE
	cp TODO $(PREFIX)/share/doc/termux-color/TODO
	cp INSTALL $(PREFIX)/share/doc/termux-color/INSTALL
	# Colorscheme files
	cp -r colors/ $(PREFIX)/share/termux-color
	# Man page
	cp -r termux-color.1 $(PREFIX)/share/man/man1/termux-color.1

uninstall:
	rm -r $(PREFIX)/share/termux-color
	rm -r $(PREFIX)/share/doc/termux-color
	rm $(PREFIX)/bin/termux-color
	rm $(PREFIX)/share/man/man1/termux-color.1

