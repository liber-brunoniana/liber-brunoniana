#!/bin/bash
function categories() {
  find -L ./src -samefile "$1" -printf "%p\0"  \
    | xargs -0 dirname -z                      \
    | while read -d $'' category; do
        if [ "$category" == "." ]
        then
          echo ""
        else
          href=$(echo "$category" | sed -e "s|src/||")
          if [ "$category" == "./src" ]
          then
            text=$(realpath .. | xargs basename)
          else
            text="$(basename "$category")"
          fi
          echo "<li><a href=\"$href\">$text</a></li>"
        fi
      done
}
