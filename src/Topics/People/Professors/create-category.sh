#!/bin/bash

grep -lZ  "), professor of" ../*.html \
  | while IFS= read -r -d '' file; do
    #echo "$file"
    ln -s "$file" "`basename "$file"`"
    done
