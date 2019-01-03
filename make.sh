#!/bin/bash

SOURCEDIR="source/$1"
BUILDDIR="docs/$1"
PARAM1=$1

function judge_lang () {
    case $PARAM1 in
        index)
            echo "Copy index"
            copy_index ;;
        en)
            echo "Building English Vesrion"
            build ;;
        zhCN)
            echo "Building Chinese Version"
            build ;;
        * )
            echo "Invalid param1: $PARAM1"
            exit ;;
    esac
}

function build() {
    sphinx-build -a -E -j auto -b html ${SOURCEDIR} ${BUILDDIR}
}

function copy_index() {
    cp -f source/index.html docs
    cp -f source/.nojekyll docs
    cp -f source/CNAME docs
}

function clean() {
    echo "clean"
}

if [ $# -gt 1 ]; then
    clean
elif [ $# -gt 0 ]; then
    judge_lang
fi
