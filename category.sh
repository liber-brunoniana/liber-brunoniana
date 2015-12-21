#!/bin/sh
. ../util.sh
../page.sh << _EOF_
<article id="category">
  <header id="page-header">
    <h1>`
    if [ "$1" == "." ] ; then 
      echo "$SITE_NAME"
    else
      echo $(basename "$1")
    fi
 `</h1>
  </header>
  <nav id="page-nav">
    <nav id="categories">
      <h2>Categories</h2>
      <ul>`categories "$1"`</ul>
    </nav>
  </nav>
  <section id="content">
    <section id="subcategories">
      <header><h2>Subcategories</h2></header>
      <ul>`
      find "$1" -mindepth 1 -maxdepth 1 -xtype d -print0               \
       | sort -z                                                       \
       | while read -d $'' category ; do
          name=$(basename "$category")
          if [ -L "$category" ] ; then
            href=$(readlink "$category")
          else
            href=$(realpath "$category" --relative-to "$1")
          fi
          printf "<a href=\"%s\">%s</a>\0" "$href" "$name"
        done | li
   `</ul>
    </section>
    <section id="pages">
      <header><h2>Pages</h2></header>
      <ul>`
      find "$1" -maxdepth 1 -xtype f -name "*.html" -print0            \
        | sort -z                                                      \
        | while read -d $'' article
          do
            name=$(basename "$article" .html)
            if [ -L "$article" ] ; then
              href=$(readlink "$article")
            else
              href=$(realpath "$article" --relative-to "$1")
            fi
            printf "<a href=\"%s\">%s</a>\0" "$href" "$name"
          done | li
     `</ul>
    </section>
  </section>
</article>
_EOF_
