SHELL = /data/data/com.termux/files/usr/bin/sh
INSTALL = /data/data/com.termux/files/usr/bin/install

PREFIX = /data/data/com.termux/files/usr

.PHONY: all install uninstall

all:
	@echo "This program isn't intended for the 'all' target."

install:
	mkdir -p $(PREFIX)/share/termux-color
	mkdir -p $(PREFIX)/share/doc/termux-color
	$(INSTALL) termux-color.sh $(PREFIX)/bin/termux-color
	cp README $(PREFIX)/share/doc/termux-color/README
	cp COPYING $(PREFIX)/share/doc/termux-color/LICENSE
	cp TODO $(PREFIX)/share/doc/termux-color/TODO
	cp -r colors/ $(PREFIX)/share/termux-color

uninstall:
	rm -r $(PREFIX)/share/termux-color
	rm -r $(PREFIX)/share/doc/termux-color
	rm $(PREFIX)/bin/termux-color

