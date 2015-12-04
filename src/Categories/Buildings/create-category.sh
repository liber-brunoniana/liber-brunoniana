#!/bin/bash

grep -lZ "was built" ../../Articles/*.html | while IFS= read -r -d '' file; do
	#printf '%s\n' "$file"    
	ln -s "$file" "`basename "$file"`"
done
