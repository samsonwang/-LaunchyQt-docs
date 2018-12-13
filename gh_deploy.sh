#!/bin/bash

make html

git checkout gh-pages
git pull

DATE=`date '+%Y-%m-%d-%H-%M-%S'`
BAKDIR="bak-"${DATE}

mkdir -p build/${BAKDIR}/
mv * build/${BAKDIR}/ 2>/dev/null

cp -rf build/html/* .

#git checkout master
