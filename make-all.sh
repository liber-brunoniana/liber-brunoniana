#!/usr/bin/env bash
export SRC="src"
export SITE_NAME="Liber Brunoniana"
rm -rf "build"
mkdir -p "build"
pushd "$SRC" >/dev/null

find . -type d -print0 \
  | while read -d $'' source
  do
   (target="../build/$source"
    mkdir -p "$target"
    ../templates/category.sh "$source" > "$target/index.html")
  done

find . -type f -name "*.html" -print0 \
  | while read -d $'' source
    do
     (target="../build/$source"
      if [ ! -e "$target" ] \
      || [ $(basename "$source") == "index.html" ] \
      || [ "$target" -ot "$source" ]; then
        [ -e "$target" ] && rm "$target"
        mkdir -p `dirname "../build/$target"`
        ../templates/article.sh "$source" > "$target"
      fi)
    done && wait
    
find . -type f -name "*.png" -print0 \
  | while read -d $'' source
    do
     (target="../build/$source"
      if [ ! -e "$target" ] \
      || [ $(basename "$source") == "index.html" ] \
      || [ "$target" -ot "$source" ]; then
        [ -e "$target" ] && rm "$target"
        mkdir -p `dirname "../build/$target"`
        ../templates/article.sh "$source" > "$target"
      fi)
    done && wait

    
popd >/dev/null
cp ./style.css ./build/style.css



