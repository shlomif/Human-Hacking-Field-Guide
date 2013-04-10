#!/bin/bash
ruby /home/shlomif/Download/unpack/file/docbook/docbook-xsl-ns-snapshot/epub/bin/dbtoepub -s "$(pwd)/docbook-epub-preproc.xslt" -o human-hacking-field-guide--english.epub human-hacking-field-guide--english.db5.xml
