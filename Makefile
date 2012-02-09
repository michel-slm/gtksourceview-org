DESTDIR=${HOME}/.local
LANGDIR2=${DESTDIR}/share/gtksourceview-2.0/language-specs
LANGDIR3=${DESTDIR}/share/gtksourceview-3.0/language-specs
MIMETYPEDIR=${DESTDIR}/share/mime/packages

help:
	@cat INSTALL

install: install-lang install-mime

install-lang:
	mkdir -p ${LANGDIR2} ${LANGDIR3}
	cp -p org.lang ${LANGDIR3}
	-ln -s ../../gtksourceview-3.0/language-specs/org.lang \
	${LANGDIR2}/org.lang

install-mime:
	mkdir -p ${MIMETYPEDIR}
	cp -p org.xml ${MIMETYPEDIR}
	(cd ${MIMETYPEDIR}/../../ && update-mime-database mime)
