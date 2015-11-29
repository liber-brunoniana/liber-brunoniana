#!/bin/sh

echo "Compiling Articles"
for source in src/**/*.html; do
  echo "Building $source"
  ( target=`echo "$source" | sed -e 's|src|build|'`
  if [ ! -e "$target" ] || [ "$target" -ot "$source" ]; then
    mkdir -p `dirname "$target"`
    ./article.sh "$source" > "$target"
  fi ) &
done


echo "Compiling Categories"
for source in src/**/; do
  echo "Building $source"
  ( 
  target=`echo "$source" | sed -e 's|src|build|'`
  if [ ! -e "$target" ]; then
    mkdir -p "$target"
    target+="index.html"
    ./category.sh "$source" > "$target"
  fi ) &
done
