#!/bin/bash

dir=`mktemp -d` && pushd $dir  >/dev/null
echo $dir
git clone https://github.com/liber-brunoniana/liber-brunoniana.git .
export BASE="http://liber-brunoniana.github.io/"
./make-all.sh
pushd build  >/dev/null
git init
git remote add origin https://github.com/liber-brunoniana/liber-brunoniana.github.io.git
git add -A .
git commit -am 'new publication'
git push -u origin master --force
popd >/dev/null
popd >/dev/null
rm -rf $dir
unset $BASE
