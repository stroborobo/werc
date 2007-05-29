#!/bin/sh
for d in sites/*/; do
    find $d -name '*.md'|sed -e 's/\.md$//' -e 's,/index$,/,' -e 's,^sites/,http://,' > $d/sitemap.txt
done

