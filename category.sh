#!/bin/sh
cat | ./page.sh << _EOF_
<article id="category">
  <header>
    <h1>`basename "$1"`</h1>
  </header>
  <div>
    <nav id="article-nav">
      <nav id="categories">
        <h2>Categories</h2>
        <ul>
       `find -L ./ -samefile "$1" -print0  \
          | xargs -0 dirname -z            \
          | sed 's|./src/|./|'             \
          | while read -d $'' category; do
              echo "<li><a href=\"$category\">$(basename "$category")</a></li>"                                            \  
            done`
        </ul>
      </nav>
    </nav>
    <section id="content">
      <section>
        <header><h2>Subcategories</h2></header>

      </section>
      <section>
        <header><h2>Articles</h2></header>
        `find "$1" -type f -maxdepth 1 -print0  \
          | sed 's|src/||g'             \
          | while read -d $'' article; do
              echo "<li><a href=\"$article\">$(basename "$article" .html)</a></li>"                                            \  
            done`
      </section>
    </section>
  </div>
</article>
_EOF_
