#!/bin/sh
. ../util.sh
NAME=`basename "$1" .html`
if [ "$NAME" == "index" ] ; then
  NAME=$(dirname $1)
  if [ "$NAME" == "." ] ; then 
    NAME="$SITE_NAME"
  fi
fi
  
../page.sh "$NAME" << _EOF_
<article id="article">
  <header id="page-header">
    <h1>`echo "$NAME"`</h1>
  </header>
  <nav id="page-nav">
    <nav id="categories">
      <h2>Categories</h2>
      <ul>`categories "$1"`</ul>
    </nav>
  </nav>
  <section id="content">
    `cat "$1"`
  </section>
</article>
_EOF_
