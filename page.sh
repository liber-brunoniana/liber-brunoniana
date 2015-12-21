#!/bin/sh
if [ -z "${BASE+x}" ] ; then
  BASE=$(readlink -f .. | xargs printf 'file://%s/build/');
fi
cat <<- _EOF_
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>$1</title>
    <link rel="stylesheet" type="text/css" href="https://necolas.github.io/normalize.css/3.0.2/normalize.css" />
    <link href='$BASE/style.css' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Libre+Baskerville:400,400italic,700' rel='stylesheet' type='text/css'>
  </head>
  <body>
    <header>
      <em><a href="$BASE">Encyclopedia Brunoniana</a></em>
    </header>
    <main>
      `while read line
      do
        echo "      $line"
      done < "${2:-/dev/stdin}"`
    </main>
  </body>
</html>
_EOF_
