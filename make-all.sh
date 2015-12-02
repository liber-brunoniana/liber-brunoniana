#!/bin/sh
export SRC="src"
export NAME="Liber Brunoniana"
echo "Compiling Categories"
find ./src -type d -print0 | while read -d $'' source; do
  echo "$source"
  target=`echo "$source" | sed -e 's|src|build|'`
  if [ ! -e "$target" ]; then
    mkdir -p "$target"
    target+="/index.html"
    ./category.sh "$source" > "$target"
  fi
done

echo "Compiling Articles"
find ./src  -name "*.html" -print0 | while read -d $'' source; do
  (target=`echo "$source" | sed -e 's|src|build|'`
  if [ ! -e "$target" ] || [ "$target" -ot "$source" ]; then
    echo "$source"
    mkdir -p `dirname "$target"`
    ./article.sh "$source" > "$target"
  fi) &
done

wait

cp ./style.css ./build/style.css
