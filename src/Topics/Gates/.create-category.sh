#!/bin/bash

find ../../articles -type f \( -name "*Gate*" \) -print0 | while IFS= read -r -d '' file; 
do
	#printf '%s\n' "$file"    
	ln -s "$file" "`basename "$file"`"
done
