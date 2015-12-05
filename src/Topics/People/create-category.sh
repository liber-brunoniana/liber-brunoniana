#!/bin/bash

find ../../Articles -type f -name "*,*" -print0 | while IFS= read -r -d '' file; do
	#printf '%s\n' "$file"    
	ln -s "$file" "`basename "$file"`"
done
