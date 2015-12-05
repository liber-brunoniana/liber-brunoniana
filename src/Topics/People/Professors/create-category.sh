#!/bin/bash

#grep -lZ  "), professor of" ../*.html \
#  | while IFS= read -r -d '' file; do
#    #echo "$file"
#    ln -s "$file" "`basename "$file"`"
#    done
#!/bin/bash

find . -type l -name "*.html" -print0 \
  | while IFS= read -r -d '' file; do
    target="$(readlink "$file")"
    target="../$(readlink "$target")"
    ln -sf "$target" "$file"
    done
