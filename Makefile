all: _site/index.html

.PHONY: _site/index.html watch install

_site/index.html: site
	./site rebuild

watch: site
	./site watch

install:
	cp -r _site/* ${DESTDIR}

site: site.hs
	ghc --make site.hs
