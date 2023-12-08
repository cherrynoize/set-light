FILENAME := set-light

.PHONY: install
install:
	chmod +x '$(FILENAME)'
	mkdir -p '$(DESTDIR)$(PREFIX)/bin'
	cp '$(FILENAME)' '$(DESTDIR)$(PREFIX)/bin/$(FILENAME)'
	./set-backlight-rules.sh
	gpasswd -a "$USER" video

.PHONY: uninstall
uninstall:
	rm -f '$(DESTDIR)$(PREFIX)/bin/$(FILENAME)'
