#!/bin/bash

make html

git checkout gh-pages
git pull

DATE=`date '+%Y-%m-%d-%H-%M-%S'`
BAK_DIR="bak-"${DATE}

mkdir -p build/${BAK_DIR}/
mv * build/${BAK_DIR}/ 2>/dev/null

cp -rf build/html/* .

git add -A

git commit -m "update docs"

#git checkout master
