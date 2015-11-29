#!/bin/sh
./page.sh << _EOF_
<article id="article">
  <header>
    <h1>`basename "$1" .html`</h1>
  </header>
  <div>
    <nav id="article-nav">
      <nav id="categories">
        <h2>Categories</h2>
        <ul>
       `find -L ./src -samefile "$1" -printf "%P\0"  \
          | xargs -0 dirname -z               \
          | while read -d $'' category; do
              echo "<li><a href=\"$category\">$(basename "$category")</a></li>"                                            \  
            done`
        </ul>
      </nav>
    </nav>
    <section id="content">
      <section>
        <header><h2>Articles</h2></header>
        `find "$1" -maxdepth 1 -type f -printf "%p\0" \
          | sed -e 's|src/||g' \
          | while read -d $'' article; do
              echo "<li><a href=\"$article\">$(basename "$article" .html)</a></li>"                                            \  
            done`
      </section>
    </section>
  </div>
</article>
_EOF_
