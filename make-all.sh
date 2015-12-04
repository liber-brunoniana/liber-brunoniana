#!/bin/sh
export SRC="src"
export SITE_NAME="Liber Brunoniana"
rm -rf "build"
mkdir -p "build"
pushd "$SRC" >/dev/null
echo "Compiling Categories"

find . -type d -print0 | while read -d $'' source; do
 (target="../build/$source"
  mkdir -p "$target"
  target+="/index.html"
  ../category.sh "$source" > "$target"
  echo "$source") &
done

echo "Compiling Articles"
find . -type f -name "*.html" -print0 | while read -d $'' source ; do
  echo "$source"
 (target="../build/$source"
  if [ ! -e "$target" ] || [ "$target" -ot "$source" ]; then
    echo "$source"
    mkdir -p `dirname "../build/$target"`
    ../article.sh "$source" > "$target"
  fi) &
done && wait
    
popd >/dev/null
cp ./style.css ./build/style.css



