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
