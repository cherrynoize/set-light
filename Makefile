PREFIX := /usr/local
FILENAME := set-light
SERVICE := set-brightness-rules.service

.PHONY: install
install:
	chmod +x '$(FILENAME)'
	sudo mkdir -p '$(DESTDIR)$(PREFIX)/bin'
	sudo cp '$(FILENAME)' '$(DESTDIR)$(PREFIX)/bin/$(FILENAME)'
	sudo cp '$(SERVICE)' '/etc/systemd/system/$(SERVICE)'
	sudo systemctl enable --now '$(SERVICE)'
	sudo gpasswd -a "${USER}" video

.PHONY: uninstall
uninstall:
	sudo rm -f '$(DESTDIR)$(PREFIX)/bin/$(FILENAME)'
	sudo rm -f '/etc/systemd/system/$(SERVICE)'
