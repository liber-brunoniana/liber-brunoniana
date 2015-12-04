#!/bin/bash
function categories() {
  find -L . -samefile "$1" -print0  \
    | xargs -0 dirname -z           \
    | while read -d $'' category
    do
      href=`realpath "$category" --relative-to "$1"`
      name=`basename "$category"` 
      if [ "$name" == "." ] ; then 
        name="$SITE_NAME"
      fi
      echo "<li><a href=\"$href\">$name</a></li>"
    done
}
