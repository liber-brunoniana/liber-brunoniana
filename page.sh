#!/bin/sh
if [ -z "${BASE+x}" ] ; then
  BASE=$(readlink -f .. | xargs printf 'file://%s/build/');
fi
cat <<- _EOF_
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>`echo "$1"`</title>
    <link href='https://fonts.googleapis.com/css?family=Libre+Baskerville:400,700' rel='stylesheet' type='text/css'>
    <link href='$BASE/style.css' rel='stylesheet' type='text/css'>
  </head>
  <body>
    <header id="site-header">
      <h1><a href="$BASE">Encyclopedia Brunoniana</a></h1>
    </header>
    `while read line
    do
      echo "$line"
    done < "${2:-/dev/stdin}"`
  </body>
</html>
_EOF_
