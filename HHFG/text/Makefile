STORY = human-hacking-field-guide-v2
HEB_STORY = $(STORY)--hebrew
ENG_STORY = $(STORY)--english

FICTION_TEXTS = $(HEB_STORY)

include $(SCREENPLAY_COMMON_INC_DIR)/fictions_common.mak

$(filter %--hebrew.db5.xml,$(DOCS_FICTION_DB5)): %.db5.xml: %.fiction-xml.xml
	perl -MXML::Grammar::Fiction::App::ToDocBook -e 'run()' -- \
		-o $@ $<

# DOCBOOK_RNG = http://www.docbook.org/xml/5.0/rng/docbook.rng

DOCBOOK_RNG = ./rng/docbook.rng

JING = jing $(DOCBOOK_RNG)

XSL_SNAPSHOT_HOME = $(HOME)/Download/unpack/file/docbook/docbook-xsl-ns-snapshot
# XSL_SNAPSHOT_HOME = $(HOME)/Download/unpack/file/docbook/docbook-xsl-snapshot/

EPUB_SCRIPT = $(XSL_SNAPSHOT_HOME)/epub/bin/dbtoepub

$(ENG_EPUB) : $(ENG_DB_PROCESSED) $(ENG_EPUB_XSLT)
	$(JING) $<
	ruby $(EPUB_SCRIPT) -s $(ENG_EPUB_XSLT) -o $@ $(ENG_DB_PROCESSED)

$(DOCS_FICTION_HTML_FOR_OOO): %.for-openoffice.html: %.xhtml
	cat $< | perl -lne 's{(</title>)}{$${1}<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />}; print unless m{\A<\?xml}' > $@

oohtml: $(ENG_HTML_FOR_OOO) $(HEB_HTML_FOR_OOO)

openoffice: oohtml
	ooffice3.2 $(ENG_HTML_FOR_OOO)

.PHONY: epub_ff

epub: $(ENG_EPUB)

epub_ff: epub
	firefox $(ENG_EPUB)

epub_ok: epub
	okular $(ENG_EPUB)

%.show:
	@echo "$* = $($*)"

clean:
	rm -f $(DOCS_FICTION_XHTML) $(DOCS_FICTION_XML) $(HEB_STORY).db5.xml $(ENG_EPUB)

# EPUB generation reproducing bug.

EP = epub_repr
EPUB_GEN_BUG_ARC = $(EP).zip
EPUB_GEN_BUG_SCRIPT = epub-build.bash

epub_gen_bug: $(EPUB_GEN_BUG_ARC)

EPUB_GEN_BUG_FILES = $(ENG_DB_PROCESSED) $(ENG_EPUB_XSLT) $(EPUB_GEN_BUG_SCRIPT)

$(EPUB_GEN_BUG_ARC): $(EPUB_GEN_BUG_FILES)
	mkdir $(EP)
	cp $(EPUB_GEN_BUG_FILES) $(EP)/
	zip -r $(EPUB_GEN_BUG_ARC) $(EP)
	rm -fr ./$(EP)

epub_gen_bug_upload: epub_gen_bug
	rsync -v --progress -a $(EPUB_GEN_BUG_ARC) $${__HOMEPAGE_REMOTE_PATH}/temp-db5-epub/
