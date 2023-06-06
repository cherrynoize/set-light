FILENAME := set-light

.PHONY: install
install:
	chmod +x '$(FILENAME)'
	cp '$(FILENAME)' '$(DESTDIR)$(PREFIX)/bin/$(FILENAME)'
	cp '10-$(FILENAME)-backlight.rules' '/usr/lib/udev/rules.d/'
	gpasswd -a "$USER" video

.PHONY: uninstall
uninstall:
	rm -f '$(DESTDIR)$(PREFIX)/bin/$(FILENAME)'
	rm -f '10-$(FILENAME)-backlight.rules'
