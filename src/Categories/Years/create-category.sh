#!/bin/sh
find ../../Articles/ -name "[[:digit:]][[:digit:]][[:digit:]][[:digit:]].html" -print0 | while IFS= read -r -d '' file; do
  ln -s "$file" "`basename "$file"`"
done
