#!/bin/sh

find . -name '*.md'|sed -e 's/\.md$//' -e 's,/index$,/,' -e 's,^\.,http://harmful.cat-v.org,'

