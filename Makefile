VERSION=2.0.0
DATE=2018-11-02
DESTDIR=/

INSTALL=install
SED=sed

install: install-bin install-man

install-bin: 
	$(INSTALL) -o root -g root -d -m 755 $(DESTDIR)/etc/pickle.d/keys
	$(INSTALL) -o root -g root -d -m 755 $(DESTDIR)/sbin
	$(INSTALL) -o root -g root -d -m 755 $(DESTDIR)/var/log
	$(INSTALL) -o root -g root -m 755 src/pickle $(DESTDIR)/sbin/pickle
	$(SED) -i $(DESTDIR)/sbin/pickle -e 's/%VERSION%/$(VERSION)/g'
	$(SED) -i $(DESTDIR)/sbin/pickle -e "s/%DATE%/$(DATE)/g"
	$(INSTALL) -o root -g root -m 644 src/etc/pickle.conf $(DESTDIR)/etc/
	$(INSTALL) -o root -g root -m 644 src/etc/pickle.d/keys/* $(DESTDIR)/etc/pickle.d/keys/

install-doc:

