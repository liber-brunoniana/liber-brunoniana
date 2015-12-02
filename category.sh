#!/bin/sh
. ./util.sh
./page.sh << _EOF_
<article id="category">
  <header id="page-header">
    <h1>`
      if [ "$1" == "./$SRC" ] ; then
        echo "$NAME"
      else
        echo "$(basename $1)"
      fi`</h1>
  </header>
  <nav id="page-nav">
    <nav id="categories">
      <h2>Categories</h2>
      <ul>
      `categories "$1"`
      </ul>
    </nav>
  </nav>
  <section id="content">
    <section id="subcategories">
      <header><h2>Subcategories</h2></header>
      <ul>
      `find "$1" -mindepth 1 -maxdepth 1 -name "[!.]*" -type d -follow -printf "%p\0" \
        | sed -e 's|$src/||g' \
        | while read -d $'' category; do
            echo "<li><a href=\"$category\">$(basename "$category" .html)</a></li>"                                            \  
          done`
      </ul>
    </section>
    <section id="pages">
      <header><h2>Pages</h2></header>
      `find "$1" -maxdepth 1 -type f -printf "%p\0" \
        | sed -e 's|src/||g' \
        | while read -d $'' article; do
            echo "<li><a href=\"$article\">$(basename "$article" .html)</a></li>"                                            \  
          done`
    </section>
  </section>
</article>
_EOF_
