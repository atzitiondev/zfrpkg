#!/bin/sh

BINDIR=/usr/bin
CONFDIR=/etc
CACHE_DIR=/var/cache/zfrpkg
PORT_DIR=/usr/ports
REVDEPD=/etc/revdep.d
REVDEPCONF=/etc/revdep.conf

install -d ${DESTDIR}${BINDIR}
install -d ${DESTDIR}${CONFDIR}
install -d ${DESTDIR}${PORT_DIR}
install -d ${DESTDIR}${REVDEPD}

install -dm777 ${DESTDIR}${CACHE_DIR}/packages
install -dm777 ${DESTDIR}${CACHE_DIR}/sources
install -dm777 ${DESTDIR}${CACHE_DIR}/work

install -m755 xchroot revdep pkgadd pkgdel pkgbuild zfr updateconf portsync \
              pkgbase pkgdepends pkgrebuild portcreate ${DESTDIR}${BINDIR}
install -m644 zfrpkg.conf zfrpkg.repo zfrpkg.alias zfrpkg.mask ${DESTDIR}${CONFDIR}

install -m644 revdep.conf ${DESTDIR}${REVDEPCONF}
