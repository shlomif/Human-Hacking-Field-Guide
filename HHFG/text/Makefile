STORY = human-hacking-field-guide-v2
HEB_STORY = $(STORY)--hebrew
ENG_STORY = $(STORY)--english

FICTION_TEXTS = $(HEB_STORY)

include $(SCREENPLAY_COMMON_INC_DIR)/fictions_common.mak

$(filter %--hebrew.db5.xml,$(DOCS_FICTION_DB5)): %.db5.xml: %.fiction-xml.xml
	perl -MXML::Grammar::Fiction::App::ToDocBook -e 'run()' -- \
		-o $@ $<

$(ENG_EPUB) : $(ENG_DB_PROCESSED) $(ENG_EPUB_XSLT)
	ruby $(EPUB_SCRIPT) -s $(ENG_EPUB_XSLT) -o $@ $(ENG_DB_PROCESSED)
