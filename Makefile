# SPDX-License-Identifier: AGPL-3.0-or-later

all:
	echo -n

include build.mk

install:
	mkdir -p $(DESTDIR)/etc/sudoers.d
	$(call mk_install_dir, common/conf)
	$(call mk_install_dir, data/altermime)
	$(call mk_install_dir, data/cbpolicyd/db)
	$(call mk_install_dir, data/clamav)
	$(call mk_install_dir, data/opendkim)
	$(call mk_install_dir, data/postfix)

	cp conf/postfix/master.cf.in              $(INSTALL_DIR)/common/conf
	cp conf/postfix/tag_as_foreign.re.in      $(INSTALL_DIR)/common/conf
	cp conf/postfix/tag_as_originating.re.in  $(INSTALL_DIR)/common/conf
	cp conf/02_zimbra-mta                     $(DESTDIR)/etc/sudoers.d

clean:
	echo -n
