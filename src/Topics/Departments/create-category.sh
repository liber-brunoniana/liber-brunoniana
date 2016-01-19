#!/bin/bash

$(find . -type l -name "*.md" -print0 \
  | while IFS= read -r -d '' file; do
    target="$(readlink "$file")"
    target=`echo "$target" | sed 's|.md|.html|'`
    target=`echo "$target" | sed 's|articles|Articles|'`
    ln -sf "$target" "$file"
    done)
rename .md .html *.md
