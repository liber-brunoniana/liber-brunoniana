#!/bin/sh
cat << _EOF_
<!DOCTYPE html>
<html lang="en">
  <head>
    <base href="file:///home/john/projects/brunoniana/liber-brunoniana/build/"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>$1</title>
    <link href='http://fonts.googleapis.com/css?family=IM+Fell+English:400,400italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:400,400italic,700,700italic|Libre+Baskerville:400' rel='stylesheet' type='text/css'>
    <link href='../style.css' rel='stylesheet' type='text/css'>
  </head>
  <body>
    <header id="site-header">
      <h1>Encyclopedia Brunoniana</h1>
    </header>
    `while read line
    do
      echo "$line"
    done < "${1:-/dev/stdin}"`
  </body>
</html>
_EOF_
