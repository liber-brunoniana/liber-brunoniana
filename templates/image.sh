#!/usr/bin/env bash
. ../templates/util.sh
NAME=`basename "$1" .png`
if [ "$NAME" == "index" ] ; then
  NAME=$(dirname $1)
  if [ "$NAME" == "." ] ; then 
    NAME="$SITE_NAME"
  fi
fi
../page.sh "$NAME" <<- _EOF_
<article>
  <header><h1>$NAME</h1></header>
  <nav>
    <nav><h2>Contents</h2>
      <ol>
        <li>Header 1
        <ol><li>Header 2</li>
            <li>Header 2</li></ol></li>
        <li>Header 1</li>
        <li>Header 1</li>
      </ol>
    </nav>
    <nav><h2>Categories</h2>
      `categories "$1"`
    </nav>
  </nav>
  <figure>
    <img src="$1" width="100%" height="auto">
    <figcaption>
      <h2 name="file_usage">File Usage</h2>
      <ul>`
        
      `</ul>
    </figcaption>
  </figure>
</article>
_EOF_
