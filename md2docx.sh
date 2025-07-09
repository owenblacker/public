#!/bin/bash
for filename in *.md; do
    base=${filename%.md}
    [ -e "$filename" ] || continue
    [ ! -e "$base.docx" ] || continue
    pandoc -f markdown -t docx -o "$base.docx" "$filename"
done