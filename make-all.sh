#!/bin/sh

echo "Compiling Categories"
for source in src/**/; do
  echo "Building $source"
  target=`echo "$source" | sed -e 's|src|build|'`
  if [ ! -e "$target" ]; then
    mkdir -p "$target"
    target+="index.html"
    echo "Writing $target"
    ./category.sh "$source" > "$target"
  fi
done

echo "Compiling Articles"
for source in src/**/*.html; do
  ( target=`echo "$source" | sed -e 's|src|build|'`
  if [ ! -e "$target" ] || [ "$target" -ot "$source" ]; then
    echo "Building $source"
    mkdir -p `dirname "$target"`
    ./article.sh "$source" > "$target"
  fi ) &
done

wait

cp ./style.css ./build/style.css
